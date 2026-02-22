"""
Install Progress Display for PixelRTS

Provides visual progress feedback during install operations.
Adapts to TTY vs non-TTY environments for clean output in both terminals and logs.

INSTALL-01: Install progress displayed visually during install operations

Key Features:
    - InstallStage enum for install phases
    - TTY-aware progress bar display
    - Non-TTY fallback (plain messages)
    - Rich library support with plain text fallback
    - Follows same patterns as BootProgress

Usage:
    from systems.pixel_compiler.install.install_progress import InstallProgress, InstallStage

    progress = InstallProgress(verbose=True)
    progress.start(InstallStage.VERIFYING)
    progress.update(0.5, "Verifying checksums...")
    progress.complete("Verification complete")

    # Handle errors
    progress.error("Verification failed")
"""

import sys
import time
from enum import Enum, auto
from typing import Optional


class InstallStage(Enum):
    """Stages of the install process."""
    VERIFYING = auto()
    PREPARING = auto()
    WRITING = auto()
    SYNCING = auto()
    COMPLETED = auto()
    FAILED = auto()

    @property
    def display_name(self) -> str:
        """Get human-readable stage name."""
        names = {
            InstallStage.VERIFYING: "Verifying",
            InstallStage.PREPARING: "Preparing",
            InstallStage.WRITING: "Writing",
            InstallStage.SYNCING: "Syncing",
            InstallStage.COMPLETED: "Completed",
            InstallStage.FAILED: "Failed",
        }
        return names.get(self, self.name)


class InstallProgress:
    """
    Visual progress display for install operations.

    Provides TTY-aware progress feedback that adapts to the environment:
    - In TTY: Shows animated progress bar with percentage
    - In non-TTY (CI/logs): Shows plain status messages

    The class automatically handles:
    - Detecting terminal capabilities
    - Rich library availability (falls back to plain text)
    - Timing operations to show progress for long-running tasks

    Example:
        progress = InstallProgress()
        progress.start(InstallStage.VERIFYING)
        # ... do work ...
        progress.update(0.5, "Halfway there")
        progress.complete("Verification complete")
    """

    def __init__(self, verbose: bool = True):
        """
        Initialize InstallProgress.

        Args:
            verbose: Whether to show progress output (default: True)
        """
        self.verbose = verbose
        self._is_tty = sys.stderr.isatty()
        self._current_stage: Optional[InstallStage] = None
        self._stage_start_time: Optional[float] = None
        self._current_message: str = ""
        self._current_progress: float = 0.0

        # Try to import rich for fancy progress display
        self._has_rich = False
        self._rich_progress = None
        self._rich_task = None

        if self._is_tty and verbose:
            try:
                from rich.progress import Progress, SpinnerColumn, TextColumn, BarColumn, TaskProgressColumn
                from rich.console import Console
                self._has_rich = True
                self._console = Console(stderr=True)
                self._rich_progress_class = Progress
                self._spinner_column = SpinnerColumn
                self._text_column = TextColumn
                self._bar_column = BarColumn
                self._task_progress_column = TaskProgressColumn
            except ImportError:
                pass

    def start(self, stage: InstallStage) -> None:
        """
        Start a new progress stage.

        Args:
            stage: The InstallStage to start
        """
        self._current_stage = stage
        self._stage_start_time = time.time()
        self._current_progress = 0.0
        self._current_message = stage.display_name

        if not self.verbose:
            return

        if stage == InstallStage.FAILED:
            # Don't show progress bar for failure
            return

        if self._has_rich:
            self._start_rich_progress(stage)
        elif self._is_tty:
            # Show initial message on TTY without rich
            self._show_progress_bar(stage.display_name, 0.0)
        else:
            # Non-TTY: just show stage start
            self._show_message(f"[START] {stage.display_name}...")

    def update(self, progress: float, message: str) -> None:
        """
        Update progress for the current stage.

        Args:
            progress: Progress value from 0.0 to 1.0
            message: Message to display
        """
        # Clamp progress to valid range
        progress = max(0.0, min(1.0, progress))
        self._current_progress = progress

        if message:
            self._current_message = message

        if not self.verbose or self._current_stage is None:
            return

        if self._has_rich:
            self._update_rich_progress(progress, message)
        elif self._is_tty:
            self._show_progress_bar(self._current_message, progress)
        # Non-TTY: only show significant milestones (25%, 50%, 75%, 100%)
        else:
            milestone = int(progress * 4) / 4  # 0, 0.25, 0.5, 0.75
            if progress >= milestone and progress < milestone + 0.25:
                if milestone in [0.25, 0.5, 0.75]:
                    self._show_message(f"  {int(milestone * 100)}% - {message}")

    def complete(self, message: str) -> None:
        """
        Mark the current stage as complete.

        Args:
            message: Completion message
        """
        if self._current_stage is None:
            return

        stage = self._current_stage
        duration = time.time() - self._stage_start_time if self._stage_start_time else 0

        if self._has_rich and self._rich_progress is not None:
            # Stop rich progress
            self._rich_progress.stop()
            self._rich_progress = None
            self._rich_task = None

        display_msg = message or f"{stage.display_name} complete"

        if self._is_tty:
            # Clear progress line and show final message
            sys.stderr.write("\r" + " " * 80 + "\r")
            sys.stderr.write(f"\033[92m\u2713\033[0m {display_msg} ({duration:.2f}s)\n")
            sys.stderr.flush()
        else:
            self._show_message(f"[DONE] {display_msg} ({duration:.2f}s)")

        # Reset state
        self._current_stage = None
        self._stage_start_time = None
        self._current_progress = 0.0

    def error(self, message: str) -> None:
        """
        Display an error message.

        Args:
            message: Error message to display
        """
        if self._has_rich and self._rich_progress is not None:
            # Stop rich progress
            self._rich_progress.stop()
            self._rich_progress = None
            self._rich_task = None

        self._current_stage = InstallStage.FAILED

        if self._is_tty:
            # Clear progress line and show error
            sys.stderr.write("\r" + " " * 80 + "\r")
            sys.stderr.write(f"\033[91m\u2717\033[0m ERROR: {message}\n")
            sys.stderr.flush()
        else:
            self._show_message(f"[ERROR] {message}")

    def _start_rich_progress(self, stage: InstallStage) -> None:
        """Start a rich progress display."""
        try:
            self._rich_progress = self._rich_progress_class(
                self._spinner_column(),
                self._text_column("[progress.description]{task.description}"),
                self._bar_column(),
                self._task_progress_column(),
                console=self._console,
                transient=True,  # Clear progress when done
            )
            self._rich_progress.start()
            self._rich_task = self._rich_progress.add_task(
                stage.display_name,
                total=100,
            )
        except Exception:
            # Fall back to basic display if rich fails
            self._has_rich = False
            self._show_progress_bar(stage.display_name, 0.0)

    def _update_rich_progress(self, progress: float, message: str) -> None:
        """Update rich progress display."""
        if self._rich_progress is None or self._rich_task is None:
            return

        try:
            self._rich_progress.update(
                self._rich_task,
                completed=int(progress * 100),
                description=message if message else self._current_message,
            )
        except Exception:
            pass

    def _show_progress_bar(self, message: str, progress: float) -> None:
        """
        Show a text-based progress bar on TTY.

        Args:
            message: Message to display
            progress: Progress value from 0.0 to 1.0
        """
        if not self._is_tty:
            # Pitfall 4 from RESEARCH.md: Never use carriage return/cursor
            # manipulation in non-TTY environments (CI, logs, redirects)
            return

        # Build progress bar
        bar_width = 30
        filled = int(bar_width * progress)
        bar = "=" * filled + "-" * (bar_width - filled)
        percentage = int(progress * 100)

        # Use carriage return to overwrite line
        line = f"\r  {message} [{bar}] {percentage}%"
        sys.stderr.write(line)
        sys.stderr.flush()

    def _show_message(self, message: str) -> None:
        """
        Show a plain message (for non-TTY or when progress bar not appropriate).

        Args:
            message: Message to display
        """
        if self.verbose:
            print(message, file=sys.stderr)


# Convenience function for quick progress display
def create_install_progress(verbose: bool = True) -> InstallProgress:
    """
    Create an InstallProgress instance.

    Args:
        verbose: Whether to show progress output

    Returns:
        InstallProgress instance
    """
    return InstallProgress(verbose=verbose)
