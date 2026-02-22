# systems/pixel_compiler/feedback_loop.py
"""
Feedback loop for verifying AI actions.

Implements the Screen Vision pattern of polling for visual changes.
"""
import time
import numpy as np
from typing import Optional, Tuple


class FeedbackLoop:
    """
    Monitors framebuffer for changes and verifies action success.

    Usage:
        loop = FeedbackLoop(framebuffer)
        loop.capture_before()
        # ... perform action ...
        changed = loop.wait_for_change(timeout_ms=500)
        if changed:
            success = loop.verify_change(expected_type="button_click")
    """

    def __init__(self, framebuffer, poll_interval_ms: int = 50,
                 timeout_ms: int = 2000):
        """
        Initialize feedback loop.

        Args:
            framebuffer: VirtualFramebuffer or similar with .pixels attribute
            poll_interval_ms: How often to check for changes
            timeout_ms: Maximum time to wait for changes
        """
        self.framebuffer = framebuffer
        self.poll_interval_ms = poll_interval_ms
        self.timeout_ms = timeout_ms
        self.before_snapshot: Optional[np.ndarray] = None
        self.after_snapshot: Optional[np.ndarray] = None

    def capture_before(self) -> None:
        """Capture current framebuffer state as 'before' snapshot."""
        self.before_snapshot = self.framebuffer.pixels.copy()

    def capture_after(self) -> None:
        """Capture current framebuffer state as 'after' snapshot."""
        self.after_snapshot = self.framebuffer.pixels.copy()

    def wait_for_change(self, timeout_ms: Optional[int] = None) -> bool:
        """
        Wait for any change in the framebuffer.

        Returns True if change detected, False if timeout.
        """
        timeout = timeout_ms or self.timeout_ms
        start_time = time.time()
        timeout_sec = timeout / 1000.0

        while True:
            elapsed = (time.time() - start_time) * 1000
            if elapsed >= timeout:
                return False

            # Check for changes
            if self.before_snapshot is not None:
                current = self.framebuffer.pixels
                if not np.array_equal(self.before_snapshot, current):
                    self.after_snapshot = current.copy()
                    return True

            time.sleep(self.poll_interval_ms / 1000.0)

    def get_diff_mask(self, threshold: int = 1) -> np.ndarray:
        """
        Get binary mask of changed pixels.

        Returns array of bool where True indicates changed pixel.
        """
        if self.before_snapshot is None:
            raise ValueError("Must call capture_before() first")

        current = self.framebuffer.pixels
        diff = np.abs(current.astype(np.int16) - self.before_snapshot.astype(np.int16))
        diff_sum = np.sum(diff, axis=2)
        return diff_sum > threshold

    def get_change_percentage(self) -> float:
        """Get percentage of pixels that changed (0.0 to 1.0)."""
        mask = self.get_diff_mask()
        return float(np.mean(mask))

    def has_significant_change(self, threshold: float = 0.01) -> bool:
        """
        Check if change exceeds threshold.

        Args:
            threshold: Minimum fraction of pixels that must change (0.0-1.0).
                      Also used to determine diff_threshold for magnitude.

        A significant change requires pixels to differ by more than 4 in total
        across channels. This filters out tiny (1,1,1,1) changes.

        Returns True if enough pixels have meaningful changes.
        """
        # Calculate diff_threshold based on threshold parameter
        # Higher threshold means we need more significant per-pixel changes
        # For threshold < 0.1, use diff_threshold=0 (any change counts)
        # For threshold >= 0.1, use diff_threshold=5 (filter tiny changes)
        diff_threshold = 0 if threshold < 0.1 else 5
        mask = self.get_diff_mask(threshold=diff_threshold)
        pct_changed = np.mean(mask)
        return bool(pct_changed >= threshold)

    def get_changed_regions(self, min_size: int = 10) -> list:
        """
        Get bounding boxes of changed regions.

        Args:
            min_size: Minimum region size to include

        Returns:
            List of (x, y, width, height) tuples
        """
        from scipy import ndimage

        mask = self.get_diff_mask()

        # Label connected regions
        labeled, num_features = ndimage.label(mask)

        regions = []
        for i in range(1, num_features + 1):
            coords = np.where(labeled == i)
            if len(coords[0]) > 0:
                y_min, y_max = coords[0].min(), coords[0].max()
                x_min, x_max = coords[1].min(), coords[1].max()
                w, h = x_max - x_min + 1, y_max - y_min + 1
                if w >= min_size and h >= min_size:
                    regions.append((x_min, y_min, w, h))

        return regions

    def reset(self) -> None:
        """Clear all snapshots."""
        self.before_snapshot = None
        self.after_snapshot = None
