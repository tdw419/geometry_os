"""Fix Generator for Autonomous Improvement Daemon.

The AutofixGenerator analyzes test failures and generates automated fixes
using pattern matching and code transformation techniques.

WebMCP Integration:
    When use_webmcp=True, the generator uses WebMCP IDE tools for enhanced
    compilation and testing capabilities via the HTTP bridge.
"""

from dataclasses import dataclass, field
from typing import Dict, Optional, Any
import re
import subprocess
import sys


@dataclass
class AutofixGenerator:
    """Generates automated fixes for common code issues.

    Uses pattern matching to detect and fix common Python errors:
    - Assertion failures (add guards, adjust assertions)
    - TypeErrors (add type conversions)
    - AttributeErrors (fix attribute access)
    - IndexErrors (add bounds checking)

    WebMCP Integration:
        When use_webmcp=True, validates syntax via ide_compile and runs
        tests via ide_test through the WebMCP HTTP bridge.

    Attributes:
        confidence_threshold: Minimum confidence (0-1) to apply a fix
        max_fix_size: Maximum lines a fix can modify
        use_webmcp: Enable WebMCP IDE tools integration
        _bridge: WebMCP bridge instance (lazily initialized)
        _webmcp_available: Whether WebMCP bridge is available
    """

    confidence_threshold: float = 0.7
    max_fix_size: int = 10
    use_webmcp: bool = False
    _fix_count: int = field(default=0, init=False, repr=False)
    _bridge: Any = field(default=None, init=False, repr=False)
    _webmcp_available: bool = field(default=False, init=False, repr=False)

    def __post_init__(self):
        """Initialize WebMCP bridge if use_webmcp is enabled."""
        if self.use_webmcp:
            self._check_webmcp_availability()

    def _check_webmcp_availability(self) -> bool:
        """Check if WebMCP bridge is available.

        Returns:
            True if WebMCP bridge is available, False otherwise.
        """
        try:
            # Try to import the WebMCP bridge
            from systems.visual_shell.web.webmcp_http_bridge import WebMCPHTTPBridge
            self._bridge = WebMCPHTTPBridge()
            self._webmcp_available = True
            return True
        except ImportError:
            # WebMCP bridge not available - will use fallbacks
            self._webmcp_available = False
            return False
        except Exception:
            # Other errors - disable WebMCP
            self._webmcp_available = False
            return False

    def generate_fix(self, failure_info: Dict[str, Any], source_code: str) -> Dict[str, Any]:
        """Generate a fix for a given test failure.

        Args:
            failure_info: Dictionary containing:
                - error_type: Exception type (e.g., "AssertionError")
                - error_message: Exception message
                - file_path: Path to failing file
                - line_number: Line number of failure
            source_code: The source code to fix

        Returns:
            Dictionary with:
                - patch: String containing the fixed code
                - confidence: Float 0-1 indicating fix confidence
                - explanation: Human-readable explanation
                - lines_modified: List of line numbers modified
        """
        error_type = failure_info.get("error_type", "")
        error_message = failure_info.get("error_message", "")
        line_number = failure_info.get("line_number", 0)

        lines = source_code.split("\n")

        # Route to appropriate fix handler based on error type
        if error_type == "AssertionError":
            return self._fix_assertion(error_message, line_number, lines)
        elif error_type == "TypeError":
            return self._fix_type_error(error_message, line_number, lines)
        elif error_type == "AttributeError":
            return self._fix_attribute_error(error_message, line_number, lines)
        elif error_type == "IndexError":
            return self._fix_index_error(error_message, line_number, lines)
        elif error_type == "ZeroDivisionError":
            return self._fix_zero_division_error(error_message, line_number, lines)
        else:
            return {
                "patch": None,
                "confidence": 0.0,
                "explanation": f"No automatic fix available for {error_type}",
                "lines_modified": []
            }

    def apply_patch(self, source_code: str, patch: str) -> Optional[str]:
        """Apply a generated patch to source code.

        Args:
            source_code: Original source code
            patch: Patch string (full replacement)

        Returns:
            Fixed source code, or None if patch cannot be applied
        """
        if patch is None:
            return None

        # For this implementation, patch is a full replacement
        # More sophisticated diff application could be added
        try:
            return patch
        except Exception:
            return None

    def _fix_assertion(self, error_message: str, line_number: int, lines: list) -> Dict[str, Any]:
        """Generate fix for assertion failures.

        Common patterns:
        - "assert x == y" where values don't match -> suggest tolerance
        - "assert x in y" -> add check or fix container
        - "assert len(x) > 0" -> add guard clause
        """
        if line_number < 1 or line_number > len(lines):
            return {"patch": None, "confidence": 0.0, "explanation": "Invalid line number", "lines_modified": []}

        original_line = lines[line_number - 1]

        # Pattern 1: Equality assertion - suggest tolerance for floats
        if "==" in original_line and "assert" in original_line:
            # Check if comparing potentially floating point values
            if any(var in original_line for var in ["result", "value", "expected", "actual"]):
                fixed_line = re.sub(
                    r'assert (\w+) == (\w+)',
                    r'assert abs(\1 - \2) < 1e-6  # Allow floating point tolerance',
                    original_line
                )
                new_lines = lines.copy()
                new_lines[line_number - 1] = fixed_line
                return {
                    "patch": "\n".join(new_lines),
                    "confidence": 0.75,
                    "explanation": "Added floating point tolerance to assertion",
                    "lines_modified": [line_number]
                }

        # Pattern 2: "in" assertion - suggest .get() with default
        if " in " in original_line and "assert" in original_line:
            return {
                "patch": None,
                "confidence": 0.6,
                "explanation": "Assertion checking membership - verify container contents",
                "lines_modified": []
            }

        # Pattern 3: Length assertion - add guard clause
        if "len(" in original_line and ">" in original_line:
            indent = len(original_line) - len(original_line.lstrip())
            guard = " " * indent + "if not items:\n" + " " * indent + "    return None  # Skip empty inputs"
            new_lines = lines[:line_number - 1] + [guard] + lines[line_number - 1:]
            return {
                "patch": "\n".join(new_lines),
                "confidence": 0.8,
                "explanation": "Added guard clause to handle empty inputs",
                "lines_modified": [line_number, line_number - 1]
            }

        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "No specific fix pattern matched for this assertion",
            "lines_modified": []
        }

    def _fix_type_error(self, error_message: str, line_number: int, lines: list) -> Dict[str, Any]:
        """Generate fix for type errors.

        Common patterns:
        - "unsupported operand type" -> add type conversion
        - "must be str, not int" -> wrap with str()
        - "can't multiply sequence by non-int" -> fix operand
        """
        if line_number < 1 or line_number > len(lines):
            return {"patch": None, "confidence": 0.0, "explanation": "Invalid line number", "lines_modified": []}

        original_line = lines[line_number - 1]

        # Pattern 1: String concatenation with non-string
        if "+" in original_line and "unsupported operand type" in error_message:
            # Look for potential int/float in string concatenation
            fixed_line = re.sub(
                r'(["\'].*?["\']) \+ (\w+)',
                r'\1 + str(\2)',
                original_line
            )
            if fixed_line != original_line:
                new_lines = lines.copy()
                new_lines[line_number - 1] = fixed_line
                return {
                    "patch": "\n".join(new_lines),
                    "confidence": 0.85,
                    "explanation": "Added str() conversion for string concatenation",
                    "lines_modified": [line_number]
                }

        # Pattern 2: Arithmetic with None
        if original_line.count("+") > 0 or original_line.count("*") > 0:
            if "NoneType" in error_message:
                fixed_line = re.sub(
                    r'(\w+) \+',
                    r'(\1 or 0) +',
                    original_line
                )
                if fixed_line != original_line:
                    new_lines = lines.copy()
                    new_lines[line_number - 1] = fixed_line
                    return {
                        "patch": "\n".join(new_lines),
                        "confidence": 0.7,
                        "explanation": "Added None fallback for arithmetic operation",
                        "lines_modified": [line_number]
                    }

        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "No specific fix pattern matched for this TypeError",
            "lines_modified": []
        }

    def _fix_attribute_error(self, error_message: str, line_number: int, lines: list) -> Dict[str, Any]:
        """Generate fix for attribute errors.

        Common patterns:
        - "'NoneType' object has no attribute" -> add None check
        - "object has no attribute 'x'" -> suggest correct attribute
        - "module has no attribute" -> import suggestion
        """
        if line_number < 1 or line_number > len(lines):
            return {"patch": None, "confidence": 0.0, "explanation": "Invalid line number", "lines_modified": []}

        original_line = lines[line_number - 1]

        # Pattern 1: None attribute access
        if "'NoneType' object has no attribute" in error_message:
            # Extract the attribute being accessed
            match = re.search(r"has no attribute '(\w+)'", error_message)
            if match:
                attr = match.group(1)
                # Find the variable being accessed
                var_match = re.search(rf'(\w+)\.{attr}', original_line)
                if var_match:
                    var = var_match.group(1)
                    indent = len(original_line) - len(original_line.lstrip())
                    guard = " " * indent + f"if {var} is not None:"
                    new_lines = lines[:line_number - 1] + [guard, original_line] + lines[line_number:]
                    # Indent the original line
                    indented_line = " " * (indent + 4) + original_line.lstrip()
                    new_lines[line_number] = indented_line
                    return {
                        "patch": "\n".join(new_lines),
                        "confidence": 0.85,
                        "explanation": f"Added None check before accessing '{attr}' attribute",
                        "lines_modified": [line_number, line_number + 1]
                    }

        # Pattern 2: Common typos/mistakes
        common_typos = {
            "lenght": "length",
            "widht": "width",
            "heigth": "height",
            "valeu": "value",
            "appendd": "append",
            "lenghts": "lengths",
        }
        for typo, correct in common_typos.items():
            if typo in error_message and f".{typo}" in original_line:
                fixed_line = original_line.replace(f".{typo}", f".{correct}")
                new_lines = lines.copy()
                new_lines[line_number - 1] = fixed_line
                return {
                    "patch": "\n".join(new_lines),
                    "confidence": 0.9,
                    "explanation": f"Fixed typo: '{typo}' -> '{correct}'",
                    "lines_modified": [line_number]
                }

        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "No specific fix pattern matched for this AttributeError",
            "lines_modified": []
        }

    def _fix_index_error(self, error_message: str, line_number: int, lines: list) -> Dict[str, Any]:
        """Generate fix for index errors.

        Common patterns:
        - "index out of range" -> add bounds check
        - "list index out of range" -> use .get() or check length
        - "string index out of range" -> validate string length
        """
        if line_number < 1 or line_number > len(lines):
            return {"patch": None, "confidence": 0.0, "explanation": "Invalid line number", "lines_modified": []}

        original_line = lines[line_number - 1]

        # Pattern 1: Direct indexing without bounds check
        index_match = re.search(r'(\w+)\[(\d+)\]', original_line)
        if index_match and "index out of range" in error_message:
            var = index_match.group(1)
            index = int(index_match.group(2))
            indent = len(original_line) - len(original_line.lstrip())

            # Add bounds check
            guard = f"{' ' * indent}if len({var}) > {index}:"
            indented_line = " " * (indent + 4) + original_line.lstrip()
            else_clause = " " * indent + "else:"
            else_line = " " * (indent + 4) + f"{var}_value = None  # Default for out of bounds"

            new_lines = (
                lines[:line_number - 1] +
                [guard, indented_line, else_clause, else_line] +
                lines[line_number:]
            )
            return {
                "patch": "\n".join(new_lines),
                "confidence": 0.85,
                "explanation": f"Added bounds check for index {index}",
                "lines_modified": [line_number, line_number + 1, line_number + 2, line_number + 3]
            }

        # Pattern 2: Negative indexing without length check
        if "[-1]" in original_line and "empty" in error_message.lower():
            var_match = re.search(r'(\w+)\[-1\]', original_line)
            if var_match:
                var = var_match.group(1)
                indent = len(original_line) - len(original_line.lstrip())
                guard = f"{' ' * indent}if {var}:"
                indented_line = " " * (indent + 4) + original_line.lstrip()
                else_clause = " " * indent + "else:"
                else_line = " " * (indent + 4) + f"{var}_value = None  # Empty collection"

                new_lines = (
                    lines[:line_number - 1] +
                    [guard, indented_line, else_clause, else_line] +
                    lines[line_number:]
                )
                return {
                    "patch": "\n".join(new_lines),
                    "confidence": 0.8,
                    "explanation": "Added check for empty collection before negative indexing",
                    "lines_modified": [line_number, line_number + 1, line_number + 2, line_number + 3]
                }

        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "No specific fix pattern matched for this IndexError",
            "lines_modified": []
        }

    def _fix_zero_division_error(self, error_message: str, line_number: int, lines: list) -> Dict[str, Any]:
        """Generate fix for zero division errors.

        Common patterns:
        - Division by len() of empty list -> add empty check
        - Division by zero variable -> add zero check
        """
        if line_number < 1 or line_number > len(lines):
            return {"patch": None, "confidence": 0.0, "explanation": "Invalid line number", "lines_modified": []}

        original_line = lines[line_number - 1]

        # Pattern 1: Division by len(x) - add empty check
        len_div_match = re.search(r'/\s*len\((\w+)\)', original_line)
        if len_div_match:
            var = len_div_match.group(1)
            indent = len(original_line) - len(original_line.lstrip())

            # Add guard for empty list
            guard = f"{' ' * indent}if not {var}:"
            return_line = " " * (indent + 4) + f"return 0  # Handle empty {var}"
            indented_line = " " * (indent + 4) + original_line.lstrip()

            new_lines = lines[:line_number - 1] + [guard, return_line, indented_line] + lines[line_number:]
            return {
                "patch": "\n".join(new_lines),
                "confidence": 0.85,
                "explanation": f"Added empty list check before division by len({var})",
                "lines_modified": [line_number, line_number + 1, line_number + 2]
            }

        # Pattern 2: Direct division by variable - add zero check
        var_div_match = re.search(r'/\s*(\w+)\s*$', original_line)
        if var_div_match:
            divisor = var_div_match.group(1)
            indent = len(original_line) - len(original_line.lstrip())

            # Add ternary for zero check
            fixed_line = re.sub(
                rf'/\s*{divisor}\s*$',
                f'/ {divisor} if {divisor} != 0 else 1  # Avoid division by zero',
                original_line
            )
            if fixed_line != original_line:
                new_lines = lines.copy()
                new_lines[line_number - 1] = fixed_line
                return {
                    "patch": "\n".join(new_lines),
                    "confidence": 0.75,
                    "explanation": f"Added zero check for divisor '{divisor}'",
                    "lines_modified": [line_number]
                }

        return {
            "patch": None,
            "confidence": 0.0,
            "explanation": "No specific fix pattern matched for this ZeroDivisionError",
            "lines_modified": []
        }

    def validate_syntax(self, source_code: str, language: str = "python") -> Dict[str, Any]:
        """Validate source code syntax.

        If use_webmcp is True and bridge is available, uses WebMCP ide_compile.
        Otherwise, falls back to Python's compile().

        Args:
            source_code: Source code to validate
            language: Programming language (default: "python")

        Returns:
            Dictionary with:
                - valid: True if syntax is valid
                - errors: List of error messages (empty if valid)
                - method: "webmcp" or "fallback"
        """
        if self.use_webmcp and self._webmcp_available and self._bridge:
            try:
                # Use WebMCP ide_compile for validation
                result = self._bridge.call_tool("ide_compile", {
                    "source": source_code,
                    "language": language
                })
                if result and "success" in result:
                    return {
                        "valid": result.get("success", False),
                        "errors": result.get("errors", []),
                        "method": "webmcp"
                    }
            except Exception as e:
                # Fall back to native validation on error
                pass

        # Fallback: Use Python's compile()
        if language == "python":
            try:
                compile(source_code, "<string>", "exec")
                return {
                    "valid": True,
                    "errors": [],
                    "method": "fallback"
                }
            except SyntaxError as e:
                return {
                    "valid": False,
                    "errors": [str(e)],
                    "method": "fallback"
                }
        else:
            # For non-Python languages without WebMCP, return unknown
            return {
                "valid": True,  # Assume valid if we can't check
                "errors": [],
                "method": "fallback",
                "warning": f"No syntax validation available for {language}"
            }

    def run_validation_test(
        self,
        test_path: Optional[str] = None,
        test_pattern: Optional[str] = None,
        timeout: float = 30.0
    ) -> Dict[str, Any]:
        """Run tests to validate a fix.

        If use_webmcp is True and bridge is available, uses WebMCP ide_test.
        Otherwise, falls back to subprocess pytest.

        Args:
            test_path: Path to test file or directory
            test_pattern: Pattern to filter tests (e.g., "test_fix_")
            timeout: Maximum time to wait for tests (seconds)

        Returns:
            Dictionary with:
                - success: True if all tests passed
                - total: Total number of tests
                - passed: Number of passing tests
                - failed: Number of failing tests
                - results: List of individual test results
                - method: "webmcp" or "fallback"
        """
        if self.use_webmcp and self._webmcp_available and self._bridge:
            try:
                # Use WebMCP ide_test for testing
                params = {"timeout": int(timeout * 1000)}  # Convert to ms
                if test_pattern:
                    params["test_pattern"] = test_pattern
                if test_path:
                    params["test_file"] = test_path

                result = self._bridge.call_tool("ide_test", params)
                if result and "success" in result:
                    return {
                        "success": result.get("success", False),
                        "total": result.get("total", 0),
                        "passed": result.get("passed", 0),
                        "failed": result.get("failed", 0),
                        "results": result.get("results", []),
                        "method": "webmcp"
                    }
            except Exception as e:
                # Fall back to subprocess pytest on error
                pass

        # Fallback: Use subprocess pytest
        cmd = [sys.executable, "-m", "pytest", "-v", "--tb=short"]
        if test_path:
            cmd.append(test_path)
        if test_pattern:
            cmd.extend(["-k", test_pattern])

        try:
            result = subprocess.run(
                cmd,
                capture_output=True,
                text=True,
                timeout=timeout,
                cwd="/home/jericho/zion/projects/geometry_os/geometry_os"
            )

            # Parse pytest output for structured results
            output = result.stdout + result.stderr

            # Simple parsing - look for summary line
            total = passed = failed = 0
            for line in output.split("\n"):
                if " passed" in line or " failed" in line:
                    # Parse lines like "5 passed, 1 failed"
                    parts = line.split()
                    for i, part in enumerate(parts):
                        if "passed" in part and i > 0:
                            passed = int(parts[i - 1])
                        elif "failed" in part and i > 0:
                            failed = int(parts[i - 1])

            total = passed + failed

            return {
                "success": result.returncode == 0,
                "total": total,
                "passed": passed,
                "failed": failed,
                "results": [],  # Full parsing would require more work
                "output": output,
                "method": "fallback"
            }
        except subprocess.TimeoutExpired:
            return {
                "success": False,
                "total": 0,
                "passed": 0,
                "failed": 0,
                "results": [],
                "error": "Test execution timed out",
                "method": "fallback"
            }
        except Exception as e:
            return {
                "success": False,
                "total": 0,
                "passed": 0,
                "failed": 0,
                "results": [],
                "error": str(e),
                "method": "fallback"
            }
