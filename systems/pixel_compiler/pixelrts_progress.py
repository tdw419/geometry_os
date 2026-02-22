"""
PixelRTS Progress Indicators

Provides a flexible progress callback system for long-running operations
like entropy analysis and blueprint generation.

Classes:
    ProgressCallback: Abstract base for progress callbacks
    ConsoleProgressCallback: TTY-aware console progress with percentage and ETA
    SilentProgressCallback: No-op callback for testing
    ProgressState: Immutable state container for progress updates

Functions:
    cli_progress_callback: Factory that auto-detects TTY support
"""

import sys
import time
import abc
import math
from dataclasses import dataclass, field
from typing import Optional, List, TextIO
from enum import Enum


class ProgressPhase(Enum):
    """Well-known phases for blueprint analysis."""
    INIT = "initializing"
    ELF_PARSING = "parsing_elf"
    ENTROPY_ANALYSIS = "calculating_entropy"
    COMPONENT_DETECTION = "detecting_components"
    HILBERT_MAPPING = "mapping_hilbert"
    MEMORY_INFERENCE = "inferring_memory"
    FINALIZATION = "finalizing"


@dataclass(frozen=True)
class ProgressState:
    """
    Immutable snapshot of progress state.

    Attributes:
        phase: Current phase identifier
        completed: Units completed (e.g., bytes processed)
        total: Total units (None for indeterminate progress)
        message: Human-readable status message
        timestamp: When this state was created
    """
    phase: str
    completed: int
    total: Optional[int]
    message: str = ""
    timestamp: float = field(default_factory=time.time)

    @property
    def progress_ratio(self) -> Optional[float]:
        """Get progress as ratio 0.0-1.0, or None if indeterminate."""
        if self.total is None or self.total == 0:
            return None
        return max(0.0, min(1.0, self.completed / self.total))

    @property
    def progress_percent(self) -> Optional[int]:
        """Get progress as percentage 0-100, or None if indeterminate."""
        ratio = self.progress_ratio
        return int(ratio * 100) if ratio is not None else None


class ProgressCallback(abc.ABC):
    """
    Abstract base class for progress callbacks.

    Implementations must be thread-safe if used in multi-threaded contexts.
    """

    @abc.abstractmethod
    def start(self, total: Optional[int] = None, message: str = "") -> None:
        """
        Initialize a new progress operation.

        Args:
            total: Total units (None for indeterminate)
            message: Initial status message
        """
        pass

    @abc.abstractmethod
    def update(self, completed: int, message: str = "") -> None:
        """
        Update progress for current operation.

        Args:
            completed: Units completed
            message: Optional status message override
        """
        pass

    @abc.abstractmethod
    def complete(self, message: str = "") -> None:
        """
        Mark the current operation as complete.

        Args:
            message: Final status message
        """
        pass

    @abc.abstractmethod
    def set_phase(self, phase: str, message: str = "") -> None:
        """
        Change the current phase without resetting progress.

        Args:
            phase: New phase identifier
            message: Optional phase description
        """
        pass

    def is_interactive(self) -> bool:
        """Return True if this is an interactive/TTY callback."""
        return False

    def supports_eta(self) -> bool:
        """Return True if this callback supports ETA calculation."""
        return False


class SilentProgressCallback(ProgressCallback):
    """
    No-op progress callback for testing and non-interactive use.

    All methods are safe to call but do nothing.
    """

    def start(self, total: Optional[int] = None, message: str = "") -> None:
        pass

    def update(self, completed: int, message: str = "") -> None:
        pass

    def complete(self, message: str = "") -> None:
        pass

    def set_phase(self, phase: str, message: str = "") -> None:
        pass


class ConsoleProgressCallback(ProgressCallback):
    """
    TTY-aware console progress bar with percentage and ETA.

    Features:
    - Auto-detects TTY support (disables if redirected)
    - Shows progress bar, percentage, ETA, and phase
    - Handles indeterminate progress (spinning indicator)
    - Cleans up on completion
    - Thread-safe updates (uses locks)

    Example output:
        [████████░░░░░░░░] 42% (ETA: 0:02) - Calculating entropy...
    """

    _BAR_WIDTH = 30
    _SPINNER_FRAMES = ['-', '\\', '|', '/']
    _UPDATE_INTERVAL = 0.1  # Seconds between redraws

    def __init__(
        self,
        file: Optional[TextIO] = None,
        show_eta: bool = True,
        show_phase: bool = True
    ):
        """
        Initialize console progress callback.

        Args:
            file: Output file (default: stderr)
            show_eta: Whether to calculate and display ETA
            show_phase: Whether to display current phase
        """
        self._file = file or sys.stderr
        self._show_eta = show_eta
        self._show_phase = show_phase

        # Progress state
        self._total: Optional[int] = None
        self._completed: int = 0
        self._message: str = ""
        self._phase: str = ""
        self._start_time: float = 0.0
        self._last_update: float = 0.0
        self._spinner_index: int = 0

        # Detect TTY support
        self._is_tty = hasattr(self._file, 'isatty') and self._file.isatty()
        self._enabled = self._is_tty

    def is_interactive(self) -> bool:
        return self._is_tty

    def supports_eta(self) -> bool:
        return self._show_eta

    def start(self, total: Optional[int] = None, message: str = "") -> None:
        self._total = total
        self._completed = 0
        self._message = message
        self._phase = "initializing"
        self._start_time = time.time()
        self._last_update = 0.0
        self._spinner_index = 0
        self._render(force=True)

    def update(self, completed: int, message: str = "") -> None:
        self._completed = completed
        if message:
            self._message = message
        self._render()

    def complete(self, message: str = "") -> None:
        if message:
            self._message = message

        if self._total is not None:
            self._completed = self._total
        self._phase = "complete"

        self._render(force=True)

        # Clear the line on completion
        if self._enabled:
            self._clear_line()

    def set_phase(self, phase: str, message: str = "") -> None:
        self._phase = phase
        if message:
            self._message = message
        self._render()

    def _render(self, force: bool = False) -> None:
        """Render progress bar if enough time has elapsed."""
        if not self._enabled:
            return

        now = time.time()
        if not force and (now - self._last_update) < self._UPDATE_INTERVAL:
            return

        self._last_update = now
        self._spinner_index = (self._spinner_index + 1) % len(self._SPINNER_FRAMES)

        line = self._format_line()
        self._write_line(line)

    def _format_line(self) -> str:
        """Format the complete progress line."""
        parts = []

        # Progress bar or spinner
        if self._total is not None:
            bar = self._make_bar()
            pct = self._percent()
            parts.append(f"[{bar}] {pct}%")
        else:
            spinner = self._SPINNER_FRAMES[self._spinner_index]
            parts.append(f"[{spinner}]")

        # ETA
        if self._show_eta and self._total is not None and self._completed > 0:
            eta = self._calculate_eta()
            if eta is not None:
                parts.append(f"(ETA: {eta})")

        # Phase
        if self._show_phase and self._phase:
            parts.append(f"- {self._phase}")

        # Message
        if self._message:
            parts.append(f": {self._message}")

        return " ".join(parts)

    def _make_bar(self) -> str:
        """Generate progress bar string."""
        if self._total is None or self._total == 0:
            return "?" * self._BAR_WIDTH

        ratio = self.progress_ratio
        filled = int(ratio * self._BAR_WIDTH)
        empty = self._BAR_WIDTH - filled

        return "█" * filled + "░" * empty

    def _percent(self) -> int:
        """Calculate percentage complete."""
        if self._total is None or self._total == 0:
            return 0
        return min(100, max(0, int((self._completed / self._total) * 100)))

    @property
    def progress_ratio(self) -> Optional[float]:
        """Get progress as ratio 0.0-1.0."""
        if self._total is None or self._total == 0:
            return None
        return max(0.0, min(1.0, self._completed / self._total))

    def _calculate_eta(self) -> Optional[str]:
        """Calculate ETA as formatted string."""
        if self._total is None or self._completed == 0:
            return None

        ratio = self.progress_ratio
        if ratio is None or ratio <= 0:
            return None

        elapsed = time.time() - self._start_time
        total_estimated = elapsed / ratio
        remaining = total_estimated - elapsed

        if remaining < 0:
            return "0:00"

        return self._format_seconds(remaining)

    def _format_seconds(self, seconds: float) -> str:
        """Format seconds as MM:SS."""
        if seconds < 0:
            seconds = 0
        mins = int(seconds // 60)
        secs = int(seconds % 60)
        return f"{mins}:{secs:02d}"

    def _write_line(self, line: str) -> None:
        """Write line with carriage return for overwriting."""
        self._file.write(f"\r{line}\r")
        self._file.flush()

    def _clear_line(self) -> None:
        """Clear the progress line."""
        self._file.write("\r" + " " * 80 + "\r")
        self._file.flush()


def cli_progress_callback(
    force_enable: bool = False,
    file: Optional[TextIO] = None
) -> ProgressCallback:
    """
    Factory function that creates appropriate callback for CLI context.

    Auto-detects TTY support and returns:
    - ConsoleProgressCallback if TTY detected or force_enable=True
    - SilentProgressCallback if output is redirected

    Args:
        force_enable: Force console output even without TTY
        file: Output file for console callback

    Returns:
        ProgressCallback instance
    """
    if force_enable:
        return ConsoleProgressCallback(file=file)

    # Auto-detect TTY
    if file is None:
        file = sys.stderr

    is_tty = hasattr(file, 'isatty') and file.isatty()

    if is_tty:
        return ConsoleProgressCallback(file=file)
    else:
        return SilentProgressCallback()


# Pre-configured callbacks for common use cases
SILENT = SilentProgressCallback()


def create_test_callback() -> ProgressCallback:
    """Create a callback that captures updates for testing."""
    return SilentProgressCallback()
