"""
Configuration Schema System

Defines configuration schemas with validation rules, type checking,
and metadata for all Geometry OS components.
"""

from dataclasses import dataclass, field
from datetime import datetime
from enum import Enum
from pathlib import Path
from typing import Any


class ConfigDataType(Enum):
    """Supported configuration data types."""
    STRING = "string"
    INTEGER = "integer"
    FLOAT = "float"
    BOOLEAN = "boolean"
    LIST = "list"
    DICT = "dict"
    PATH = "path"
    URL = "url"
    PORT = "port"
    DURATION = "duration"  # e.g., "30s", "5m", "1h"


class ConfigSource(Enum):
    """Source of a configuration value."""
    DEFAULT = "default"
    FILE = "file"
    ENVIRONMENT = "environment"
    RUNTIME = "runtime"
    REMOTE = "remote"
    DEPLOYED = "deployed"


class ConfigPriority(Enum):
    """Priority levels for configuration sources."""
    DEPLOYED = 100    # Highest - from central deployment
    RUNTIME = 80      # Set programmatically
    ENVIRONMENT = 60  # Environment variables
    FILE = 40         # Configuration files
    DEFAULT = 20      # Schema defaults


@dataclass
class ConfigValidationError(Exception):
    """Raised when configuration validation fails."""
    key: str
    message: str
    value: Any = None
    expected_type: str | None = None

    def __str__(self) -> str:
        if self.expected_type:
            return f"Config validation error for '{self.key}': {self.message} (expected {self.expected_type}, got {type(self.value).__name__})"
        return f"Config validation error for '{self.key}': {self.message}"


@dataclass
class ConfigValue:
    """
    Single configuration value with metadata and validation.

    Attributes:
        key: Dot-notation key (e.g., "cache.size_mb")
        value: Current value
        data_type: Expected data type
        default: Default value if not set
        description: Human-readable description
        source: Where the value came from
        min_value: Minimum for numeric types
        max_value: Maximum for numeric types
        choices: Allowed values for enum-like strings
        required: Whether this must be set
        secret: Whether to mask in logs/exports
        env_var: Environment variable name
        pattern: Regex pattern for string validation
        deprecated: Whether this option is deprecated
        deprecation_message: Message if deprecated
    """
    key: str
    value: Any
    data_type: ConfigDataType
    default: Any = None
    description: str = ""
    source: ConfigSource = ConfigSource.DEFAULT
    priority: ConfigPriority = ConfigPriority.DEFAULT
    min_value: int | float | None = None
    max_value: int | float | None = None
    choices: list[Any] | None = None
    required: bool = False
    secret: bool = False
    env_var: str | None = None
    pattern: str | None = None
    deprecated: bool = False
    deprecation_message: str = ""
    last_modified: datetime = field(default_factory=datetime.now)
    version: int = 1

    def to_dict(self, include_secret: bool = False) -> dict[str, Any]:
        """Convert to dictionary representation."""
        return {
            "key": self.key,
            "value": "***" if self.secret and not include_secret else self.value,
            "type": self.data_type.value,
            "default": self.default,
            "description": self.description,
            "source": self.source.value,
            "priority": self.priority.value,
            "required": self.required,
            "secret": self.secret,
            "deprecated": self.deprecated,
            "version": self.version,
        }

    def validate(self) -> list[str]:
        """
        Validate the configuration value.

        Returns:
            List of validation error messages (empty if valid)
        """
        errors = []

        # Check required
        if self.required and self.value is None:
            errors.append(f"Required configuration '{self.key}' is not set")
            return errors

        # Skip further validation if value is None and not required
        if self.value is None:
            return errors

        # Type validation
        type_validators = {
            ConfigDataType.STRING: lambda v: isinstance(v, str),
            ConfigDataType.INTEGER: lambda v: isinstance(v, int) and not isinstance(v, bool),
            ConfigDataType.FLOAT: lambda v: isinstance(v, (int, float)),
            ConfigDataType.BOOLEAN: lambda v: isinstance(v, bool),
            ConfigDataType.LIST: lambda v: isinstance(v, list),
            ConfigDataType.DICT: lambda v: isinstance(v, dict),
            ConfigDataType.PATH: lambda v: isinstance(v, (str, Path)),
            ConfigDataType.URL: lambda v: isinstance(v, str) and self._is_valid_url(v),
            ConfigDataType.PORT: lambda v: isinstance(v, int) and 1 <= v <= 65535,
            ConfigDataType.DURATION: lambda v: isinstance(v, str) and self._is_valid_duration(v),
        }

        validator = type_validators.get(self.data_type)
        if validator and not validator(self.value):
            errors.append(
                f"Configuration '{self.key}' has wrong type: expected {self.data_type.value}, "
                f"got {type(self.value).__name__}"
            )
            return errors  # Don't continue if type is wrong

        # Numeric range validation
        if isinstance(self.value, (int, float)) and not isinstance(self.value, bool):
            if self.min_value is not None and self.value < self.min_value:
                errors.append(
                    f"Configuration '{self.key}' value {self.value} is below minimum {self.min_value}"
                )
            if self.max_value is not None and self.value > self.max_value:
                errors.append(
                    f"Configuration '{self.key}' value {self.value} is above maximum {self.max_value}"
                )

        # Choices validation
        if self.choices and self.value not in self.choices:
            errors.append(
                f"Configuration '{self.key}' value must be one of {self.choices}, got {self.value}"
            )

        # Pattern validation for strings
        if self.pattern and isinstance(self.value, str):
            import re
            if not re.match(self.pattern, self.value):
                errors.append(
                    f"Configuration '{self.key}' value '{self.value}' does not match pattern {self.pattern}"
                )

        # Deprecation warning
        if self.deprecated:
            errors.append(
                f"DEPRECATION WARNING: Configuration '{self.key}' is deprecated. {self.deprecation_message}"
            )

        return errors

    def _is_valid_url(self, value: str) -> bool:
        """Check if value is a valid URL."""
        import re
        url_pattern = r'^https?://[^\s/$.?#].[^\s]*$'
        return bool(re.match(url_pattern, value))

    def _is_valid_duration(self, value: str) -> bool:
        """Check if value is a valid duration string."""
        import re
        duration_pattern = r'^(\d+(?:\.\d+)?)(ms|s|m|h|d)$'
        return bool(re.match(duration_pattern, value))

    def cast_value(self, value: Any) -> Any:
        """
        Cast a value to the expected type.

        Args:
            value: Value to cast

        Returns:
            Cast value

        Raises:
            ConfigValidationError: If casting fails
        """
        if value is None:
            return None

        try:
            if self.data_type == ConfigDataType.STRING:
                return str(value)
            elif self.data_type == ConfigDataType.INTEGER:
                return int(float(value))  # Handle "3.0" -> 3
            elif self.data_type == ConfigDataType.FLOAT:
                return float(value)
            elif self.data_type == ConfigDataType.BOOLEAN:
                if isinstance(value, bool):
                    return value
                if isinstance(value, str):
                    return value.lower() in ("true", "1", "yes", "on", "enabled")
                return bool(value)
            elif self.data_type == ConfigDataType.PATH:
                return Path(value)
            elif self.data_type == ConfigDataType.PORT:
                port = int(value)
                if not 1 <= port <= 65535:
                    raise ValueError(f"Port {port} out of range 1-65535")
                return port
            elif self.data_type == ConfigDataType.DURATION:
                if isinstance(value, (int, float)):
                    return f"{value}s"  # Default to seconds
                return str(value)
            else:
                return value
        except (ValueError, TypeError) as e:
            raise ConfigValidationError(
                key=self.key,
                message=f"Cannot cast '{value}' to {self.data_type.value}: {e}",
                value=value,
                expected_type=self.data_type.value
            )


@dataclass
class ConfigSchema:
    """
    Schema defining all configuration options for a component.

    A schema is a collection of ConfigValue definitions that describe
    all valid configuration options for a component.
    """

    component: str
    description: str = ""
    version: str = "1.0.0"
    values: dict[str, ConfigValue] = field(default_factory=dict)

    def add(
        self,
        key: str,
        data_type: ConfigDataType,
        default: Any = None,
        description: str = "",
        min_value: int | float | None = None,
        max_value: int | float | None = None,
        choices: list[Any] | None = None,
        required: bool = False,
        secret: bool = False,
        env_var: str | None = None,
        pattern: str | None = None,
        deprecated: bool = False,
        deprecation_message: str = "",
    ) -> ConfigValue:
        """
        Add a configuration option to the schema.

        Args:
            key: Dot-notation key (e.g., "cache.size_mb")
            data_type: Expected data type
            default: Default value
            description: Human-readable description
            min_value: Minimum for numeric types
            max_value: Maximum for numeric types
            choices: Allowed values for enum-like options
            required: Whether this must be set
            secret: Whether to mask in logs
            env_var: Environment variable name (auto-generated if not provided)
            pattern: Regex pattern for string validation
            deprecated: Whether this option is deprecated
            deprecation_message: Message explaining deprecation

        Returns:
            The created ConfigValue
        """
        # Auto-generate env var name if not provided
        if env_var is None:
            env_var = f"GEO_{self.component.upper()}_{key.upper().replace('.', '_')}"

        value = ConfigValue(
            key=key,
            value=default,
            data_type=data_type,
            default=default,
            description=description,
            source=ConfigSource.DEFAULT,
            min_value=min_value,
            max_value=max_value,
            choices=choices,
            required=required,
            secret=secret,
            env_var=env_var,
            pattern=pattern,
            deprecated=deprecated,
            deprecation_message=deprecation_message,
        )
        self.values[key] = value
        return value

    def get(self, key: str) -> ConfigValue | None:
        """Get a configuration value by key."""
        return self.values.get(key)

    def validate_all(self, current_values: dict[str, Any]) -> dict[str, list[str]]:
        """
        Validate all configuration values.

        Args:
            current_values: Current configuration values

        Returns:
            Dictionary mapping keys to lists of error messages
        """
        errors = {}
        for key, config in self.values.items():
            config.value = current_values.get(key, config.default)
            key_errors = config.validate()
            if key_errors:
                errors[key] = key_errors
        return errors

    def to_dict(self) -> dict[str, Any]:
        """Export schema as dictionary."""
        return {
            "component": self.component,
            "description": self.description,
            "version": self.version,
            "values": {k: v.to_dict(include_secret=True) for k, v in self.values.items()},
        }

    @classmethod
    def from_dict(cls, data: dict[str, Any]) -> "ConfigSchema":
        """Create schema from dictionary."""
        schema = cls(
            component=data["component"],
            description=data.get("description", ""),
            version=data.get("version", "1.0.0"),
        )

        for key, value_data in data.get("values", {}).items():
            value = ConfigValue(
                key=key,
                value=value_data.get("value"),
                data_type=ConfigDataType(value_data["type"]),
                default=value_data.get("default"),
                description=value_data.get("description", ""),
                source=ConfigSource(value_data.get("source", "default")),
                min_value=value_data.get("min_value"),
                max_value=value_data.get("max_value"),
                choices=value_data.get("choices"),
                required=value_data.get("required", False),
                secret=value_data.get("secret", False),
                env_var=value_data.get("env_var"),
                deprecated=value_data.get("deprecated", False),
                deprecation_message=value_data.get("deprecation_message", ""),
            )
            schema.values[key] = value

        return schema

    def get_defaults(self) -> dict[str, Any]:
        """Get all default values."""
        return {key: config.default for key, config in self.values.items()}

    def get_env_mappings(self) -> dict[str, str]:
        """Get mapping of keys to environment variable names."""
        return {key: config.env_var for key, config in self.values.items() if config.env_var}
