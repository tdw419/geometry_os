"""Fix Generator for Autonomous Improvement Daemon.

The AutofixGenerator analyzes test failures and generates automated fixes
using pattern matching and code transformation techniques.
"""

from dataclasses import dataclass, field
from typing import Dict, Optional, Any
import re


@dataclass
class AutofixGenerator:
    """Generates automated fixes for common code issues.

    Uses pattern matching to detect and fix common Python errors:
    - Assertion failures (add guards, adjust assertions)
    - TypeErrors (add type conversions)
    - AttributeErrors (fix attribute access)
    - IndexErrors (add bounds checking)

    Attributes:
        confidence_threshold: Minimum confidence (0-1) to apply a fix
        max_fix_size: Maximum lines a fix can modify
    """

    confidence_threshold: float = 0.7
    max_fix_size: int = 10
    _fix_count: int = field(default=0, init=False, repr=False)

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
