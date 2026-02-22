# systems/pixel_compiler/pixel_native_types.py
"""Core types for Pixel-Native GUI system."""
from dataclasses import dataclass, field
from typing import List, Optional, Literal
from enum import Enum


class WidgetType(Enum):
    """Types of GUI widgets."""
    NONE = 0
    BUTTON = 1
    TEXT_INPUT = 2
    LABEL = 3
    SLIDER = 4
    CHECKBOX = 5
    DROPDOWN = 6
    CONTAINER = 7


@dataclass
class RuntimeConfig:
    """Configuration for PixelNativeRuntime."""
    width: int = 1920
    height: int = 1080
    mode: Literal["virtual", "physical"] = "virtual"
    vlm_model: str = "llava:7b"
    frame_rate: int = 60

    def __post_init__(self):
        valid_modes = ("virtual", "physical")
        if self.mode not in valid_modes:
            raise ValueError(f"mode must be one of {valid_modes}, got {self.mode}")


@dataclass
class InputEvent:
    """Base class for input events."""
    event_type: str = "base"


@dataclass
class ClickEvent(InputEvent):
    """Mouse click event."""
    x: int = 0
    y: int = 0
    button: int = 1  # 1=left, 2=middle, 3=right
    event_type: str = "click"


@dataclass
class KeyEvent(InputEvent):
    """Keyboard event."""
    key: str = ""
    modifiers: List[str] = field(default_factory=list)
    event_type: str = "key"


@dataclass
class DragEvent(InputEvent):
    """Mouse drag event."""
    x1: int = 0
    y1: int = 0
    x2: int = 0
    y2: int = 0
    event_type: str = "drag"


@dataclass
class TypeEvent(InputEvent):
    """Text typing event."""
    text: str = ""
    event_type: str = "type"


@dataclass
class WidgetInfo:
    """Information about a GUI widget."""
    widget_type: WidgetType
    x: int
    y: int
    width: int
    height: int
    label: Optional[str] = None
    value: Optional[str] = None
    state_flags: int = 0  # bitfield: hovered, focused, pressed, etc.

    def contains(self, px: int, py: int) -> bool:
        """Check if point (px, py) is inside this widget."""
        return (self.x <= px < self.x + self.width and
                self.y <= py < self.y + self.height)

    @property
    def center(self) -> tuple:
        """Return center point of widget."""
        return (self.x + self.width // 2, self.y + self.height // 2)


@dataclass
class GUIState:
    """Complete state of a GUI at a point in time."""
    widgets: List[WidgetInfo] = field(default_factory=list)
    focused_widget: Optional[int] = None  # Index of focused widget
    timestamp_ns: int = 0

    def add_widget(self, widget: WidgetInfo) -> None:
        """Add a widget to the state."""
        self.widgets.append(widget)

    def find_by_type(self, widget_type: WidgetType) -> List[WidgetInfo]:
        """Find all widgets of a given type."""
        return [w for w in self.widgets if w.widget_type == widget_type]

    def find_at_point(self, x: int, y: int) -> Optional[WidgetInfo]:
        """Find widget at a specific point."""
        for widget in reversed(self.widgets):  # Top-most first
            if widget.contains(x, y):
                return widget
        return None

    def find_by_label(self, label: str) -> List[WidgetInfo]:
        """Find widgets by label text."""
        return [w for w in self.widgets if w.label and label.lower() in w.label.lower()]
