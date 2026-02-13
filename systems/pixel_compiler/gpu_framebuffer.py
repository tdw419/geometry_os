# systems/pixel_compiler/gpu_framebuffer.py
"""
GPU Framebuffer for pixel-native GUI.

Wraps a GPU texture with convenient read/write operations.
Supports zero-copy access in mock mode.
"""
import numpy as np
from typing import Optional, Tuple

from systems.pixel_compiler.gpu_context import GPUContext, GPUTexture


class GPUFramebuffer:
    """
    GPU-backed framebuffer for GUI rendering.

    Provides high-level operations for pixel access while
    managing GPU texture memory.
    """

    def __init__(self, context: GPUContext, width: int, height: int,
                 label: str = "framebuffer"):
        """
        Initialize GPU framebuffer.

        Args:
            context: GPU context for resource management
            width: Framebuffer width in pixels
            height: Framebuffer height in pixels
            label: Optional label for debugging
        """
        self._ctx = context
        self.width = width
        self.height = height
        self._label = label

        # Create GPU texture
        self._texture = context.create_texture(
            width=width,
            height=height,
            label=label
        )

        # For mock mode, keep direct reference for zero-copy
        self._mock_data = None
        if context.mock:
            self._mock_data = context._mock_textures[self._texture.handle]

    @property
    def texture(self) -> GPUTexture:
        """Get the underlying GPU texture."""
        return self._texture

    def write(self, data: np.ndarray) -> None:
        """
        Write pixel data to framebuffer.

        Args:
            data: numpy array of shape (height, width, 4) with dtype uint8
        """
        if data.shape != (self.height, self.width, 4):
            raise ValueError(
                f"Data shape {data.shape} doesn't match framebuffer "
                f"({self.height}, {self.width}, 4)"
            )
        self._ctx.write_texture(self._texture, data)

    def read(self) -> np.ndarray:
        """
        Read pixel data from framebuffer.

        Returns:
            numpy array of shape (height, width, 4) with dtype uint8
        """
        return self._ctx.read_texture(self._texture)

    def clear(self) -> None:
        """Clear framebuffer to black (all zeros)."""
        zeros = np.zeros((self.height, self.width, 4), dtype=np.uint8)
        self.write(zeros)

    def get_region(self, x: int, y: int, width: int, height: int) -> np.ndarray:
        """
        Get a rectangular region of pixels.

        Args:
            x: X coordinate of region start
            y: Y coordinate of region start
            width: Region width
            height: Region height

        Returns:
            numpy array of shape (height, width, 4)
        """
        # Clamp to bounds
        x1 = max(0, x)
        y1 = max(0, y)
        x2 = min(self.width, x + width)
        y2 = min(self.height, y + height)

        # Read full framebuffer and slice
        data = self.read()
        return data[y1:y2, x1:x2].copy()

    def get_pixels_view(self) -> np.ndarray:
        """
        Get zero-copy view of framebuffer pixels.

        Only works in mock mode. For real GPU, use read() instead.

        Returns:
            numpy array view (mock) or copy (real GPU)
        """
        if self._mock_data is not None:
            return self._mock_data
        return self.read()

    def set_pixel(self, x: int, y: int, color: Tuple[int, int, int, int]) -> None:
        """Set a single pixel (inefficient for bulk operations)."""
        if self._mock_data is not None:
            if 0 <= x < self.width and 0 <= y < self.height:
                self._mock_data[y, x] = color
            return

        # For real GPU, this is very inefficient
        data = self.read()
        if 0 <= x < self.width and 0 <= y < self.height:
            data[y, x] = color
        self.write(data)

    def fill_rect(self, x: int, y: int, width: int, height: int,
                  color: Tuple[int, int, int, int]) -> None:
        """Fill a rectangle with a color."""
        if self._mock_data is not None:
            x1 = max(0, x)
            y1 = max(0, y)
            x2 = min(self.width, x + width)
            y2 = min(self.height, y + height)
            if x2 > x1 and y2 > y1:
                self._mock_data[y1:y2, x1:x2] = color
            return

        # For real GPU
        data = self.read()
        x1 = max(0, x)
        y1 = max(0, y)
        x2 = min(self.width, x + width)
        y2 = min(self.height, y + height)
        if x2 > x1 and y2 > y1:
            data[y1:y2, x1:x2] = color
        self.write(data)
