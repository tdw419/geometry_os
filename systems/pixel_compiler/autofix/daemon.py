"""Autonomous Improvement Daemon for Geometry OS.

The AutofixDaemon monitors the codebase, detects issues, and applies
safe, autonomous fixes with rollback capability.
"""

import os
import re
import subprocess
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Dict, Any


@dataclass
class AutofixDaemon:
    """Autonomous daemon that detects and fixes code issues.

    The daemon polls the codebase for issues, validates proposed fixes,
    and applies them with automatic rollback capability.

    Attributes:
        config: Configuration dictionary for daemon behavior
        poll_interval: Seconds between polling cycles (default 60)
        safe_directories: Directories where autofix is allowed
        max_fix_attempts: Maximum retries for a single fix (default 3)
        is_running: Whether the daemon is currently running
    """

    config: Dict[str, Any] = field(default_factory=dict)
    poll_interval: int = 60
    safe_directories: List[str] = field(default_factory=lambda: ["systems/pixel_compiler/autofix/sandbox"])
    max_fix_attempts: int = 3
    is_running: bool = False

    def __post_init__(self):
        """Apply configuration overrides after initialization.

        Config keys:
        - poll_interval: Override default polling interval
        - safe_directories: Override default safe directories
        - max_fix_attempts: Override default max attempts
        """
        if "poll_interval" in self.config:
            self.poll_interval = self.config["poll_interval"]
        if "safe_directories" in self.config:
            self.safe_directories = list(self.config["safe_directories"])
        if "max_fix_attempts" in self.config:
            self.max_fix_attempts = self.config["max_fix_attempts"]

    def start(self) -> None:
        """Start the daemon's main loop."""
        self.is_running = True

    def stop(self) -> None:
        """Stop the daemon's main loop."""
        self.is_running = False

    def is_safe_path(self, path: str) -> bool:
        """Check if a path is within a safe directory.

        Prevents modifying files outside designated safe zones.

        Args:
            path: File or directory path to check

        Returns:
            True if path is within a safe directory, False otherwise
        """
        try:
            resolved_path = Path(path).resolve()
            for safe_dir in self.safe_directories:
                safe_resolved = Path(safe_dir).resolve()
                try:
                    resolved_path.relative_to(safe_resolved)
                    return True
                except ValueError:
                    continue
            return False
        except (OSError, ValueError):
            return False
