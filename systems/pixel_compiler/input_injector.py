# systems/pixel_compiler/input_injector.py
"""
Input injection for pixel-native GUI.

Supports two modes:
- gpu: Writes directly to GPU input buffer
- wayland: Uses Wayland virtual input protocols
"""
from typing import List, Tuple, Optional, Literal
from dataclasses import dataclass


@dataclass
class InjectedEvent:
    """An input event ready for injection."""
    event_type: str
    x: Optional[int] = None
    y: Optional[int] = None
    button: Optional[int] = None
    key: Optional[str] = None
    modifiers: List[str] = None
    pressed: bool = True

    def __post_init__(self):
        if self.modifiers is None:
            self.modifiers = []


class InputInjector:
    """
    Injects input events into the GUI system.
    """

    def __init__(self, mode: Literal["gpu", "wayland"] = "gpu",
                 bounds: Optional[Tuple[int, int]] = None):
        self.mode = mode
        self.bounds = bounds  # (width, height) for clamping
        self._pending_events: List[InjectedEvent] = []

    def _clamp(self, x: int, y: int) -> Tuple[int, int]:
        """Clamp coordinates to bounds."""
        if self.bounds:
            w, h = self.bounds
            return (min(max(0, x), w), min(max(0, y), h))
        return (x, y)

    def click(self, x: int, y: int, button: int = 1) -> None:
        """Inject mouse click at coordinates."""
        x, y = self._clamp(x, y)

        # Press
        self._pending_events.append(InjectedEvent(
            event_type="click",
            x=x, y=y,
            button=button,
            pressed=True
        ))
        # Release
        self._pending_events.append(InjectedEvent(
            event_type="click",
            x=x, y=y,
            button=button,
            pressed=False
        ))

    def mouse_down(self, x: int, y: int, button: int = 1) -> None:
        """Inject mouse press (no release)."""
        x, y = self._clamp(x, y)
        self._pending_events.append(InjectedEvent(
            event_type="click",
            x=x, y=y,
            button=button,
            pressed=True
        ))

    def mouse_up(self, x: int, y: int, button: int = 1) -> None:
        """Inject mouse release."""
        x, y = self._clamp(x, y)
        self._pending_events.append(InjectedEvent(
            event_type="click",
            x=x, y=y,
            button=button,
            pressed=False
        ))

    def mouse_move(self, x: int, y: int) -> None:
        """Inject mouse movement."""
        x, y = self._clamp(x, y)
        self._pending_events.append(InjectedEvent(
            event_type="move",
            x=x, y=y
        ))

    def type_text(self, text: str) -> None:
        """Type text character by character."""
        for char in text:
            # Press
            self._pending_events.append(InjectedEvent(
                event_type="key",
                key=char,
                pressed=True
            ))
            # Release
            self._pending_events.append(InjectedEvent(
                event_type="key",
                key=char,
                pressed=False
            ))

    def key_press(self, key: str, modifiers: List[str] = None) -> None:
        """Press key with optional modifiers."""
        modifiers = modifiers or []

        # Press modifiers
        for mod in modifiers:
            self._pending_events.append(InjectedEvent(
                event_type="key",
                key=mod,
                pressed=True
            ))

        # Press key
        self._pending_events.append(InjectedEvent(
            event_type="key",
            key=key,
            pressed=True
        ))

        # Release key
        self._pending_events.append(InjectedEvent(
            event_type="key",
            key=key,
            pressed=False
        ))

        # Release modifiers
        for mod in reversed(modifiers):
            self._pending_events.append(InjectedEvent(
                event_type="key",
                key=mod,
                pressed=False
            ))

    def drag(self, x1: int, y1: int, x2: int, y2: int, steps: int = 10) -> None:
        """Drag from (x1,y1) to (x2,y2)."""
        # Press at start
        self.mouse_down(x1, y1)

        # Move in steps
        for i in range(1, steps + 1):
            t = i / steps
            x = int(x1 + (x2 - x1) * t)
            y = int(y1 + (y2 - y1) * t)
            self.mouse_move(x, y)

        # Release at end
        self.mouse_up(x2, y2)

    def scroll(self, x: int, y: int, delta: int = 1) -> None:
        """Scroll at position (positive = up, negative = down)."""
        x, y = self._clamp(x, y)
        button = 4 if delta > 0 else 5  # Button 4 = scroll up, 5 = scroll down
        for _ in range(abs(delta)):
            self.click(x, y, button)

    def get_pending_events(self) -> List[InjectedEvent]:
        """Get list of pending events."""
        return self._pending_events

    def clear_events(self) -> None:
        """Clear pending events."""
        self._pending_events.clear()

    def flush(self) -> List[InjectedEvent]:
        """Get and clear pending events."""
        events = self._pending_events.copy()
        self._pending_events.clear()
        return events
