"""
Safety Sanitizer for Desktop Agent Service.
Blocks dangerous key combinations and shell commands.
"""

import re
from dataclasses import dataclass
from typing import Optional


@dataclass
class ValidationResult:
    """Result of a safety validation."""
    valid: bool
    message: Optional[str] = None
    code: str = "OK"


class SafetySanitizer:
    """
    Sanitizes input events and shell commands to prevent dangerous operations.
    """

    # Blocked key names (from xdotool/pyautogui terminology)
    BLOCKED_KEYS = {
        "Sys_Req", "Print", "Scroll_Lock", "Pause", "Break"
    }

    # Blocked combinations (tuples of components, order-independent)
    BLOCKED_COMBOS = [
        ("ctrl", "alt", "delete"),
        ("ctrl", "alt", "backspace"),
        ("ctrl", "alt", "f[1-9]"),
        ("alt", "sysrq"),
    ]

    # Blocked shell commands (case-insensitive regex)
    BLOCKED_COMMANDS = [
        r"\brm\s+.*-rf\s+/",
        r"\bmkfs\b",
        r"\bdd\s+if=",
        r"\bshutdown\b",
        r"\breboot\b",
        r"\bpoweroff\b",
        r"\binit\s+0\b",
        r"\binit\s+6\b",
        r"\bchmod\s+.*777\s+/",
        r"\bchown\s+.*root\s+/",
    ]

    def __init__(self):
        self.cmd_patterns = [re.compile(p, re.IGNORECASE) for p in self.BLOCKED_COMMANDS]

    def validate_key_event(self, key_str: str) -> ValidationResult:
        """
        Validates a key string (e.g., "Ctrl+Alt+S").

        Args:
            key_str: Key combination string

        Returns:
            ValidationResult
        """
        key_str_lower = key_str.lower()

        # 1. Check blocked keys
        for key in self.BLOCKED_KEYS:
            if key.lower() in key_str_lower:
                return ValidationResult(
                    valid=False, 
                    message=f"Key '{key}' is blocked for safety.", 
                    code="BLOCKED_KEY"
                )

        # 2. Check blocked combinations (order-independent)
        for combo in self.BLOCKED_COMBOS:
            if all(re.search(part, key_str_lower) for part in combo):
                return ValidationResult(
                    valid=False, 
                    message=f"Key combination '{key_str}' is blocked for safety.", 
                    code="BLOCKED_COMBO"
                )

        return ValidationResult(valid=True)

    def validate_command(self, cmd: str) -> ValidationResult:
        """
        Validates a shell command.

        Args:
            cmd: Command string to execute

        Returns:
            ValidationResult
        """
        for pattern in self.cmd_patterns:
            if pattern.search(cmd):
                return ValidationResult(
                    valid=False, 
                    message=f"Command '{cmd}' contains blocked operations.", 
                    code="BLOCKED_COMMAND"
                )

        return ValidationResult(valid=True)

    def is_blocked_combo(self, modifiers: list[str], key: str) -> bool:
        """
        Validates a combination of modifiers and a single key.

        Args:
            modifiers: List of modifiers ["ctrl", "alt", "shift"]
            key: Single key string

        Returns:
            True if combination is blocked
        """
        combo = "+".join(modifiers + [key])
        return not self.validate_key_event(combo).valid
