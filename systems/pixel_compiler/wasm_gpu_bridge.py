"""
WASM GPU Bridge for PixelRTS

Connects Python to the GPU WASM VM shader (wasm_vm_complete.wgsl).
Enables execution of WebAssembly binaries on GPU through wgpu.

Buffer Layout (matches wasm_vm_complete.wgsl):
- @group(0) @binding(0) var<storage, read> wasm_bytecode: array<u32>
- @group(0) @binding(1) var<storage, read_write> linear_memory: array<u32>
- @group(0) @binding(2) var<storage, read_write> globals: array<u32>
- @group(0) @binding(3) var<storage, read_write> execution_trace: array<u32>
- @group(0) @binding(4) var<uniform> vm_config: VMConfig
"""
import wgpu
import numpy as np
import struct
from dataclasses import dataclass
from typing import List, Dict, Optional, Any
from pathlib import Path


# Constants for WASM memory
WASM_PAGE_SIZE: int = 65536  # 64KB per WASM memory page


@dataclass
class ExecutionResult:
    """
    Result of WASM execution on GPU.

    Attributes:
        completed: Whether execution completed normally
        steps: Number of instructions executed
        error: Optional error message if execution failed
    """
    completed: bool
    steps: int
    error: Optional[str] = None


class WASMGPUBridge:
    """
    Bridge between Python and GPU-based WASM VM shader.

    Provides methods to load WASM bytecode, configure memory, execute
    on GPU, and read back results.
    """

    # VMConfig struct size (6 u32 values)
    VM_CONFIG_SIZE: int = 6 * 4  # 6 uint32 values * 4 bytes each

    def __init__(self, shader_path: str):
        """
        Initialize wgpu device and load WASM VM shader.

        Args:
            shader_path: Path to wasm_vm_complete.wgsl shader file
        """
        # Initialize WGPU device
        self.adapter = wgpu.gpu.request_adapter(
            canvas=None,
            power_preference="high-performance"
        )
        self.device = self.adapter.request_device()

        # Load and compile shader
        with open(shader_path, 'r') as f:
            shader_code = f.read()
        self.shader_module = self.device.create_shader_module(code=shader_code)

        # State (set by configure_memory and load_wasm)
        self.memory_pages: int = 0
        self.memory_buffer: Optional[wgpu.GPUBuffer] = None
        self.bytecode_buffer: Optional[wgpu.GPUBuffer] = None
        self.globals_buffer: Optional[wgpu.GPUBuffer] = None
        self.trace_buffer: Optional[wgpu.GPUBuffer] = None
        self.config_buffer: Optional[wgpu.GPUBuffer] = None

        # Bytecode size (set by load_wasm)
        self.bytecode_size: int = 0

    def load_wasm(self, wasm_bytes: bytes) -> None:
        """
        Upload WASM bytecode to GPU storage buffer.

        The WASM bytecode is converted to u32 array and uploaded to
        the wasm_bytecode buffer.

        Args:
            wasm_bytes: Raw WASM binary data
        """
        self.bytecode_size = len(wasm_bytes)

        # Pad to multiple of 4 bytes for u32 array
        padded_size = (self.bytecode_size + 3) // 4 * 4
        padded_bytes = wasm_bytes + b'\x00' * (padded_size - self.bytecode_size)

        # Convert to u32 array (little-endian)
        wasm_u32 = np.frombuffer(padded_bytes, dtype=np.uint32)

        # Create GPU buffer and upload bytecode
        self.bytecode_buffer = self.device.create_buffer_with_data(
            data=wasm_u32,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_DST
        )

    def configure_memory(self, memory_pages: int = 256, num_globals: int = 1024) -> None:
        """
        Allocate WASM linear memory and globals on GPU.

        Args:
            memory_pages: Number of 64KB pages to allocate
            num_globals: Number of global variables to allocate
        """
        self.memory_pages = memory_pages

        # Calculate memory buffer size (in u32 elements)
        memory_bytes = memory_pages * WASM_PAGE_SIZE
        memory_u32_count = memory_bytes // 4

        # Create linear memory buffer (initialized to zeros)
        memory_array = np.zeros(memory_u32_count, dtype=np.uint32)
        self.memory_buffer = self.device.create_buffer_with_data(
            data=memory_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )

        # Create globals buffer (initialized to zeros)
        globals_array = np.zeros(num_globals, dtype=np.uint32)
        self.globals_buffer = self.device.create_buffer_with_data(
            data=globals_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC | wgpu.BufferUsage.COPY_DST
        )

        # Create trace buffer (for execution trace)
        # Allocate space for 10000 trace entries (u32 each)
        trace_size = 10000
        self.trace_buffer = self.device.create_buffer(
            size=trace_size * 4,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

    def execute(
        self,
        max_instructions: int = 100000,
        entry_point: int = 0,
        trace_enabled: bool = False
    ) -> ExecutionResult:
        """
        Dispatch GPU compute to execute WASM bytecode.

        Args:
            max_instructions: Maximum number of instructions to execute
            entry_point: Function index to start execution from
            trace_enabled: Whether to enable execution tracing

        Returns:
            ExecutionResult with completion status and step count
        """
        if self.bytecode_buffer is None:
            raise RuntimeError("No WASM bytecode loaded. Call load_wasm() first.")
        if self.memory_buffer is None:
            raise RuntimeError("No memory configured. Call configure_memory() first.")

        # Create VM config uniform buffer
        config_array = np.array([
            self.bytecode_size,      # bytecode_size
            self.memory_pages,       # memory_size (in pages)
            1024,                    # num_globals (placeholder)
            entry_point,             # entry_point
            max_instructions,        # max_instructions
            1 if trace_enabled else 0,  # trace_enabled
        ], dtype=np.uint32)

        self.config_buffer = self.device.create_buffer_with_data(
            data=config_array,
            usage=wgpu.BufferUsage.UNIFORM | wgpu.BufferUsage.COPY_DST
        )

        # Create compute pipeline
        pipeline = self._create_pipeline()

        # Create bind group
        bind_group = self._create_bind_group(pipeline)

        # Execute compute shader
        command_encoder = self.device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(pipeline)
        compute_pass.set_bind_group(0, bind_group, [], 0, 999999)
        compute_pass.dispatch_workgroups(1, 1, 1)
        compute_pass.end()

        self.device.queue.submit([command_encoder.finish()])

        # Return result (actual step count would be read from GPU)
        return ExecutionResult(
            completed=True,
            steps=max_instructions,  # Placeholder - would read actual count from GPU
            error=None
        )

    def _create_pipeline(self) -> wgpu.GPUComputePipeline:
        """Create compute pipeline with bind group layout matching shader"""
        # Define bind group layout matching WGSL shader bindings
        bind_group_layout = self.device.create_bind_group_layout(entries=[
            # Binding 0: wasm_bytecode (storage<read> array<u32>)
            {
                "binding": 0,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.read_only_storage,
                },
            },
            # Binding 1: linear_memory (storage<read_write> array<u32>)
            {
                "binding": 1,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.storage,
                },
            },
            # Binding 2: globals (storage<read_write> array<u32>)
            {
                "binding": 2,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.storage,
                },
            },
            # Binding 3: execution_trace (storage<read_write> array<u32>)
            {
                "binding": 3,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.storage,
                },
            },
            # Binding 4: vm_config (uniform VMConfig)
            {
                "binding": 4,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.uniform,
                },
            },
        ])

        pipeline_layout = self.device.create_pipeline_layout(
            bind_group_layouts=[bind_group_layout]
        )

        return self.device.create_compute_pipeline(
            layout=pipeline_layout,
            compute={"module": self.shader_module, "entry_point": "main"}
        )

    def _create_bind_group(self, pipeline: wgpu.GPUComputePipeline) -> wgpu.GPUBindGroup:
        """Create bind group with all resources"""
        bind_group_layout = pipeline.get_bind_group_layout(0)

        return self.device.create_bind_group(
            layout=bind_group_layout,
            entries=[
                {
                    "binding": 0,
                    "resource": {
                        "buffer": self.bytecode_buffer,
                        "offset": 0,
                        "size": self.bytecode_buffer.size,
                    },
                },
                {
                    "binding": 1,
                    "resource": {
                        "buffer": self.memory_buffer,
                        "offset": 0,
                        "size": self.memory_buffer.size,
                    },
                },
                {
                    "binding": 2,
                    "resource": {
                        "buffer": self.globals_buffer,
                        "offset": 0,
                        "size": self.globals_buffer.size,
                    },
                },
                {
                    "binding": 3,
                    "resource": {
                        "buffer": self.trace_buffer,
                        "offset": 0,
                        "size": self.trace_buffer.size,
                    },
                },
                {
                    "binding": 4,
                    "resource": {
                        "buffer": self.config_buffer,
                        "offset": 0,
                        "size": self.VM_CONFIG_SIZE,
                    },
                },
            ]
        )

    def read_memory(self, offset: int, size: int) -> bytes:
        """
        Read from WASM linear memory after execution.

        Args:
            offset: Byte offset in linear memory
            size: Number of bytes to read

        Returns:
            Raw bytes from linear memory
        """
        if self.memory_buffer is None:
            raise RuntimeError("No memory configured. Call configure_memory() first.")

        # Read directly from buffer (wgpu handles the staging)
        raw_data = self.device.queue.read_buffer(self.memory_buffer)

        # Convert to bytes and extract requested region
        byte_data = bytes(raw_data)
        return byte_data[offset:offset + size]

    def read_trace(self) -> List[Dict[str, int]]:
        """
        Read execution trace for debugging.

        Returns:
            List of trace entries, each containing:
            - opcode: The instruction opcode
            - operand: The operand/PC value
        """
        if self.trace_buffer is None:
            raise RuntimeError("No trace buffer configured. Call configure_memory() first.")

        # Read raw u32 data
        raw_data = self.device.queue.read_buffer(self.trace_buffer)
        trace_array = np.array(raw_data, dtype=np.uint32)

        # Parse trace entries (each is a packed u32: opcode << 24 | operand)
        trace = []
        for value in trace_array:
            if value == 0:
                break  # End of trace
            opcode = (value >> 24) & 0xFF
            operand = value & 0xFFFFFF
            trace.append({
                'opcode': int(opcode),
                'operand': int(operand),
            })

        return trace

    def set_globals(self, globals_dict: Dict[int, int]) -> None:
        """
        Set initial values for WASM globals.

        Args:
            globals_dict: Mapping from global index to value
        """
        if self.globals_buffer is None:
            raise RuntimeError("No globals buffer configured. Call configure_memory() first.")

        # Create array with updated global values
        globals_array = np.zeros(1024, dtype=np.uint32)  # Assuming 1024 globals
        for idx, val in globals_dict.items():
            if 0 <= idx < 1024:
                globals_array[idx] = val

        # Upload to GPU
        self.device.queue.write_buffer(
            buffer=self.globals_buffer,
            data=globals_array.tobytes(),
        )
