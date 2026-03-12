# systems/pixel_brain/hilbert_encoder.py
"""Hilbert Curve Encoder for 2D ↔ 1D spatial encoding.

This module implements a pure Python Hilbert curve encoder that matches
the standard iterative algorithm, ensuring locality preservation and 
mathematical consistency between encoding and decoding.
"""

import numpy as np
from typing import Tuple, List


class HilbertEncoder:
    """
    Encodes 2D coordinates to 1D Hilbert indices.

    Grid size: 256x256 (Order 8 Hilbert curve)
    """

    def __init__(self, grid_size: int = 256):
        """
        Initialize encoder for a square grid.

        Args:
            grid_size: Size of the grid (must be power of 2)
        """
        if grid_size & (grid_size - 1) != 0:
            raise ValueError(f"Grid size must be power of 2, got {grid_size}")

        self.grid_size = grid_size
        self._order = grid_size.bit_length() - 1

    def _rot(self, n: int, x: int, y: int, rx: int, ry: int) -> Tuple[int, int]:
        """Rotate/flip quadrant based on quadrant bits."""
        if ry == 0:
            if rx == 1:
                x = n - 1 - x
                y = n - 1 - y
            return y, x
        return x, y

    def xy_to_hilbert(self, x: int, y: int) -> int:
        """Convert (x, y) coordinates to Hilbert index."""
        if not (0 <= x < self.grid_size and 0 <= y < self.grid_size):
            raise ValueError(f"Coordinates ({x}, {y}) out of bounds")

        d = 0
        s = self.grid_size // 2
        while s > 0:
            rx = 1 if (x & s) > 0 else 0
            ry = 1 if (y & s) > 0 else 0
            d += s * s * ((3 * rx) ^ ry)
            
            # Rotate local coordinates
            # We only rotate the bits below s
            lx, ly = x & (s - 1), y & (s - 1)
            lx, ly = self._rot(s, lx, ly, rx, ry)
            
            # Update x and y for next iteration by replacing low bits
            x = (x & ~(s - 1)) | lx
            y = (y & ~(s - 1)) | ly
            
            s //= 2
        return d

    def hilbert_to_xy(self, index: int) -> Tuple[int, int]:
        """Convert Hilbert index to (x, y) coordinates."""
        if not (0 <= index < self.grid_size * self.grid_size):
            raise ValueError(f"Index {index} out of bounds")

        x, y = 0, 0
        s = 1
        t = index
        while s < self.grid_size:
            rx = 1 & (t // 2)
            ry = 1 & (t ^ rx)
            
            x, y = self._rot(s, x, y, rx, ry)
            x += s * rx
            y += s * ry
            
            t //= 4
            s *= 2
        return x, y

    def encode_quadrant(self, texture: np.ndarray, quadrant: int) -> List[int]:
        """Encode a 128x128 quadrant to Hilbert-ordered indices."""
        if texture.shape != (self.grid_size, self.grid_size):
            raise ValueError(f"Texture must be {self.grid_size}x{self.grid_size}")

        start_x = (quadrant % 2) * (self.grid_size // 2)
        start_y = (quadrant // 2) * (self.grid_size // 2)
        end_x = start_x + (self.grid_size // 2)
        end_y = start_y + (self.grid_size // 2)

        indices = []
        for d in range(self.grid_size * self.grid_size):
            x, y = self.hilbert_to_xy(d)
            if start_x <= x < end_x and start_y <= y < end_y:
                indices.append(int(texture[y, x]))

        return indices

    def decode_to_quadrant(self, indices: List[int], quadrant: int) -> np.ndarray:
        """Decode Hilbert-ordered indices into a 2D quadrant."""
        texture = np.zeros((self.grid_size, self.grid_size), dtype=np.uint16)
        
        start_x = (quadrant % 2) * (self.grid_size // 2)
        start_y = (quadrant // 2) * (self.grid_size // 2)
        end_x = start_x + (self.grid_size // 2)
        end_y = start_y + (self.grid_size // 2)
        
        idx_cursor = 0
        for d in range(self.grid_size * self.grid_size):
            x, y = self.hilbert_to_xy(d)
            if start_x <= x < end_x and start_y <= y < end_y:
                if idx_cursor < len(indices):
                    texture[y, x] = indices[idx_cursor]
                    idx_cursor += 1
                else:
                    break
                    
        return texture
