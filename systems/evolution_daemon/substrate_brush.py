"""
SubstrateBrush and HilbertBrush for binary painting on PixelRTS substrate.

Provides tools for painting binary data onto texture arrays using direct
coordinates or Hilbert curve indexing. Used in substrate surgery to modify
PixelRTS cartridges.

Task 2 of substrate-cloning spec.
"""

import numpy as np
from typing import Tuple

# Import HilbertCurve from pixelrts_v2_core
import sys
from pathlib import Path

# Add pixel_compiler to path if needed
pixel_compiler_path = Path(__file__).parent.parent / "pixel_compiler"
if str(pixel_compiler_path) not in sys.path:
    sys.path.insert(0, str(pixel_compiler_path))

from systems.pixel_compiler.pixelrts_v2_core import HilbertCurve


class SubstrateBrush:
    """
    Base brush for painting on a texture substrate.

    Provides direct coordinate-based painting operations on a numpy array
    representing a PixelRTS texture.
    """

    def __init__(self, size: int = 256):
        """
        Initialize brush with empty texture.

        Args:
            size: Width/height of square texture (must be power of 2)
        """
        self.size = size
        self.texture = np.zeros((size, size, 4), dtype=np.uint8)

    def paint_pixel(self, x: int, y: int, color: Tuple[int, int, int, int]):
        """
        Paint a single pixel at given coordinates.

        Args:
            x: X coordinate (column)
            y: Y coordinate (row)
            color: RGBA tuple (0-255 each)
        """
        if 0 <= x < self.size and 0 <= y < self.size:
            self.texture[y, x] = color  # Note: numpy uses [row, col] = [y, x]

    def paint_rect(self, x: int, y: int, width: int, height: int,
                   color: Tuple[int, int, int, int]):
        """
        Paint a rectangular region.

        Args:
            x: Starting X coordinate
            y: Starting Y coordinate
            width: Rectangle width
            height: Rectangle height
            color: RGBA tuple (0-255 each)
        """
        # Clamp to bounds
        x_end = min(x + width, self.size)
        y_end = min(y + height, self.size)
        x = max(0, x)
        y = max(0, y)

        if x < x_end and y < y_end:
            self.texture[y:y_end, x:x_end] = color

    def get_texture(self) -> np.ndarray:
        """
        Get the current texture array.

        Returns:
            numpy array of shape (size, size, 4) with dtype uint8
        """
        return self.texture


class HilbertBrush(SubstrateBrush):
    """
    Brush that paints using Hilbert curve indices.

    Extends SubstrateBrush with methods to paint at positions determined
    by the Hilbert space-filling curve rather than direct coordinates.
    This preserves spatial locality when painting binary data.
    """

    def __init__(self, order: int = 8):
        """
        Initialize Hilbert brush.

        Args:
            order: Hilbert curve order (grid_size = 2^order)
        """
        self.order = order
        self.grid_size = 2 ** order
        super().__init__(size=self.grid_size)

        # Initialize Hilbert curve LUT
        self._hilbert = HilbertCurve(order=order)
        self._lut = self._hilbert.generate_lut()

    def d2xy(self, d: int) -> Tuple[int, int]:
        """
        Convert Hilbert curve index to (x, y) coordinates.

        Args:
            d: Linear index along Hilbert curve

        Returns:
            (x, y) tuple of coordinates
        """
        if d < 0 or d >= len(self._lut):
            raise IndexError(f"Hilbert index {d} out of range for order {self.order}")
        return self._lut[d]

    def xy2d(self, x: int, y: int) -> int:
        """
        Convert (x, y) coordinates to Hilbert curve index.

        Args:
            x: X coordinate
            y: Y coordinate

        Returns:
            Linear index along Hilbert curve
        """
        return self._hilbert.coord_to_index(x, y)

    def paint_at_hilbert(self, index: int, color: Tuple[int, int, int, int]):
        """
        Paint a pixel at a Hilbert curve index.

        Args:
            index: Linear index along Hilbert curve
            color: RGBA tuple (0-255 each)
        """
        x, y = self.d2xy(index)
        self.paint_pixel(x, y, color)

    def paint_hilbert_range(self, start_index: int, count: int,
                           data: bytes):
        """
        Paint a range of bytes along the Hilbert curve.

        Each byte is painted as a grayscale pixel (R=G=B=byte, A=255).

        Args:
            start_index: Starting Hilbert index
            count: Number of bytes to paint
            data: Bytes to paint
        """
        for i, byte in enumerate(data[:count]):
            color = (byte, byte, byte, 255)
            self.paint_at_hilbert(start_index + i, color)
