"""Autonomous Improvement Daemon for Geometry OS.

The AutofixDaemon monitors the codebase, detects issues, and applies
safe, autonomous fixes with rollback capability.
"""

import os
import re
import subprocess
import threading
from dataclasses import dataclass, field
from pathlib import Path
from typing import List, Dict, Any, Optional

from .fixer import AutofixGenerator


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

        # Initialize threading support for daemon loop
        self._stop_event = threading.Event()
        self._generator = AutofixGenerator()
        self._fix_history: List[Dict[str, Any]] = []

    def start(self) -> None:
        """Start the daemon's main loop.

        This method blocks until stop() is called. It continuously
        polls for test failures and attempts to fix them.
        """
        self.is_running = True
        self._stop_event.clear()

        while self.is_running and not self._stop_event.is_set():
            self._poll_once()
            self._stop_event.wait(self.poll_interval)

    def stop(self) -> None:
        """Stop the daemon's main loop.

        Signals the running daemon to exit its polling loop.
        """
        self.is_running = False
        self._stop_event.set()

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

    def _poll_once(self) -> None:
        """Execute a single polling cycle.

        Runs tests and processes any failures found.
        """
        # Get test paths from safe directories
        test_paths = self._find_test_paths()

        if not test_paths:
            return  # No tests to run

        # Run tests and check for failures
        results = self.run_tests(test_paths)

        if not results["success"] and results["failures"]:
            for failure in results["failures"]:
                self._process_failure(failure)

    def _process_failure(self, failure: Dict[str, Any]) -> None:
        """Process a single test failure.

        Attempts to generate and apply a fix for the failure.

        Args:
            failure: Dictionary containing test failure details with keys:
                - test_name: Name of the failing test
                - file: Path to the file containing the failure
                - line: Line number of the failure
                - error: Error message
        """
        file_path = failure.get("file", "")

        # Safety check: only process files in safe directories
        if not self.is_safe_path(file_path):
            return

        # Read the source file
        try:
            with open(file_path, "r") as f:
                source_code = f.read()
        except (OSError, IOError):
            return

        # Extract error type from error message
        error_message = failure.get("error", "")
        error_type = self._extract_error_type(error_message)

        # Prepare failure info for the fix generator
        failure_info = {
            "error_type": error_type,
            "error_message": error_message,
            "file_path": file_path,
            "line_number": failure.get("line", 0),
        }

        # Generate fix
        fix = self._generator.generate_fix(failure_info, source_code)

        # Validate and apply if confident enough
        if fix["patch"] is not None and fix["confidence"] >= 0.5:
            self._apply_fix(file_path, source_code, fix, failure_info)

    def _extract_error_type(self, error_message: str) -> str:
        """Extract error type from error message.

        Args:
            error_message: The error message from test failure

        Returns:
            Error type string (e.g., "AssertionError", "TypeError")
        """
        # Common patterns for error types in pytest output
        error_patterns = [
            r"AssertionError",
            r"TypeError",
            r"AttributeError",
            r"IndexError",
            r"ValueError",
            r"KeyError",
            r"RuntimeError",
        ]

        for pattern in error_patterns:
            if pattern in error_message:
                return pattern

        return "AssertionError"  # Default assumption

    def _apply_fix(
        self,
        file_path: str,
        original_code: str,
        fix: Dict[str, Any],
        failure_info: Dict[str, Any]
    ) -> None:
        """Apply a generated fix to a file.

        Args:
            file_path: Path to the file to fix
            original_code: Original source code (for rollback)
            fix: Fix dictionary from generate_fix
            failure_info: Information about the failure being fixed
        """
        try:
            # Apply the patch
            fixed_code = self._generator.apply_patch(original_code, fix["patch"])

            if fixed_code is None:
                return

            # Write the fixed code
            with open(file_path, "w") as f:
                f.write(fixed_code)

            # Record the fix in history
            self._fix_history.append({
                "file_path": file_path,
                "original_code": original_code,
                "fix": fix,
                "failure_info": failure_info,
                "timestamp": None,  # Could add datetime if needed
            })

        except (OSError, IOError):
            # If writing fails, we leave the file unchanged
            pass

    def _find_test_paths(self) -> List[str]:
        """Find test files in safe directories.

        Returns:
            List of paths to test files
        """
        test_paths = []

        for safe_dir in self.safe_directories:
            safe_path = Path(safe_dir)
            if not safe_path.exists():
                continue

            # Find all test_*.py files
            for test_file in safe_path.rglob("test_*.py"):
                test_paths.append(str(test_file))

        return test_paths

    def get_fix_history(self) -> List[Dict[str, Any]]:
        """Get the history of applied fixes.

        Returns:
            List of fix records applied during this session
        """
        return self._fix_history.copy()
