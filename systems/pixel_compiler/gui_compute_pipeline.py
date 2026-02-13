# systems/pixel_compiler/gui_compute_pipeline.py
"""
GUI Compute Pipeline for pixel-native rendering.

Manages WGSL compute shaders for GUI state updates.
"""
import numpy as np
from pathlib import Path
from typing import Optional, Dict, Any
from dataclasses import dataclass

from systems.pixel_compiler.gpu_context import GPUContext

# Try to import wgpu for buffer usage flags
try:
    import wgpu
    WGPU_AVAILABLE = True
except ImportError:
    wgpu = None
    WGPU_AVAILABLE = False


# Input buffer structure (must match shader)
INPUT_BUFFER_SIZE = 64  # bytes
INPUT_BUFFER_DTYPE = np.dtype([
    ('mouse_x', 'f4'),
    ('mouse_y', 'f4'),
    ('mouse_buttons', 'u4'),
    ('reserved1', 'u4'),
    ('keys', '8u4'),  # 8 key slots
    ('frame', 'u4'),
    ('reserved2', 'u4'),
    ('reserved3', 'u4'),
    ('reserved4', 'u4'),
])


class GUIComputePipeline:
    """
    Compute pipeline for GUI state processing.

    Manages WGSL shaders for:
    - Clearing framebuffer
    - Processing input
    - Updating GUI state
    """

    def __init__(self, context: GPUContext, width: int, height: int):
        """
        Initialize compute pipeline.

        Args:
            context: GPU context
            width: Framebuffer width
            height: Framebuffer height
        """
        self._ctx = context
        self.width = width
        self.height = height
        self.frame_count = 0

        # Create input buffer with default usage (STORAGE | COPY_DST | COPY_SRC)
        self._input_buffer = context.create_buffer(
            INPUT_BUFFER_SIZE,
            label="gui_input_buffer"
        )

        # For CPU readback, we keep a local copy of the input data
        # (avoids complex staging buffer management in this simple implementation)
        self._input_data_local = np.zeros(1, dtype=INPUT_BUFFER_DTYPE)

        # Initialize input buffer
        self._init_input_buffer()

        # Mock clear color for testing
        self._mock_clear_color = (0, 0, 0, 255)

        # Load clear shader (optional - may not exist yet)
        self._clear_pipeline = None
        self._load_shaders()

    def _init_input_buffer(self) -> None:
        """Initialize input buffer with zeros."""
        data = np.zeros(1, dtype=INPUT_BUFFER_DTYPE)
        self._ctx.write_buffer(self._input_buffer, data.view(np.uint8))
        self._input_data_local = data.copy()

    def _load_shaders(self) -> None:
        """Load WGSL shaders if available."""
        if self._ctx.mock:
            return

        # Try to load clear shader
        shader_path = Path(__file__).parent.parent.parent / "pixelrts_v2" / "shaders" / "gui_clear.wgsl"
        if shader_path.exists():
            try:
                with open(shader_path) as f:
                    shader_code = f.read()
                # Would create actual pipeline here
                # self._clear_pipeline = ...
            except Exception as e:
                print(f"[GUIComputePipeline] Could not load shaders: {e}")

    def write_input_buffer(self, data: Dict[str, Any]) -> None:
        """
        Write input data to GPU buffer.

        Args:
            data: Dictionary with mouse_x, mouse_y, mouse_buttons, frame, etc.
        """
        arr = np.zeros(1, dtype=INPUT_BUFFER_DTYPE)
        arr['mouse_x'] = data.get('mouse_x', 0.0)
        arr['mouse_y'] = data.get('mouse_y', 0.0)
        arr['mouse_buttons'] = data.get('mouse_buttons', 0)
        arr['frame'] = data.get('frame', 0)

        # Handle keys array
        keys = data.get('keys', [])
        for i, k in enumerate(keys[:8]):
            arr['keys'][0, i] = k

        self._ctx.write_buffer(self._input_buffer, arr.view(np.uint8))

        # Keep local copy for readback without complex staging
        self._input_data_local = arr.copy()

    def read_input_buffer(self) -> Dict[str, Any]:
        """Read current input buffer state."""
        # Use local copy to avoid staging buffer complexity
        # In a production implementation, this would copy GPU -> staging buffer -> CPU
        arr = self._input_data_local[0]

        return {
            'mouse_x': float(arr['mouse_x']),
            'mouse_y': float(arr['mouse_y']),
            'mouse_buttons': int(arr['mouse_buttons']),
            'frame': int(arr['frame']),
            'keys': list(arr['keys'])
        }

    def clear_framebuffer(self, r: float = 0.0, g: float = 0.0,
                          b: float = 0.0, a: float = 1.0) -> None:
        """
        Clear framebuffer with specified color.

        Args:
            r, g, b, a: Color components (0.0-1.0)
        """
        if self._ctx.mock:
            # Mock: just track the clear color
            self._mock_clear_color = (
                int(r * 255),
                int(g * 255),
                int(b * 255),
                int(a * 255)
            )
            return

        # For real GPU, would dispatch compute shader
        # For now, use CPU fallback
        pass

    def read_framebuffer(self) -> np.ndarray:
        """Read framebuffer pixels (placeholder - returns based on clear color in mock)."""
        if self._ctx.mock:
            # Return array filled with clear color
            result = np.zeros((self.height, self.width, 4), dtype=np.uint8)
            result[:, :] = self._mock_clear_color
            return result
        return np.zeros((self.height, self.width, 4), dtype=np.uint8)

    def execute_frame(self) -> None:
        """Execute one frame of compute processing."""
        self.frame_count += 1

        if self._ctx.mock:
            return

        # Would dispatch compute shaders here
        pass

    @property
    def input_buffer(self):
        """Get the input buffer for binding."""
        return self._input_buffer
