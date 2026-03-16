"""
Continuous Tensor Abstraction (CTA) Mapper for Geometry OS
Bridges the gap between continuous world coordinates and the discrete Hilbert grid.
"""

import math
import numpy as np
from .pixelrts_v2_core import HilbertCurve, calculate_grid_size

class CTAMapper:
    """
    Implements Continuous Tensor Abstraction for pixel memory.
    Allows addressing memory using normalized real-number coordinates [0.0, 1.0].
    """

    def __init__(self, grid_size: int):
        """
        Initialize CTA mapper.

        Args:
            grid_size: Size of the pixel grid (power of 2)
        """
        self.grid_size = grid_size
        self.order = int(math.log2(grid_size))
        self.hilbert = HilbertCurve(self.order)
        self._lut = self.hilbert.generate_lut()
        
        # Phase C: Efficient Reverse LUT (x, y) -> index
        self._reverse_lut = np.zeros((grid_size, grid_size), dtype=np.uint32)
        for i, (x, y) in enumerate(self._lut):
            self._reverse_lut[y, x] = i

    def map_continuous_to_index(self, cx: float, cy: float) -> int:
        """
        Map continuous coordinates to a discrete Hilbert index.

        Args:
            cx: Normalized X coordinate [0.0, 1.0]
            cy: Normalized Y coordinate [0.0, 1.0]

        Returns:
            Hilbert curve index
        """
        # Clamp coordinates to [0, 1]
        cx = max(0.0, min(1.0, cx))
        cy = max(0.0, min(1.0, cy))

        # Map to discrete grid coordinates
        gx = int(cx * (self.grid_size - 1))
        gy = int(cy * (self.grid_size - 1))

        # Map (gx, gy) to Hilbert index (O(1) using reverse LUT)
        return int(self._reverse_lut[gy, gx])

    def _coord_to_index(self, gx: int, gy: int) -> int:
        """Inverse Hilbert mapping (x, y) -> index."""
        return int(self._reverse_lut[gy, gx])

    def glance(self, data: bytes, cx: float, cy: float, radius: float = 0.01) -> np.ndarray:
        """
        Read a small 'patch' of memory around a continuous coordinate.
        Useful for vision models to 'look' at a region of instructions.

        Args:
            data: Raw pixel data (unpacked bytes)
            cx: Center X coordinate [0.0, 1.0]
            cy: Center Y coordinate [0.0, 1.0]
            radius: Normalized radius of the patch

        Returns:
            NumPy array containing the pixel data in the requested region
        """
        # Calculate grid bounds
        gx_min = max(0, int((cx - radius) * (self.grid_size - 1)))
        gx_max = min(self.grid_size - 1, int((cx + radius) * (self.grid_size - 1)))
        gy_min = max(0, int((cy - radius) * (self.grid_size - 1)))
        gy_max = min(self.grid_size - 1, int((cy + radius) * (self.grid_size - 1)))

        # Collect pixels
        patch = []
        for gy in range(gy_min, gy_max + 1):
            row = []
            for gx in range(gx_min, gx_max + 1):
                idx = self._coord_to_index(gx, gy)
                # Each pixel is 4 bytes
                offset = idx * 4
                if offset + 4 <= len(data):
                    pixel = data[offset:offset+4]
                    row.append(list(pixel))
                else:
                    row.append([0, 0, 0, 0])
            patch.append(row)

        return np.array(patch, dtype=np.uint8)

    def write_piecewise(self, data: bytearray, cx: float, cy: float, size: float, value: bytes):
        """
        Write a 'block' of data into the continuous space.
        Implements A(x) = v * 1_R(x).
        """
        gx_start = int(cx * (self.grid_size - 1))
        gy_start = int(cy * (self.grid_size - 1))
        g_size = int(size * (self.grid_size - 1))

        for gy in range(gy_start, min(gy_start + g_size, self.grid_size)):
            for gx in range(gx_start, min(gx_start + g_size, self.grid_size)):
                idx = self._coord_to_index(gx, gy)
                offset = idx * 4
                if offset + 4 <= len(data):
                    data[offset:offset+4] = value
