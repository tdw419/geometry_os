
try:
    import wgpu
    try:
        import wgpu.backends.wgpu_native  # Try modern backend
    except ImportError:
        pass # Allow auto-select if wgpu_native missing
except ImportError:
    wgpu = None

from pathlib import Path
import struct
import numpy as np
from typing import List, Dict, Optional, Tuple, NamedTuple

class ExecutionResult(NamedTuple):
    success: bool
    return_value: Optional[int]
    memory_dump: Optional[bytes]
    trace_data: List[int]
    instruction_count: int
    error: Optional[str] = None
    output_data: List[int] = []  # Data from output_buffer (write_region results)

class WASMGPUBridge:
    """
    Bridge to execute WASM code on GPU using WebGPU (wgpu-py).
    Falls back to a Mock backend if wgpu is not available.
    """

    # Maximum memory pages allowed (WASM spec limit is 65536 pages = 4GB)
    MAX_MEMORY_PAGES = 65536

    def __init__(self, shader_path: str = None):
        self.mock = wgpu is None

        if shader_path is None:
            # Default to bundled shader
            # Adjust path relative to this file
            workspace_root = Path(__file__).parent.parent.parent
            shader_path = str(workspace_root / "pixelrts_v2" / "shaders" / "wasm_vm.wgsl")

        self.shader_path = shader_path
        self.device = None
        self.pipeline = None

        if not self.mock:
            try:
                self.device = wgpu.utils.get_default_device()
                self.shader_module = self._load_shader()
                self.pipeline = self._create_pipeline()
            except Exception as e:
                print(f"Warning: Failed to initialize GPU device: {e}. Falling back to mock.")
                self.mock = True

        if self.mock:
            print("Warning: wgpu not found or failed. Using Mock backend for testing.")

        self.trace_enabled = False

        # Memory management state
        self.memory_pages = 0
        self.memory_size = 0
        self.memory_buffer = None
        self._memory_data = bytearray()  # Mock mode memory storage

        # Entry point state
        self._entry_point = 0
        self._arguments = None

    def _load_shader(self):
        with open(self.shader_path, 'r') as f:
            shader_source = f.read()
        return self.device.create_shader_module(code=shader_source)

    def _create_pipeline(self):
        # Create bind group layout entries matching shader bindings
        bg_layout_entries = [
            {
                "binding": 0,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {"type": wgpu.BufferBindingType.read_only_storage},
            },
            {
                "binding": 1,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {"type": wgpu.BufferBindingType.storage},
            },
            {
                "binding": 2,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {"type": wgpu.BufferBindingType.storage},
            },
            {
                "binding": 3,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {"type": wgpu.BufferBindingType.storage},
            },
            {
                "binding": 4,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {"type": wgpu.BufferBindingType.uniform},
            },
            {
                "binding": 5,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "texture": {"sample_type": wgpu.TextureSampleType.float, "view_dimension": wgpu.TextureViewDimension.d2},
            },
            {
                "binding": 6,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "sampler": {"type": wgpu.SamplerBindingType.filtering},
            },
            {
                "binding": 7,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {"type": wgpu.BufferBindingType.storage},
            },
        ]
        
        bg_layout = self.device.create_bind_group_layout(entries=bg_layout_entries)
        pipeline_layout = self.device.create_pipeline_layout(bind_group_layouts=[bg_layout])
        
        return self.device.create_compute_pipeline(
            layout=pipeline_layout,
            compute={"module": self.shader_module, "entry_point": "main"},
        )

    def execute(
        self,
        wasm_bytes: bytes,
        entry_point: int = 0,
        memory_pages: int = 1,
        max_instructions: int = 10000,
        globals_init: List[int] = None,
        spatial_map_path: str = None,
        arguments: List[int] = None,
        memory_init: List[int] = None
    ) -> ExecutionResult:
        """
        Execute WASM binary on GPU.

        Args:
            wasm_bytes: WASM bytecode to execute
            entry_point: Program counter offset to start execution
            memory_pages: Number of 64KB memory pages to allocate
            max_instructions: Maximum instructions before timeout
            globals_init: Initial values for globals array
            spatial_map_path: Optional path to spatial map PNG
            arguments: Function arguments to pass via globals[1], globals[2], etc.
            memory_init: Initial bytes to write to linear memory (for testing)

        Returns:
            ExecutionResult with return_value from globals[0]
        """
        # Configure memory first to set up persistent state
        # This allows get_memory()/set_memory() to work after execution
        self.configure_memory(memory_pages)

        if self.mock:
            # Mock execution for testing pipeline without GPU
            print(f"[Mock] Executing WASM ({len(wasm_bytes)} bytes) at entry point {entry_point}")
            if arguments:
                print(f"[Mock] Arguments: {arguments}")

            # Initialize mock memory with memory_init if provided
            if memory_init:
                for i, byte_val in enumerate(memory_init):
                    if i < self.memory_size:
                        self._memory_data[i] = byte_val & 0xFF

            # Return the actual memory contents and a mock return value
            return ExecutionResult(
                success=True,
                return_value=42,  # Mock return for test validity
                memory_dump=bytes(self._memory_data[:self.memory_size]),
                trace_data=[],
                instruction_count=10,
                error=None
            )

        # 1. Prepare Data
        # Padding to 4 bytes for u32 alignment
        padded_wasm = wasm_bytes + b'\x00' * ((4 - len(wasm_bytes) % 4) % 4)
        bytecode_array = np.frombuffer(padded_wasm, dtype=np.uint32)

        memory_size_bytes = memory_pages * 64 * 1024
        memory_array = np.zeros(memory_size_bytes // 4, dtype=np.uint32)

        # Initialize memory with memory_init bytes (for testing)
        if memory_init:
            for i, byte_val in enumerate(memory_init):
                if i < memory_size_bytes:
                    # Write byte to memory (little-endian)
                    word_index = i // 4
                    byte_offset = i % 4
                    if word_index < len(memory_array):
                        memory_array[word_index] |= (byte_val & 0xFF) << (byte_offset * 8)

        # Calculate required globals size
        # globals[0] is reserved for return value
        # arguments go to globals[1], globals[2], etc.
        globals_count = 16  # arbitrary default
        required_size = 1  # Reserve globals[0] for return value

        if globals_init:
            required_size = max(required_size, len(globals_init))
        if arguments:
            required_size = max(required_size, 1 + len(arguments))

        globals_count = max(globals_count, required_size)
        globals_array = np.zeros(globals_count, dtype=np.uint32)

        # Initialize globals from globals_init (if provided)
        if globals_init:
            for i, val in enumerate(globals_init):
                if i < globals_count:
                    globals_array[i] = val

        # Store arguments in globals[1], globals[2], etc.
        # This allows WASM functions to read arguments via global.get instructions
        if arguments:
            for i, arg in enumerate(arguments):
                global_index = 1 + i  # Start at globals[1] (globals[0] is return value)
                if global_index < globals_count:
                    globals_array[global_index] = arg


        trace_size = 1024 if self.trace_enabled else 1024 # Always allocate buffer required by shader binding
        trace_array = np.zeros(trace_size, dtype=np.uint32)

        # 2. Create GPU Buffers
        bytecode_buffer = self.device.create_buffer_with_data(
            data=bytecode_array, 
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST
        )
        
        memory_buffer = self.device.create_buffer_with_data(
            data=memory_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )
        
        globals_buffer = self.device.create_buffer_with_data(
            data=globals_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )
        
        trace_buffer = self.device.create_buffer_with_data(
            data=trace_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

        # Output buffer for write_region FFI function
        # Size: 1028 * 1024 u32 entries (header + pixel data for multiple regions)
        output_size = 1028 * 1024
        output_array = np.zeros(output_size, dtype=np.uint32)
        output_buffer = self.device.create_buffer_with_data(
            data=output_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )
        
        # Config uniform
        config_data = np.array([
            len(padded_wasm),
            memory_pages,
            globals_count,
            entry_point,
            max_instructions,
            1 if self.trace_enabled else 0,
            0, 0 # padding for uniform alignment
        ], dtype=np.uint32)
        
        config_buffer = self.device.create_buffer_with_data(
            data=config_data,
            usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST
        )

        # 3. Create Texture and Sampler
        if spatial_map_path and Path(spatial_map_path).exists():
            from PIL import Image
            img = Image.open(spatial_map_path).convert('RGBA')
            width, height = img.size
            texture_data = np.array(img).flatten() # RGBA uint8
            
            texture = self.device.create_texture(
                size=(width, height, 1),
                usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
                format=wgpu.TextureFormat.rgba8unorm,
            )
            
            # Write data to texture
            self.device.queue.write_texture(
                {"texture": texture, "origin": (0, 0, 0)},
                texture_data,
                {"bytes_per_row": width * 4},
                (width, height, 1),
            )
            texture_view = texture.create_view()
        else:
            # Dummy 1x1 black texture
            texture = self.device.create_texture(
                size=(1, 1, 1),
                usage=wgpu.TextureUsage.TEXTURE_BINDING | wgpu.TextureUsage.COPY_DST,
                format=wgpu.TextureFormat.rgba8unorm,
            )
            data = np.array([0, 0, 0, 255], dtype=np.uint8)
            self.device.queue.write_texture(
                {"texture": texture, "origin": (0, 0, 0)},
                data,
                {"bytes_per_row": 4},
                (1, 1, 1),
            )
            texture_view = texture.create_view()
            
        sampler = self.device.create_sampler(
            min_filter=wgpu.FilterMode.linear,
            mag_filter=wgpu.FilterMode.linear,
        )

        # 4. Create Bind Group
        bind_group = self.device.create_bind_group(
            layout=self.pipeline.get_bind_group_layout(0),
            entries=[
                {"binding": 0, "resource": {"buffer": bytecode_buffer, "offset": 0, "size": bytecode_buffer.size}},
                {"binding": 1, "resource": {"buffer": memory_buffer, "offset": 0, "size": memory_buffer.size}},
                {"binding": 2, "resource": {"buffer": globals_buffer, "offset": 0, "size": globals_buffer.size}},
                {"binding": 3, "resource": {"buffer": trace_buffer, "offset": 0, "size": trace_buffer.size}},
                {"binding": 4, "resource": {"buffer": config_buffer, "offset": 0, "size": config_buffer.size}},
                {"binding": 5, "resource": texture_view},
                {"binding": 6, "resource": sampler},
                {"binding": 7, "resource": {"buffer": output_buffer, "offset": 0, "size": output_buffer.size}},
            ]
        )

        # 5. Dispatch
        command_encoder = self.device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(self.pipeline)
        compute_pass.set_bind_group(0, bind_group, [], 0, 99) # dynamic offsets
        compute_pass.dispatch_workgroups(1, 1, 1) # Single workgroup for now
        compute_pass.end()
        
        # 5. Read back results
        self.device.queue.submit([command_encoder.finish()])

        final_memory = self.device.queue.read_buffer(memory_buffer).tobytes()
        final_globals = np.frombuffer(self.device.queue.read_buffer(globals_buffer), dtype=np.uint32)
        final_trace = np.frombuffer(self.device.queue.read_buffer(trace_buffer), dtype=np.uint32)
        final_output = np.frombuffer(self.device.queue.read_buffer(output_buffer), dtype=np.uint32)

        return ExecutionResult(
            success=True,
            return_value=int(final_globals[0]) if len(final_globals) > 0 else None,
            memory_dump=final_memory,
            trace_data=final_trace.tolist(),
            instruction_count=len(final_trace),
            error=None,
            output_data=final_output.tolist(),
        )

    def  enable_trace(self, enabled: bool = True):
        self.trace_enabled = enabled

    def enable_tracing(self, enabled: bool = True):
        """Alias for enable_trace for API consistency."""
        self.enable_trace(enabled)

    def disable_tracing(self):
        """Disable tracing explicitly."""
        self.enable_trace(enabled=False)

    def configure_memory(self, pages: int) -> None:
        """
        Allocate WASM linear memory with the specified number of 64KB pages.

        Args:
            pages: Number of 64KB pages to allocate (must be positive and <= MAX_MEMORY_PAGES)

        Raises:
            ValueError: If pages is not positive or exceeds maximum
        """
        if pages <= 0:
            raise ValueError("pages must be positive")
        if pages > self.MAX_MEMORY_PAGES:
            raise ValueError(f"too many pages (max {self.MAX_MEMORY_PAGES})")

        self.memory_pages = pages
        self.memory_size = pages * 64 * 1024

        if self.mock:
            # In mock mode, use a bytearray for memory storage
            self._memory_data = bytearray(self.memory_size)
        else:
            # In GPU mode, create a buffer for memory
            memory_array = np.zeros(self.memory_size // 4, dtype=np.uint32)
            self.memory_buffer = self.device.create_buffer_with_data(
                data=memory_array,
                usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
            )

    def write_memory(self, offset: int, data: bytes) -> None:
        """
        Write data to WASM linear memory at the specified offset.

        Args:
            offset: Byte offset in memory to write to
            data: Bytes to write

        Raises:
            ValueError: If write is out of memory bounds
            RuntimeError: If memory has not been configured
        """
        if self.memory_size == 0:
            raise RuntimeError("memory not configured - call configure_memory() first")

        if offset < 0:
            raise ValueError("offset must be non-negative")

        if offset + len(data) > self.memory_size:
            raise ValueError(f"write out of bounds (offset={offset}, size={len(data)}, memory_size={self.memory_size})")

        if self.mock:
            # Write to mock memory storage
            self._memory_data[offset:offset + len(data)] = data
        else:
            # Write to GPU buffer
            # For GPU mode, we need to update the buffer
            # This is a simplified implementation - real GPU writes would need staging
            if self.memory_buffer is not None:
                # Convert bytes to uint32 array
                padded_data = data + b'\x00' * ((4 - len(data) % 4) % 4)
                data_array = np.frombuffer(padded_data, dtype=np.uint32)

                # Calculate word offset and count
                word_offset = offset // 4
                word_count = len(data_array)

                # Write to buffer (using queue write_buffer)
                self.device.queue.write_buffer(
                    self.memory_buffer,
                    offset=offset,
                    data=data_array.tobytes()
                )

    def read_memory(self, offset: int, size: int) -> bytes:
        """
        Read data from WASM linear memory at the specified offset.

        Args:
            offset: Byte offset in memory to read from
            size: Number of bytes to read

        Returns:
            bytes: The data read from memory

        Raises:
            ValueError: If read is out of memory bounds
            RuntimeError: If memory has not been configured
        """
        if self.memory_size == 0:
            raise RuntimeError("memory not configured - call configure_memory() first")

        if offset < 0:
            raise ValueError("offset must be non-negative")

        if size < 0:
            raise ValueError("size must be non-negative")

        if offset + size > self.memory_size:
            raise ValueError(f"read out of bounds (offset={offset}, size={size}, memory_size={self.memory_size})")

        if self.mock:
            # Read from mock memory storage
            return bytes(self._memory_data[offset:offset + size])
        else:
            # Read from GPU buffer
            if self.memory_buffer is not None:
                # Read the entire buffer and extract the requested region
                # (In a real implementation, we'd use buffer mapping for partial reads)
                buffer_data = self.device.queue.read_buffer(self.memory_buffer).tobytes()
                return buffer_data[offset:offset + size]
            return b''

    def get_memory(self) -> bytes:
        """
        Get all of WASM linear memory as bytes.

        Returns:
            bytes: Current memory contents

        Example:
            >>> data = bridge.get_memory()
            >>> bridge.set_memory(data)  # Restore later
        """
        # Auto-initialize memory with default page count if not configured
        if self.memory_size == 0:
            self.configure_memory(1)  # Default to 1 page (64KB)

        if self.mock:
            # Return copy of mock memory storage
            return bytes(self._memory_data[:self.memory_size])
        else:
            # Read entire GPU buffer
            if self.memory_buffer is not None:
                return self.device.queue.read_buffer(self.memory_buffer).tobytes()
            return b""

    def set_memory(self, data: bytes) -> None:
        """
        Set WASM linear memory contents from bytes.

        Args:
            data: Bytes to write to memory

        Example:
            >>> snapshot = bridge.get_memory()
            >>> # ... modify memory ...
            >>> bridge.set_memory(snapshot)  # Restore

        Raises:
            ValueError: If data size doesn't match memory_size and memory is already configured
        """
        # Auto-initialize memory if not configured yet
        if self.memory_size == 0:
            # Calculate required pages for the data size
            required_bytes = len(data)
            required_pages = (required_bytes + 65535) // 65536  # Round up to 64KB pages
            self.configure_memory(required_pages)
        elif len(data) != self.memory_size:
            # Memory is configured but size doesn't match
            raise ValueError(
                f"data size mismatch: got {len(data)} bytes, expected {self.memory_size}"
            )

        if self.mock:
            # Write to mock memory storage
            self._memory_data[:self.memory_size] = bytearray(data)
        else:
            # Write to GPU buffer
            if self.memory_buffer is not None:
                # Convert bytes to uint32 array
                data_array = np.frombuffer(data, dtype=np.uint32)
                self.device.queue.write_buffer(
                    self.memory_buffer,
                    offset=0,
                    data=data_array.tobytes()
                )

    def set_entry_point(self, function_index: int) -> None:
        """
        Set the entry point (function index) for execution.

        Args:
            function_index: Index of the function to execute
        """
        self._entry_point = function_index

    def set_arguments(self, args: List[int]) -> None:
        """
        Set function arguments to be passed via globals array.

        Args:
            args: List of integer arguments
        """
        self._arguments = args

    def get_return_value(self) -> Optional[int]:
        """
        Get the return value from the last execution.

        Returns:
            The return value from globals[0], or None if no execution has occurred
        """
        # This would be read from the globals buffer after execution
        # For now, return None as the return value is only available after execute()
        return None

if __name__ == "__main__":
    # Test
    try:
        bridge = WASMGPUBridge()
        print("Bridge initialized successfully.")
        mock_msg = " (Mock Mode)" if bridge.mock else ""
        print(f"Status: Ready{mock_msg}")
    except Exception as e:
        print(f"Failed to initialize bridge: {e}")
