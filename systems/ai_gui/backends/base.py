"""
Base Backend Interface for AI-GUI Control Surface.

Abstract base class that all tile backends (VNC, WASM, Native) must implement.
"""

from abc import ABC, abstractmethod
from dataclasses import dataclass, field
from datetime import datetime
from typing import Any, Optional
from enum import Enum


class InputEventType(Enum):
    """Types of input events."""
    KEY = "key"
    MOUSE = "mouse"
    TEXT = "text"


@dataclass
class InputEvent:
    """Represents an input event to send to a tile."""
    type: InputEventType
    keys: Optional[str] = None  # e.g., "Ctrl+S" for key events
    text: Optional[str] = None  # Text to type for text events
    x: Optional[int] = None     # Mouse X coordinate
    y: Optional[int] = None     # Mouse Y coordinate
    button: Optional[int] = None  # Mouse button (1=left, 2=middle, 3=right)
    modifiers: Optional[list[str]] = field(default_factory=list)  # ["ctrl", "shift", "alt"]


@dataclass
class AppConfig:
    """Configuration for spawning an app tile."""
    app: str                    # App name or command
    backend: str = "auto"       # "vnc", "wasm", "native", or "auto"
    location: Optional[tuple[int, int]] = None  # (x, y) position on map
    width: int = 800
    height: int = 600
    env: dict = field(default_factory=dict)  # Environment variables
    args: list = field(default_factory=list)  # Command-line arguments


@dataclass
class ConnectionConfig:
    """Configuration for connecting to a backend."""
    display: Optional[str] = None  # X11 display (e.g., ":0")
    host: Optional[str] = None     # Remote host for VNC, etc.
    port: Optional[int] = None     # Port number
    password: Optional[str] = None # Password for authentication
    timeout: float = 30.0          # Connection timeout


@dataclass
class WindowInfo:
    """Information about a desktop window."""
    id: str                       # Window identifier
    title: str                    # Window title
    app_name: str = ""            # Application name/class
    x: int = 0                    # X position
    y: int = 0                    # Y position
    width: int = 0                # Window width
    height: int = 0               # Window height


@dataclass
class CommandResult:
    """Result of a shell command execution."""
    stdout: str                   # Standard output
    stderr: str                   # Standard error
    exit_code: int                # Exit code (0 = success)
    duration: float = 0.0         # Execution duration in seconds


class BaseBackend(ABC):
    """
    Abstract base class for tile backends.

    All backends (VNC, WASM, Native) must implement this interface
    to provide consistent app lifecycle management and input/output.
    """

    @abstractmethod
    async def spawn(self, config: AppConfig) -> "Tile":
        """
        Spawn a new app tile.

        Args:
            config: App configuration including name, backend, location, etc.

        Returns:
            Tile object representing the spawned app
        """
        pass

    @abstractmethod
    async def send_input(self, tile_id: str, event: InputEvent) -> bool:
        """
        Send input to a tile.

        Args:
            tile_id: Unique tile identifier
            event: Input event (key, mouse, or text)

        Returns:
            True if input was sent successfully
        """
        pass

    @abstractmethod
    async def capture_frame(self, tile_id: str) -> bytes:
        """
        Capture current frame from tile.

        Args:
            tile_id: Unique tile identifier

        Returns:
            PNG bytes of current frame
        """
        pass

    @abstractmethod
    async def terminate(self, tile_id: str) -> bool:
        """
        Terminate a tile.

        Args:
            tile_id: Unique tile identifier

        Returns:
            True if termination was successful
        """
        pass

    @abstractmethod
    async def health_check(self, tile_id: str) -> bool:
        """
        Check if tile is healthy.

        Args:
            tile_id: Unique tile identifier

        Returns:
            True if tile is running and healthy
        """
        pass
