# systems/pixel_compiler/virtual_framebuffer.py
"""Virtual framebuffer for GPU-native GUI rendering."""
import numpy as np
from typing import Tuple, Optional


class VirtualFramebuffer:
    """
    A virtual framebuffer that stores pixels in a numpy array.
    Simulates GPU framebuffer for testing and virtual display mode.
    """

    def __init__(self, width: int, height: int):
        self.width = width
        self.height = height
        self.pixels = np.zeros((height, width, 4), dtype=np.uint8)

    def set_pixel(self, x: int, y: int, color: Tuple[int, int, int, int]) -> None:
        """Set a single pixel color."""
        if 0 <= x < self.width and 0 <= y < self.height:
            self.pixels[y, x] = color

    def fill_rect(self, x: int, y: int, width: int, height: int,
                  color: Tuple[int, int, int, int]) -> None:
        """Fill a rectangle with a color."""
        x1 = max(0, x)
        y1 = max(0, y)
        x2 = min(self.width, x + width)
        y2 = min(self.height, y + height)

        if x2 > x1 and y2 > y1:
            self.pixels[y1:y2, x1:x2] = color

    def get_region(self, x: int, y: int, width: int, height: int) -> np.ndarray:
        """Get a rectangular region of pixels."""
        x1 = max(0, x)
        y1 = max(0, y)
        x2 = min(self.width, x + width)
        y2 = min(self.height, y + height)
        return self.pixels[y1:y2, x1:x2].copy()

    def clear(self) -> None:
        """Clear the framebuffer to black."""
        self.pixels.fill(0)

    def compare(self, other: 'VirtualFramebuffer') -> float:
        """
        Compare this framebuffer with another.
        Returns similarity score from 0.0 (completely different) to 1.0 (identical).
        """
        if self.width != other.width or self.height != other.height:
            return 0.0

        # Calculate pixel-wise similarity using RMS difference
        diff = np.abs(self.pixels.astype(np.float32) - other.pixels.astype(np.float32))
        # Root mean square difference normalized to [0, 1]
        rms = np.sqrt(np.mean(diff ** 2))
        similarity = 1.0 - (rms / 255.0)
        return max(0.0, min(1.0, similarity))

    def get_diff_mask(self, other: 'VirtualFramebuffer', threshold: int = 10) -> np.ndarray:
        """
        Get a binary mask of changed pixels.
        Returns True for pixels that differ by more than threshold.
        """
        diff = np.abs(self.pixels.astype(np.int16) - other.pixels.astype(np.int16))
        # Sum of absolute differences across channels
        diff_sum = np.sum(diff, axis=2)
        return diff_sum > threshold

    def copy(self) -> 'VirtualFramebuffer':
        """Create a copy of this framebuffer."""
        fb = VirtualFramebuffer(self.width, self.height)
        fb.pixels = self.pixels.copy()
        return fb

    def to_rgba(self) -> np.ndarray:
        """Return pixels as RGBA array (height, width, 4)."""
        return self.pixels.copy()

    def to_rgb(self) -> np.ndarray:
        """Return pixels as RGB array (height, width, 3), dropping alpha."""
        return self.pixels[:, :, :3].copy()
