# systems/pixel_compiler/ai_vision_layer.py
"""
AI Vision Layer for GUI perception.

Provides visual grounding and widget detection for AI agents.
"""
import numpy as np
from typing import List, Optional, Tuple, Any
from abc import ABC, abstractmethod

from systems.pixel_compiler.pixel_native_types import (
    WidgetType,
    WidgetInfo,
    GUIState
)


class BaseVLM(ABC):
    """Abstract base class for Vision Language Models."""

    @abstractmethod
    def detect_widgets(self, pixels: np.ndarray) -> List[WidgetInfo]:
        """Detect widgets in pixel array."""
        pass

    @abstractmethod
    def ground_intent(self, intent: str, pixels: np.ndarray) -> Optional[Tuple[int, int]]:
        """Convert natural language intent to pixel coordinates."""
        pass

    @abstractmethod
    def verify_action(self, before: np.ndarray, after: np.ndarray,
                      expected: str) -> bool:
        """Verify that visual change matches expectation."""
        pass


class MockVLM(BaseVLM):
    """
    Mock VLM for testing without model dependencies.

    Uses simple heuristics:
    - Red-ish regions = buttons
    - White regions with dark border = text inputs
    """

    def __init__(self):
        self.model_name = "mock"

    def detect_widgets(self, pixels: np.ndarray) -> List[WidgetInfo]:
        """Detect widgets using color heuristics."""
        widgets = []
        h, w = pixels.shape[:2]

        # Simple connected component detection for red-ish regions
        # (This is a simplified mock - real implementation would use proper CV)
        red_mask = (pixels[:, :, 0] > 150) & (pixels[:, :, 1] < 150) & (pixels[:, :, 2] < 150)

        # Find bounding boxes of red regions (very simplified)
        visited = np.zeros_like(red_mask, dtype=bool)

        for y in range(h):
            for x in range(w):
                if red_mask[y, x] and not visited[y, x]:
                    # Flood fill to find region
                    region = self._flood_fill(red_mask, visited, x, y)
                    if len(region) > 50:  # Minimum size
                        min_x = min(p[0] for p in region)
                        max_x = max(p[0] for p in region)
                        min_y = min(p[1] for p in region)
                        max_y = max(p[1] for p in region)

                        widget = WidgetInfo(
                            widget_type=WidgetType.BUTTON,
                            x=min_x,
                            y=min_y,
                            width=max_x - min_x + 1,
                            height=max_y - min_y + 1
                        )
                        widgets.append(widget)

        return widgets

    def _flood_fill(self, mask: np.ndarray, visited: np.ndarray,
                    start_x: int, start_y: int) -> List[Tuple[int, int]]:
        """Flood fill to find connected region."""
        h, w = mask.shape
        region = []
        stack = [(start_x, start_y)]

        while stack:
            x, y = stack.pop()
            if x < 0 or x >= w or y < 0 or y >= h:
                continue
            if visited[y, x] or not mask[y, x]:
                continue

            visited[y, x] = True
            region.append((x, y))

            stack.extend([(x+1, y), (x-1, y), (x, y+1), (x, y-1)])

        return region

    def ground_intent(self, intent: str, pixels: np.ndarray) -> Optional[Tuple[int, int]]:
        """Find coordinates for intent (mock: returns center of first button)."""
        widgets = self.detect_widgets(pixels)
        buttons = [w for w in widgets if w.widget_type == WidgetType.BUTTON]

        if buttons:
            return buttons[0].center
        return None

    def verify_action(self, before: np.ndarray, after: np.ndarray,
                      expected: str) -> bool:
        """Verify action (mock: always returns True if any change)."""
        return not np.array_equal(before, after)


class AIVisionLayer:
    """
    AI perception layer for GUI understanding.

    Wraps a VLM and provides high-level perception APIs.
    """

    def __init__(self, model: str = "mock"):
        self.model = model
        self._vlm: BaseVLM = self._load_vlm(model)
        self._perception_cache: dict = {}

    def _load_vlm(self, model: str) -> BaseVLM:
        """Load VLM by name."""
        if model == "mock":
            return MockVLM()
        # In real implementation, would load LLaVA, Qwen, etc.
        raise ValueError(f"Unknown model: {model}")

    def perceive(self, pixels: np.ndarray) -> GUIState:
        """
        Parse GUI state from raw pixels.

        Returns GUIState with all detected widgets.
        """
        widgets = self._vlm.detect_widgets(pixels)
        return GUIState(widgets=widgets)

    def ground_intent(self, intent: str, pixels: np.ndarray) -> Optional[Tuple[int, int]]:
        """
        Convert natural language intent to pixel coordinates.

        Examples:
            "click the save button" -> (450, 320)
            "type in the text box" -> (200, 150)
        """
        return self._vlm.ground_intent(intent, pixels)

    def verify_action(self, before: np.ndarray, after: np.ndarray,
                      expected_change: str) -> bool:
        """
        Verify that action produced expected visual change.
        """
        return self._vlm.verify_action(before, after, expected_change)

    def find_widget(self, pixels: np.ndarray, widget_type: WidgetType,
                    label: Optional[str] = None) -> Optional[WidgetInfo]:
        """Find a specific widget by type and optional label."""
        state = self.perceive(pixels)
        candidates = [w for w in state.widgets if w.widget_type == widget_type]

        if label:
            candidates = [w for w in candidates
                         if w.label and label.lower() in w.label.lower()]

        return candidates[0] if candidates else None
