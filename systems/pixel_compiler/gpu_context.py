# systems/pixel_compiler/gpu_context.py
"""
GPU Context wrapper for WebGPU (wgpu-py).

Provides unified interface for GPU device creation with graceful fallback
to mock mode when GPU is unavailable.
"""
import numpy as np
from typing import Optional, Any
from dataclasses import dataclass

# Try to import wgpu
try:
    import wgpu
    try:
        import wgpu.backends.wgpu_native
    except ImportError:
        pass
    WGPU_AVAILABLE = True
except ImportError:
    wgpu = None
    WGPU_AVAILABLE = False


@dataclass
class GPUTexture:
    """Wrapper for GPU texture with metadata."""
    handle: Any
    width: int
    height: int
    format: str = "rgba8unorm"
    label: str = ""


@dataclass
class GPUBuffer:
    """Wrapper for GPU buffer with metadata."""
    handle: Any
    size: int
    label: str = ""
    usage: int = 0


class GPUContext:
    """
    WebGPU context with automatic GPU detection and mock fallback.

    Usage:
        ctx = GPUContext()
        if ctx.is_available:
            texture = ctx.create_texture(1920, 1080)
            buffer = ctx.create_buffer(1024)
    """

    def __init__(self, force_mock: bool = False):
        """
        Initialize GPU context.

        Args:
            force_mock: If True, skip GPU detection and use mock mode
        """
        self._shutdown = False
        self._mock = force_mock
        self._device = None
        self._adapter = None

        if not force_mock and WGPU_AVAILABLE:
            self._init_gpu()

        if self._mock:
            self._init_mock()

    def _init_gpu(self) -> bool:
        """Initialize real GPU device."""
        try:
            self._adapter = wgpu.gpu.request_adapter(
                power_preference="high-performance"
            )
            if self._adapter:
                self._device = self._adapter.request_device(
                    required_features=[]
                )
                self._mock = False
                return True
        except Exception as e:
            print(f"[GPUContext] GPU init failed: {e}. Using mock mode.")

        self._mock = True
        return False

    def _init_mock(self) -> None:
        """Initialize mock mode state."""
        self._mock_buffers = {}
        self._mock_textures = {}
        self._mock_buffer_counter = 0
        self._mock_texture_counter = 0

    @property
    def is_available(self) -> bool:
        """Check if real GPU is available."""
        return not self._mock and self._device is not None

    @property
    def mock(self) -> bool:
        """Check if running in mock mode."""
        return self._mock

    @property
    def device(self) -> Optional[Any]:
        """Get the GPU device (None if mock mode)."""
        return self._device

    def create_buffer(self, size: int, label: str = "",
                      usage: Optional[int] = None) -> GPUBuffer:
        """
        Create a GPU buffer.

        Args:
            size: Buffer size in bytes
            label: Optional label for debugging
            usage: Buffer usage flags (default: STORAGE | COPY_DST | COPY_SRC)

        Returns:
            GPUBuffer wrapper
        """
        if self._mock:
            self._mock_buffer_counter += 1
            handle = f"mock_buffer_{self._mock_buffer_counter}"
            self._mock_buffers[handle] = np.zeros(size, dtype=np.uint8)
            return GPUBuffer(handle=handle, size=size, label=label)

        if usage is None:
            usage = (
                wgpu.BufferUsage.STORAGE |
                wgpu.BufferUsage.COPY_DST |
                wgpu.BufferUsage.COPY_SRC
            )

        handle = self._device.create_buffer(size=size, usage=usage, label=label)
        return GPUBuffer(handle=handle, size=size, label=label, usage=usage)

    def create_texture(self, width: int, height: int,
                       label: str = "",
                       format: str = "rgba8unorm") -> GPUTexture:
        """
        Create a GPU texture.

        Args:
            width: Texture width
            height: Texture height
            label: Optional label for debugging
            format: Texture format (default: rgba8unorm)

        Returns:
            GPUTexture wrapper
        """
        if self._mock:
            self._mock_texture_counter += 1
            handle = f"mock_texture_{self._mock_texture_counter}"
            self._mock_textures[handle] = np.zeros((height, width, 4), dtype=np.uint8)
            return GPUTexture(handle=handle, width=width, height=height,
                            format=format, label=label)

        usage = (
            wgpu.TextureUsage.STORAGE_BINDING |
            wgpu.TextureUsage.COPY_DST |
            wgpu.TextureUsage.COPY_SRC |
            wgpu.TextureUsage.TEXTURE_BINDING
        )

        handle = self._device.create_texture(
            size=(width, height, 1),
            format=format,
            usage=usage,
            label=label
        )
        return GPUTexture(handle=handle, width=width, height=height,
                         format=format, label=label)

    def write_buffer(self, buffer: GPUBuffer, data: np.ndarray,
                     offset: int = 0) -> None:
        """Write data to GPU buffer."""
        if self._mock:
            self._mock_buffers[buffer.handle][offset:offset + len(data)] = data
            return

        self._device.queue.write_buffer(
            buffer.handle,
            offset,
            data.tobytes()
        )

    def read_buffer(self, buffer: GPUBuffer) -> np.ndarray:
        """Read data from GPU buffer."""
        if self._mock:
            return self._mock_buffers[buffer.handle].copy()

        # For real GPU, need to use async read or staging buffer
        buffer.handle.map_async(wgpu.MapMode.READ)
        self._device.queue.submit([])

        data = np.frombuffer(buffer.handle.read_mapped(), dtype=np.uint8).copy()
        buffer.handle.unmap()
        return data

    def write_texture(self, texture: GPUTexture, data: np.ndarray) -> None:
        """Write data to GPU texture."""
        if self._mock:
            self._mock_textures[texture.handle][:] = data
            return

        self._device.queue.write_texture(
            {"texture": texture.handle},
            data.tobytes(),
            {"bytes_per_row": texture.width * 4, "rows_per_image": texture.height},
            (texture.width, texture.height, 1)
        )

    def read_texture(self, texture: GPUTexture) -> np.ndarray:
        """Read data from GPU texture."""
        if self._mock:
            return self._mock_textures[texture.handle].copy()

        # Create staging buffer for readback
        size = texture.width * texture.height * 4
        staging = self.create_buffer(size, label="staging_readback")

        # Encode copy command
        encoder = self._device.create_command_encoder()
        encoder.copy_texture_to_buffer(
            {"texture": texture.handle},
            {"buffer": staging.handle, "bytes_per_row": texture.width * 4},
            (texture.width, texture.height, 1)
        )
        self._device.queue.submit([encoder.finish()])

        # Read from staging
        return self.read_buffer(staging).reshape((texture.height, texture.width, 4))

    def submit(self, command_buffer: Any) -> None:
        """Submit command buffer to GPU queue."""
        if self._mock:
            return
        self._device.queue.submit([command_buffer])

    def create_command_encoder(self, label: str = "") -> Any:
        """Create a command encoder."""
        if self._mock:
            return MockCommandEncoder(label)
        return self._device.create_command_encoder(label=label)

    def shutdown(self) -> None:
        """Release GPU resources."""
        self._shutdown = True
        self._device = None
        self._adapter = None
        self._mock_buffers = {}
        self._mock_textures = {}


class MockCommandEncoder:
    """Mock command encoder for testing."""
    def __init__(self, label: str = ""):
        self.label = label
        self._commands = []

    def copy_buffer_to_buffer(self, src, src_offset, dst, dst_offset, size):
        self._commands.append(("copy_buffer", src, dst, size))

    def copy_texture_to_buffer(self, src, dst, size):
        self._commands.append(("copy_texture_to_buffer", src, dst, size))

    def copy_buffer_to_texture(self, src, dst, size):
        self._commands.append(("copy_buffer_to_texture", src, dst, size))

    def finish(self):
        return self._commands
