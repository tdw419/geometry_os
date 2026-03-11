"""
Drift Visualizer - Visual rendering of memory drift.

Renders memory entries and code anchors as a visual representation
of the gravitational memory system.
"""

from pathlib import Path

import numpy as np

from systems.memory_drift.drift_engine import MemoryEntry
from systems.memory_drift.semantic_anchor import CodeAnchor


class DriftVisualizer:
    """
    Visualizes memory entries and their drift toward code anchors.

    Renders:
    - Memory entries as colored dots (color = recency of access)
    - Code anchors as larger markers
    - Drift trails as fading lines showing movement history
    """

    def __init__(
        self,
        width: int = 256,
        height: int = 256,
        background_color: tuple[int, int, int] = (10, 10, 20),
        entry_color_recent: tuple[int, int, int] = (100, 200, 255),
        entry_color_old: tuple[int, int, int] = (50, 50, 100),
        anchor_color: tuple[int, int, int] = (255, 200, 100),
        trail_color: tuple[int, int, int] = (150, 150, 200),
    ):
        """
        Initialize the visualizer.

        Args:
            width: Image width in pixels
            height: Image height in pixels
            background_color: RGB color for background
            entry_color_recent: RGB color for recently accessed entries
            entry_color_old: RGB color for old entries
            anchor_color: RGB color for code anchors
            trail_color: RGB color for drift trails
        """
        self.width = width
        self.height = height
        self.background_color = background_color
        self.entry_color_recent = entry_color_recent
        self.entry_color_old = entry_color_old
        self.anchor_color = anchor_color
        self.trail_color = trail_color

    def render(
        self,
        entries: list[MemoryEntry],
        anchors: list[CodeAnchor],
        bounds: tuple[float, float, float, float] | None = None,
        show_trails: bool = True,
        show_labels: bool = False,
    ) -> np.ndarray:
        """
        Render entries and anchors to an image array.

        Args:
            entries: List of MemoryEntry objects to render
            anchors: List of CodeAnchor objects to render
            bounds: Optional (x1, y1, x2, y2) bounds. If None, auto-calculated.
            show_trails: Whether to show drift trails
            show_labels: Whether to show entry/anchor labels

        Returns:
            RGB image as numpy array of shape (height, width, 3)
        """
        # Create image buffer
        image = np.zeros((self.height, self.width, 3), dtype=np.uint8)
        image[:, :] = self.background_color

        if not entries and not anchors:
            return image

        # Calculate bounds if not provided
        if bounds is None:
            bounds = self._calculate_bounds(entries, anchors)

        # Create coordinate mapping
        x1, y1, x2, y2 = bounds

        # Draw drift trails first (behind entries)
        if show_trails:
            for entry in entries:
                self._draw_trail(image, entry, (x1, y1, x2, y2))

        # Draw anchors (larger markers)
        for anchor in anchors:
            self._draw_anchor(image, anchor, (x1, y1, x2, y2))

        # Draw entries (colored dots)
        for entry in entries:
            self._draw_entry(image, entry, (x1, y1, x2, y2))

        # Draw labels if requested
        if show_labels:
            for entry in entries:
                self._draw_label(image, entry.key, entry.position, (x1, y1, x2, y2))

        return image

    def render_to_png(
        self,
        entries: list[MemoryEntry],
        anchors: list[CodeAnchor],
        path: str,
        bounds: tuple[float, float, float, float] | None = None,
        show_trails: bool = True,
        show_labels: bool = False,
    ) -> bool:
        """
        Render entries and anchors to a PNG file.

        Args:
            entries: List of MemoryEntry objects to render
            anchors: List of CodeAnchor objects to render
            path: Output file path
            bounds: Optional bounds
            show_trails: Whether to show drift trails
            show_labels: Whether to show labels

        Returns:
            True if successful, False otherwise
        """
        try:
            from PIL import Image

            image = self.render(
                entries, anchors, bounds, show_trails, show_labels
            )
            img = Image.fromarray(image, mode="RGB")

            # Ensure directory exists
            Path(path).parent.mkdir(parents=True, exist_ok=True)

            img.save(path)
            return True
        except ImportError:
            # Fallback: save as raw numpy array
            image = self.render(
                entries, anchors, bounds, show_trails, show_labels
            )
            np.save(path.replace(".png", ".npy"), image)
            return True
        except Exception:
            return False

    def _calculate_bounds(
        self, entries: list[MemoryEntry], anchors: list[CodeAnchor]
    ) -> tuple[float, float, float, float]:
        """Calculate bounds to fit all entries and anchors."""
        positions = []

        for entry in entries:
            positions.append(entry.position)

        for anchor in anchors:
            positions.append((float(anchor.tile[0]), float(anchor.tile[1])))

        if not positions:
            return (0.0, 0.0, 1000.0, 1000.0)

        xs = [p[0] for p in positions]
        ys = [p[1] for p in positions]

        # Add padding
        padding = 50.0
        x1 = min(xs) - padding
        y1 = min(ys) - padding
        x2 = max(xs) + padding
        y2 = max(ys) + padding

        return (x1, y1, x2, y2)

    def _world_to_screen(
        self,
        position: tuple[float, float],
        bounds: tuple[float, float, float, float],
    ) -> tuple[int, int]:
        """Convert world coordinates to screen coordinates."""
        x1, y1, x2, y2 = bounds

        # Handle edge case of zero-size bounds
        if x2 - x1 < 1e-6:
            x2 = x1 + 1.0
        if y2 - y1 < 1e-6:
            y2 = y1 + 1.0

        # Map to screen coordinates
        wx, wy = position
        sx = int((wx - x1) / (x2 - x1) * (self.width - 1))
        sy = int((wy - y1) / (y2 - y1) * (self.height - 1))

        # Clamp to image bounds
        sx = max(0, min(self.width - 1, sx))
        sy = max(0, min(self.height - 1, sy))

        return (sx, sy)

    def _draw_entry(
        self,
        image: np.ndarray,
        entry: MemoryEntry,
        bounds: tuple[float, float, float, float],
    ) -> None:
        """Draw a memory entry as a colored dot."""
        import time

        sx, sy = self._world_to_screen(entry.position, bounds)

        # Calculate color based on recency
        age = time.time() - entry.last_access
        # Normalize age: 0 = just accessed, 1 = old (60+ seconds)
        recency = max(0.0, min(1.0, age / 60.0))

        # Interpolate between recent and old colors
        color = tuple(
            int(
                self.entry_color_recent[i] * (1 - recency)
                + self.entry_color_old[i] * recency
            )
            for i in range(3)
        )

        # Draw entry as a circle (radius 3-5 based on access count)
        radius = min(5, 3 + entry.access_count // 5)
        self._draw_circle(image, sx, sy, radius, color)

    def _draw_anchor(
        self,
        image: np.ndarray,
        anchor: CodeAnchor,
        bounds: tuple[float, float, float, float],
    ) -> None:
        """Draw a code anchor as a larger marker."""
        position = (float(anchor.tile[0]), float(anchor.tile[1]))
        sx, sy = self._world_to_screen(position, bounds)

        # Draw anchor as a larger square
        size = 8
        x1 = max(0, sx - size // 2)
        y1 = max(0, sy - size // 2)
        x2 = min(self.width, sx + size // 2 + 1)
        y2 = min(self.height, sy + size // 2 + 1)

        image[y1:y2, x1:x2] = self.anchor_color

        # Draw border
        border_color = (
            min(255, self.anchor_color[0] + 50),
            min(255, self.anchor_color[1] + 50),
            min(255, self.anchor_color[2] + 50),
        )
        self._draw_rect(image, sx - size // 2, sy - size // 2, size, size, border_color)

    def _draw_trail(
        self,
        image: np.ndarray,
        entry: MemoryEntry,
        bounds: tuple[float, float, float, float],
    ) -> None:
        """Draw drift trail as a fading line."""
        if len(entry.drift_history) < 2:
            return

        # Draw trail segments with fading opacity
        history = entry.drift_history[-20:]  # Limit to last 20 positions

        for i in range(len(history) - 1):
            # Calculate opacity (older = more faded)
            opacity = (i + 1) / len(history)

            p1 = self._world_to_screen(history[i], bounds)
            p2 = self._world_to_screen(history[i + 1], bounds)

            # Draw line with opacity
            color = tuple(int(c * opacity) for c in self.trail_color)
            self._draw_line(image, p1, p2, color)

    def _draw_label(
        self,
        image: np.ndarray,
        text: str,
        position: tuple[float, float],
        bounds: tuple[float, float, float, float],
    ) -> None:
        """Draw a text label (simple implementation)."""
        # Simple label rendering - just draw a small indicator
        # Full text rendering would require PIL
        sx, sy = self._world_to_screen(position, bounds)

        # Draw a small dot to indicate label position
        if 0 <= sx < self.width and 0 <= sy < self.height:
            image[sy, sx] = (255, 255, 255)

    def _draw_circle(
        self, image: np.ndarray, cx: int, cy: int, radius: int, color: tuple[int, int, int]
    ) -> None:
        """Draw a filled circle."""
        for dy in range(-radius, radius + 1):
            for dx in range(-radius, radius + 1):
                if dx * dx + dy * dy <= radius * radius:
                    x, y = cx + dx, cy + dy
                    if 0 <= x < self.width and 0 <= y < self.height:
                        image[y, x] = color

    def _draw_rect(
        self,
        image: np.ndarray,
        x: int,
        y: int,
        width: int,
        height: int,
        color: tuple[int, int, int],
    ) -> None:
        """Draw a rectangle outline."""
        for dx in range(width):
            px = x + dx
            if 0 <= px < self.width:
                if 0 <= y < self.height:
                    image[y, px] = color
                if 0 <= y + height - 1 < self.height:
                    image[y + height - 1, px] = color

        for dy in range(height):
            py = y + dy
            if 0 <= py < self.height:
                if 0 <= x < self.width:
                    image[py, x] = color
                if 0 <= x + width - 1 < self.width:
                    image[py, x + width - 1] = color

    def _draw_line(
        self,
        image: np.ndarray,
        p1: tuple[int, int],
        p2: tuple[int, int],
        color: tuple[int, int, int],
    ) -> None:
        """Draw a line using Bresenham's algorithm."""
        x1, y1 = p1
        x2, y2 = p2

        dx = abs(x2 - x1)
        dy = abs(y2 - y1)
        sx = 1 if x1 < x2 else -1
        sy = 1 if y1 < y2 else -1
        err = dx - dy

        while True:
            if 0 <= x1 < self.width and 0 <= y1 < self.height:
                image[y1, x1] = color

            if x1 == x2 and y1 == y2:
                break

            e2 = 2 * err
            if e2 > -dy:
                err -= dy
                x1 += sx
            if e2 < dx:
                err += dx
                y1 += sy
