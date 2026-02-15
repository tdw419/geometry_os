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

    def run_tests(self, test_paths: List[str]) -> Dict[str, Any]:
        """Run pytest on specified test paths and parse results.

        Args:
            test_paths: List of file or directory paths to run tests on

        Returns:
            Dictionary containing:
            - success: bool, True if all tests passed
            - passed: int, number of passed tests
            - failed: int, number of failed tests
            - failures: list of dicts with test_name, file, line, error
            - output: str, full pytest output
        """
        cmd = ["pytest", "-v", "--tb=short"] + test_paths

        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=300,  # 5 minute timeout
            )
            output = result.stdout + result.stderr
        except subprocess.TimeoutExpired:
            output = "Test execution timed out after 5 minutes"
            return {
                "success": False,
                "passed": 0,
                "failed": 0,
                "failures": [],
                "output": output,
            }
        except FileNotFoundError:
            output = "pytest not found in PATH"
            return {
                "success": False,
                "passed": 0,
                "failed": 0,
                "failures": [],
                "output": output,
            }

        return self._parse_pytest_output(output)

    def _parse_pytest_output(self, output: str) -> Dict[str, Any]:
        """Parse pytest output to extract test results.

        Args:
            output: Raw pytest output string

        Returns:
            Dictionary containing:
            - success: bool, True if all tests passed
            - passed: int, number of passed tests
            - failed: int, number of failed tests
            - failures: list of dicts with test_name, file, line, error
            - output: str, full pytest output
        """
        # Initialize result
        result = {
            "success": True,
            "passed": 0,
            "failed": 0,
            "failures": [],
            "output": output,
        }

        # Parse summary line for "X failed, Y passed" or "X passed"
        summary_patterns = [
            r"(\d+) failed,\s*(\d+) passed",  # "1 failed, 2 passed"
            r"(\d+) passed",  # "2 passed" (when no failures)
        ]

        for pattern in summary_patterns:
            match = re.search(pattern, output)
            if match:
                groups = match.groups()
                if len(groups) == 2:
                    result["failed"] = int(groups[0])
                    result["passed"] = int(groups[1])
                else:
                    result["passed"] = int(groups[0])
                break

        # Determine success based on failures
        result["success"] = result["failed"] == 0

        # Extract individual failures
        # Pattern: "____ test_name ____" followed by traceback ending with "file.py:line: Error"
        failure_pattern = r"_+ ([^\s_][^\n]*?) _+\n(.*?)(\S+\.py):(\d+):"

        for match in re.finditer(failure_pattern, output, re.DOTALL):
            test_name = match.group(1).strip()
            file_path = match.group(3).strip()
            line_num = int(match.group(4))
            # Get error from the traceback context
            context = match.group(2)
            error_lines = [l.strip() for l in context.split('\n') if l.strip() and 'assert' in l.lower()]
            error_msg = error_lines[-1] if error_lines else "Assertion failed"

            # Extract just the relevant error (first few lines)
            error_lines = error_msg.split("\n")[:5]
            error = "\n".join(error_lines)

            result["failures"].append({
                "test_name": test_name,
                "file": file_path,
                "line": line_num,
                "error": error,
            })

        return result
