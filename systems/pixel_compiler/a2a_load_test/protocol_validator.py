"""Protocol validation for A2A testing."""
from dataclasses import dataclass, field
from typing import Dict, List, Set, Optional


class ValidationRule:
    """A validation rule for A2A messages."""
    def __init__(self, name: str, check_fn):
        self.name = name
        self.check = check_fn


@dataclass
class ValidationResult:
    """Result of protocol validation."""
    valid: bool
    errors: List[str] = field(default_factory=list)
    warnings: List[str] = field(default_factory=list)


class ProtocolValidator:
    """Validates A2A protocol compliance."""

    VALID_TYPES = {
        "register", "unregister", "heartbeat", "discover",
        "direct", "broadcast",
        "lock_request", "lock_release",
        "barrier_enter", "barrier_release",
        "ack", "error"
    }

    REQUIRED_FIELDS = {
        "register": ["agent_id"],
        "direct": ["from_agent", "to_agent"],
        "broadcast": ["from_agent"],
        "lock_request": ["agent_id", "lock_id"],
        "barrier_enter": ["agent_id", "barrier_id"]
    }

    def __init__(self):
        self.rules: List[ValidationRule] = []
        self._session_messages: List[Dict] = []
        self._registered_agents: Set[str] = set()
        self._setup_default_rules()

    def _setup_default_rules(self):
        """Set up default validation rules."""
        self.rules.append(ValidationRule(
            "valid_type",
            lambda m: m.get("type") in self.VALID_TYPES
        ))
        self.rules.append(ValidationRule(
            "required_fields",
            self._check_required_fields
        ))

    def _check_required_fields(self, message: Dict) -> bool:
        """Check required fields for message type."""
        msg_type = message.get("type")
        required = self.REQUIRED_FIELDS.get(msg_type, [])
        return all(f in message for f in required)

    def validate_message(self, message: Dict) -> ValidationResult:
        """Validate a single message."""
        errors = []

        for rule in self.rules:
            if not rule.check(message):
                errors.append(f"Rule '{rule.name}' failed for message type {message.get('type')}")

        return ValidationResult(
            valid=len(errors) == 0,
            errors=errors
        )

    def start_session(self):
        """Start a new validation session."""
        self._session_messages = []
        self._registered_agents = set()

    def record_message(self, message: Dict):
        """Record a message for sequence validation."""
        self._session_messages.append(message)

        if message.get("type") == "register":
            self._registered_agents.add(message.get("agent_id"))

    def validate_sequence(self) -> ValidationResult:
        """Validate message sequence."""
        errors = []

        for i, msg in enumerate(self._session_messages):
            msg_type = msg.get("type")

            # Check registration before other operations
            if msg_type in ("direct", "broadcast", "lock_request"):
                agent = msg.get("from_agent") or msg.get("agent_id")
                if agent and agent not in self._registered_agents:
                    errors.append(f"Message {i}: {agent} not registered before {msg_type}")

        return ValidationResult(
            valid=len(errors) == 0,
            errors=errors
        )
