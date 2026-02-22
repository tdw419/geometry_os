"""
GPUExecutor - Core GPU execution pipeline for PixelRTS Visual Debugger
Provides GPU-accelerated execution with visual debugging support
"""
import wgpu
import numpy as np
from dataclasses import dataclass
from typing import List, Dict, Optional, Any
from pathlib import Path


@dataclass
class ExecutionResult:
    """
    Result of GPU execution containing:
    - registers: Final register state (256 float32 values)
    - trace: Execution trace as list of instruction entries
    - heatmap: 2D heatmap showing instruction execution frequency
    - completed: Whether execution completed normally
    - steps: Number of instructions executed
    """
    registers: np.ndarray  # Shape: (256,), dtype: float32
    trace: List[Dict[str, int]]  # List of trace entries
    heatmap: np.ndarray  # Shape: (H, W, 4), dtype: uint8
    completed: bool
    steps: int


class GPUExecutor:
    """
    GPU-accelerated PixelRTS executor with visual debugging support.
    Uses wgpu-native to execute pixel_vm_debug.wgsl compute shader.
    """

    def __init__(self, shader_path: str):
        """
        Initialize GPU executor with debug shader.

        Args:
            shader_path: Path to pixel_vm_debug.wgsl shader file
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

        # Program state (set by load_program)
        self.width: int = 0
        self.height: int = 0
        self.texture: Optional[wgpu.GPUTexture] = None
        self.pixels: Optional[np.ndarray] = None

    def load_program(self, pixels: np.ndarray) -> None:
        """
        Load a PixelRTS program from RGBA pixel array.

        Args:
            pixels: RGBA pixel array as numpy array (H, W, 4) of uint8
        """
        # Validate input
        if not isinstance(pixels, np.ndarray):
            pixels = np.array(pixels, dtype=np.uint8)
        if pixels.ndim != 3 or pixels.shape[2] != 4:
            raise ValueError(f"Pixels must be (H, W, 4) array, got shape {pixels.shape}")

        self.height, self.width = pixels.shape[:2]
        self.pixels = pixels.astype(np.uint8)

        # Create GPU texture
        self.texture = self.device.create_texture(
            size=(self.width, self.height, 1),
            usage=wgpu.TextureUsage.COPY_DST | wgpu.TextureUsage.TEXTURE_BINDING,
            dimension="2d",
            format="rgba8unorm",
            mip_level_count=1,
            sample_count=1,
        )

        # Upload pixel data to GPU
        self.device.queue.write_texture(
            {
                "texture": self.texture,
                "mip_level": 0,
                "origin": (0, 0, 0),
            },
            self.pixels,
            {
                "offset": 0,
                "bytes_per_row": self.width * 4,
                "rows_per_image": self.height,
            },
            (self.width, self.height, 1),
        )

    def load_program_from_png(self, png_path: str) -> None:
        """
        Load a PixelRTS program from PNG file.

        Args:
            png_path: Path to .rts.png file
        """
        try:
            from PIL import Image
        except ImportError:
            raise ImportError("PIL/Pillow is required for PNG loading")

        img = Image.open(png_path).convert("RGBA")
        pixels = np.array(img, dtype=np.uint8)
        self.load_program(pixels)

    def run(self, initial_registers: Optional[Dict[int, float]] = None) -> ExecutionResult:
        """
        Execute the loaded program and return execution results.

        Args:
            initial_registers: Optional dict mapping register indices to initial values

        Returns:
            ExecutionResult containing registers, trace, heatmap, and status
        """
        if self.texture is None:
            raise RuntimeError("No program loaded. Call load_program() first.")

        # Prepare buffers
        reg_buffer = self._prepare_registers(initial_registers)
        trace_buffer, heatmap_texture = self._prepare_trace_and_heatmap()

        # Create compute pipeline
        pipeline = self._create_pipeline()

        # Create bind group
        bind_group = self._create_bind_group(pipeline, reg_buffer, trace_buffer, heatmap_texture)

        # Execute
        self._execute(pipeline, bind_group)

        # Read back results
        registers = self._read_registers(reg_buffer)
        trace, steps = self._read_trace(trace_buffer)
        heatmap = self._read_heatmap(heatmap_texture)

        return ExecutionResult(
            registers=registers,
            trace=trace,
            heatmap=heatmap,
            completed=True,
            steps=steps,
        )

    def _prepare_registers(self, initial_regs: Optional[Dict[int, float]]) -> wgpu.GPUBuffer:
        """Create register buffer with optional initial values"""
        reg_array = np.zeros(256, dtype=np.float32)
        if initial_regs:
            for idx, val in initial_regs.items():
                if 0 <= idx < 256:
                    reg_array[idx] = float(val)

        return self.device.create_buffer_with_data(
            data=reg_array,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

    def _prepare_trace_and_heatmap(self) -> tuple:
        """
        Create trace buffer and heatmap buffer.
        Trace buffer: 50000 u32 values (10000 entries * 5 fields)
        Heatmap buffer: Array of vec4<f32> for execution tracking
        """
        # Trace buffer (50000 u32 values for 10000 trace entries * 5 fields)
        trace_buffer = self.device.create_buffer(
            size=50000 * 4,  # 50000 uint32 values * 4 bytes each
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

        # Heatmap buffer (width * height * 4 float values for RGBA)
        heatmap_size = self.width * self.height * 4 * 4  # 4 floats per pixel * 4 bytes
        heatmap_buffer = self.device.create_buffer(
            size=heatmap_size,
            usage=wgpu.BufferUsage.STORAGE | wgpu.BufferUsage.COPY_SRC
        )

        return trace_buffer, heatmap_buffer

    def _create_pipeline(self) -> wgpu.GPUComputePipeline:
        """Create compute pipeline with bind group layout"""
        # Define bind group layout matching shader bindings
        bind_group_layout = self.device.create_bind_group_layout(entries=[
            # Binding 0: program_texture (texture_2d<f32>)
            {
                "binding": 0,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "texture": {
                    "sample_type": "float",
                    "view_dimension": "2d",
                    "multisampled": False,
                },
            },
            # Binding 1: registers (storage<read_write> array<f32>)
            {
                "binding": 1,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.storage,
                },
            },
            # Binding 2: execution_trace (storage<read_write> array<u32>)
            {
                "binding": 2,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.storage,
                },
            },
            # Binding 3: heatmap_buffer (storage<read_write> array<vec4<f32>>)
            {
                "binding": 3,
                "visibility": wgpu.ShaderStage.COMPUTE,
                "buffer": {
                    "type": wgpu.BufferBindingType.storage,
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

    def _create_bind_group(
        self,
        pipeline: wgpu.GPUComputePipeline,
        reg_buffer: wgpu.GPUBuffer,
        trace_buffer: wgpu.GPUBuffer,
        heatmap_buffer: wgpu.GPUBuffer
    ) -> wgpu.GPUBindGroup:
        """Create bind group with all resources"""
        bind_group_layout = pipeline.get_bind_group_layout(0)

        program_view = self.texture.create_view()
        heatmap_size = self.width * self.height * 4 * 4  # 4 floats per pixel * 4 bytes

        return self.device.create_bind_group(
            layout=bind_group_layout,
            entries=[
                {"binding": 0, "resource": program_view},
                {"binding": 1, "resource": {"buffer": reg_buffer, "offset": 0, "size": 256 * 4}},
                {"binding": 2, "resource": {"buffer": trace_buffer, "offset": 0, "size": 50000 * 4}},
                {"binding": 3, "resource": {"buffer": heatmap_buffer, "offset": 0, "size": heatmap_size}},
            ]
        )

    def _execute(self, pipeline: wgpu.GPUComputePipeline, bind_group: wgpu.GPUBindGroup) -> None:
        """Execute compute shader"""
        command_encoder = self.device.create_command_encoder()
        compute_pass = command_encoder.begin_compute_pass()
        compute_pass.set_pipeline(pipeline)
        compute_pass.set_bind_group(0, bind_group, [], 0, 999999)
        compute_pass.dispatch_workgroups(1, 1, 1)
        compute_pass.end()

        self.device.queue.submit([command_encoder.finish()])

    def _read_registers(self, reg_buffer: wgpu.GPUBuffer) -> np.ndarray:
        """Read register buffer back to CPU"""
        result_data = self.device.queue.read_buffer(reg_buffer).cast("f")
        return np.array(result_data, dtype=np.float32)

    def _read_trace(self, trace_buffer: wgpu.GPUBuffer) -> tuple[List[Dict[str, int]], int]:
        """
        Read trace buffer and parse into structured entries.
        Returns (trace_entries, step_count)
        """
        # Read raw u32 data
        raw_data = self.device.queue.read_buffer(trace_buffer).cast("I")
        trace_array = np.array(raw_data, dtype=np.uint32)

        # Last element contains step count
        steps = int(trace_array[49999])

        # Parse trace entries (5 u32 values per entry)
        trace = []
        max_entries = min(10000, steps)  # Don't read beyond actual steps
        for i in range(max_entries):
            base = i * 5
            if base + 4 >= len(trace_array):
                break
            entry = {
                'pc': int(trace_array[base]),
                'opcode': int(trace_array[base + 1]),
                'dest': int(trace_array[base + 2]),
                'src': int(trace_array[base + 3]),
                'immediate': int(trace_array[base + 4]),
            }
            trace.append(entry)

        return trace, steps

    def _read_heatmap(self, heatmap_buffer: wgpu.GPUBuffer) -> np.ndarray:
        """Read heatmap buffer back to CPU"""
        # Read raw f32 data
        raw_data = self.device.queue.read_buffer(heatmap_buffer).cast("f")
        heatmap_floats = np.array(raw_data, dtype=np.float32)

        # Reshape to (H, W, 4) and convert to uint8 (0-255)
        heatmap = (heatmap_floats.reshape(self.height, self.width, 4) * 255).astype(np.uint8)

        return heatmap
