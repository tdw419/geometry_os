"""Tests for AutofixGenerator.

Tests the fix generation capabilities for common code issues.
"""

import pytest

from systems.pixel_compiler.autofix.fixer import AutofixGenerator


class TestAutofixGenerator:
    """Test suite for AutofixGenerator."""

    def test_generator_initializes(self):
        """Test that generator initializes with defaults."""
        generator = AutofixGenerator()
        assert generator.confidence_threshold == 0.7
        assert generator.max_fix_size == 10
        assert generator._fix_count == 0

    def test_generator_initializes_with_custom_values(self):
        """Test that generator accepts custom configuration."""
        generator = AutofixGenerator(
            confidence_threshold=0.9,
            max_fix_size=20
        )
        assert generator.confidence_threshold == 0.9
        assert generator.max_fix_size == 20

    def test_generate_fix_returns_patch_dict(self):
        """Test that generate_fix returns expected structure."""
        generator = AutofixGenerator()
        source_code = "def test_example():\n    assert result == expected\n"
        failure_info = {
            "error_type": "AssertionError",
            "error_message": "assertion failed",
            "file_path": "test.py",
            "line_number": 2
        }

        result = generator.generate_fix(failure_info, source_code)

        # Check structure
        assert "patch" in result
        assert "confidence" in result
        assert "explanation" in result
        assert "lines_modified" in result

        # Check types
        assert isinstance(result["confidence"], float)
        assert isinstance(result["explanation"], str)
        assert isinstance(result["lines_modified"], list)

    def test_generate_fix_for_type_error_with_concatenation(self):
        """Test fix generation for string concatenation TypeError."""
        generator = AutofixGenerator()
        source_code = "result = 'Value: ' + count\n"
        failure_info = {
            "error_type": "TypeError",
            "error_message": "unsupported operand type(s) for +: 'int' and 'str'",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert result["confidence"] > 0.7
        assert "str(" in result["patch"]
        assert result["explanation"] is not None

    def test_generate_fix_for_attribute_error_with_none(self):
        """Test fix generation for None attribute access."""
        generator = AutofixGenerator()
        source_code = "value = data.result\n"
        failure_info = {
            "error_type": "AttributeError",
            "error_message": "'NoneType' object has no attribute 'result'",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert "patch" in result
        assert "confidence" in result
        assert result["explanation"] is not None

    def test_generate_fix_for_index_error(self):
        """Test fix generation for index out of range."""
        generator = AutofixGenerator()
        source_code = "item = items[5]\n"
        failure_info = {
            "error_type": "IndexError",
            "error_message": "list index out of range",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert "patch" in result
        assert "confidence" in result
        assert "bounds check" in result["explanation"].lower()

    def test_generate_fix_for_unknown_error_type(self):
        """Test that unknown error types return zero confidence."""
        generator = AutofixGenerator()
        source_code = "def test():\n    pass\n"
        failure_info = {
            "error_type": "CustomError",
            "error_message": "some error",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert result["confidence"] == 0.0
        assert result["patch"] is None
        assert "No automatic fix available" in result["explanation"]

    def test_apply_patch_modifies_code(self):
        """Test that apply_patch returns the patch string."""
        generator = AutofixGenerator()
        source_code = "original code\n"
        patch = "fixed code\n"

        result = generator.apply_patch(source_code, patch)

        assert result == patch

    def test_apply_patch_returns_none_on_mismatch(self):
        """Test that apply_patch returns None for None patch."""
        generator = AutofixGenerator()
        source_code = "original code\n"

        result = generator.apply_patch(source_code, None)

        assert result is None

    def test_fix_assertion_with_equality(self):
        """Test fixing equality assertions with float tolerance."""
        generator = AutofixGenerator()
        source_code = "def test():\n    assert result == expected\n"
        failure_info = {
            "error_type": "AssertionError",
            "error_message": "assertion failed",
            "file_path": "test.py",
            "line_number": 2
        }

        result = generator.generate_fix(failure_info, source_code)

        # Should add floating point tolerance
        assert result["confidence"] > 0.7
        assert "1e-6" in result["patch"] or result["confidence"] == 0.0

    def test_fix_assertion_with_invalid_line_number(self):
        """Test that invalid line numbers are handled gracefully."""
        generator = AutofixGenerator()
        source_code = "def test():\n    pass\n"
        failure_info = {
            "error_type": "AssertionError",
            "error_message": "assertion failed",
            "file_path": "test.py",
            "line_number": 999
        }

        result = generator.generate_fix(failure_info, source_code)

        assert result["confidence"] == 0.0
        assert "Invalid line number" in result["explanation"]

    def test_fix_type_error_with_none_arithmetic(self):
        """Test fixing arithmetic with None values."""
        generator = AutofixGenerator()
        source_code = "total = value + 10\n"
        failure_info = {
            "error_type": "TypeError",
            "error_message": "unsupported operand type(s) for +: 'NoneType' and 'int'",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert "patch" in result
        assert "confidence" in result

    def test_fix_index_error_with_negative_index(self):
        """Test fixing negative index on empty collection."""
        generator = AutofixGenerator()
        source_code = "last = items[-1]\n"
        failure_info = {
            "error_type": "IndexError",
            "error_message": "index out of range (empty)",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert "patch" in result
        assert result["confidence"] > 0.0
        assert "empty" in result["explanation"].lower()

    def test_fix_attribute_error_with_typo(self):
        """Test fixing common attribute name typos."""
        generator = AutofixGenerator()
        source_code = "length = data.lenght\n"
        failure_info = {
            "error_type": "AttributeError",
            "error_message": "'MyClass' object has no attribute 'lenght'",
            "file_path": "test.py",
            "line_number": 1
        }

        result = generator.generate_fix(failure_info, source_code)

        assert result["confidence"] > 0.8
        assert "length" in result["patch"]

    def test_fix_count_increments(self):
        """Test internal fix counter (future use for metrics)."""
        generator = AutofixGenerator()
        assert generator._fix_count == 0

        # The counter is placeholder for future metrics tracking
        # This test verifies the attribute exists and is initialized
        assert hasattr(generator, "_fix_count")
