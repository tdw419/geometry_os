# systems/pixel_compiler/tests/test_protocol_validator.py
import pytest
from systems.pixel_compiler.a2a_load_test.protocol_validator import (
    ProtocolValidator,
    ValidationResult
)


class TestValidationResult:
    """Tests for validation result."""

    def test_result_valid(self):
        """Valid result has no errors."""
        result = ValidationResult(valid=True)

        assert result.valid is True
        assert result.errors == []

    def test_result_invalid(self):
        """Invalid result has errors."""
        result = ValidationResult(valid=False, errors=["Missing field"])

        assert result.valid is False
        assert "Missing field" in result.errors


class TestProtocolValidator:
    """Tests for protocol validation."""

    def test_validator_creation(self):
        """Can create a protocol validator."""
        validator = ProtocolValidator()

        assert len(validator.rules) > 0

    def test_validate_message_format(self):
        """Validates message format."""
        validator = ProtocolValidator()

        # Valid message
        result = validator.validate_message({
            "type": "direct",
            "from_agent": "agent-1",
            "to_agent": "agent-2",
            "payload": {}
        })

        assert result.valid is True

    def test_validate_missing_field(self):
        """Catches missing required fields."""
        validator = ProtocolValidator()

        result = validator.validate_message({
            "type": "direct",
            "from_agent": "agent-1"
            # Missing to_agent
        })

        assert result.valid is False
        assert any("to_agent" in e.lower() or "required" in e.lower() for e in result.errors)

    def test_validate_invalid_type(self):
        """Catches invalid message types."""
        validator = ProtocolValidator()

        result = validator.validate_message({
            "type": "invalid_type",
            "from_agent": "agent-1"
        })

        assert result.valid is False

    def test_validate_register_sequence(self):
        """Validates registration sequence."""
        validator = ProtocolValidator()

        validator.start_session()
        validator.record_message({"type": "register", "agent_id": "a1"})

        result = validator.validate_sequence()

        assert result.valid is True

    def test_validate_message_before_register(self):
        """Catches messages before registration."""
        validator = ProtocolValidator()

        validator.start_session()
        validator.record_message({"type": "direct", "from_agent": "a1"})

        result = validator.validate_sequence()

        assert result.valid is False
        assert any("register" in e.lower() for e in result.errors)
