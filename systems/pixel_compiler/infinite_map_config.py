#!/usr/bin/env python3
"""
Infinite Map Configuration Management System.

Provides configuration management with validation, defaults,
hot reload, and environment variable support.

Key Components:
- ConfigValue: Single configuration value with metadata
- ConfigSection: Grouped configuration options
- ConfigManager: Configuration management interface
- ConfigValidator: Validates configuration values

Usage:
    from infinite_map_config import ConfigManager

    config = ConfigManager("config.yaml")

    # Get value with default
    cache_size = config.get("cache.size_mb", default=100)

    # Set value
    config.set("cache.size_mb", 200)

    # Watch for changes
    config.watch("cache.size_mb", lambda k, v: print(f"Changed: {v}"))

    # Reload from file
    config.reload()
"""

import os
import json
import yaml
import threading
from pathlib import Path
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any, Callable, Type, Union, Set, Tuple, TypeVar
from datetime import datetime
from enum import Enum
import logging

# Set up logging
logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)

# Type variable for generic methods
T = TypeVar('T')


class ConfigSource(Enum):
    """Source of configuration value."""
    DEFAULT = "default"
    FILE = "file"
    ENVIRONMENT = "environment"
    RUNTIME = "runtime"


class ConfigDataType(Enum):
    """Data type for configuration values."""
    STRING = "string"
    INTEGER = "integer"
    FLOAT = "float"
    BOOLEAN = "boolean"
    LIST = "list"
    DICT = "dict"
    PATH = "path"


@dataclass
class ConfigValue:
    """Single configuration value with metadata."""
    key: str
    value: Any
    data_type: ConfigDataType
    default: Any = None
    description: str = ""
    source: ConfigSource = ConfigSource.DEFAULT
    min_value: Optional[Union[int, float]] = None
    max_value: Optional[Union[int, float]] = None
    choices: Optional[List[Any]] = None
    required: bool = False
    secret: bool = False
    env_var: Optional[str] = None
    last_modified: datetime = field(default_factory=datetime.now)

    def to_dict(self) -> Dict[str, Any]:
        """Convert to dictionary."""
        return {
            "key": self.key,
            "value": "***" if self.secret else self.value,
            "type": self.data_type.value,
            "default": self.default,
            "description": self.description,
            "source": self.source.value,
            "required": self.required,
            "secret": self.secret
        }

    def validate(self) -> Tuple[bool, str]:
        """Validate the configuration value."""
        # Check required
        if self.required and self.value is None:
            return False, f"Required configuration '{self.key}' is not set"

        # Check type
        type_validators = {
            ConfigDataType.STRING: lambda v: isinstance(v, str),
            ConfigDataType.INTEGER: lambda v: isinstance(v, int) and not isinstance(v, bool),
            ConfigDataType.FLOAT: lambda v: isinstance(v, (int, float)),
            ConfigDataType.BOOLEAN: lambda v: isinstance(v, bool),
            ConfigDataType.LIST: lambda v: isinstance(v, list),
            ConfigDataType.DICT: lambda v: isinstance(v, dict),
            ConfigDataType.PATH: lambda v: isinstance(v, (str, Path)),
        }

        if self.value is not None:
            validator = type_validators.get(self.data_type)
            if validator and not validator(self.value):
                return False, f"Configuration '{self.key}' has wrong type, expected {self.data_type.value}"

        # Check min/max
        if isinstance(self.value, (int, float)):
            if self.min_value is not None and self.value < self.min_value:
                return False, f"Configuration '{self.key}' value {self.value} is below minimum {self.min_value}"
            if self.max_value is not None and self.value > self.max_value:
                return False, f"Configuration '{self.key}' value {self.value} is above maximum {self.max_value}"

        # Check choices
        if self.choices and self.value not in self.choices:
            return False, f"Configuration '{self.key}' value must be one of {self.choices}"

        return True, ""

    def cast_value(self, value: Any) -> Any:
        """Cast value to the correct type."""
        if value is None:
            return None

        try:
            if self.data_type == ConfigDataType.STRING:
                return str(value)
            elif self.data_type == ConfigDataType.INTEGER:
                return int(value)
            elif self.data_type == ConfigDataType.FLOAT:
                return float(value)
            elif self.data_type == ConfigDataType.BOOLEAN:
                if isinstance(value, bool):
                    return value
                if isinstance(value, str):
                    return value.lower() in ("true", "1", "yes", "on")
                return bool(value)
            elif self.data_type == ConfigDataType.PATH:
                return Path(value)
            else:
                return value
        except (ValueError, TypeError) as e:
            raise ValueError(f"Cannot cast '{value}' to {self.data_type.value}: {e}")


@dataclass
class ConfigSchema:
    """Schema defining all configuration options."""
    values: Dict[str, ConfigValue] = field(default_factory=dict)

    def add(
        self,
        key: str,
        data_type: ConfigDataType,
        default: Any = None,
        description: str = "",
        min_value: Optional[Union[int, float]] = None,
        max_value: Optional[Union[int, float]] = None,
        choices: Optional[List[Any]] = None,
        required: bool = False,
        secret: bool = False,
        env_var: Optional[str] = None
    ) -> ConfigValue:
        """Add a configuration option to the schema."""
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
            env_var=env_var or f"INFINITE_MAP_{key.upper().replace('.', '_')}"
        )
        self.values[key] = value
        return value

    def get(self, key: str) -> Optional[ConfigValue]:
        """Get a configuration value by key."""
        return self.values.get(key)

    def validate_all(self, current_values: Dict[str, Any]) -> List[Tuple[str, str]]:
        """Validate all configuration values."""
        errors = []
        for key, config in self.values.items():
            config.value = current_values.get(key, config.default)
            valid, message = config.validate()
            if not valid:
                errors.append((key, message))
        return errors


class ConfigManager:
    """
    Configuration management interface.

    Supports YAML/JSON files, environment variables,
    hot reload, and change notifications.
    """

    def __init__(
        self,
        config_path: Optional[str] = None,
        schema: Optional[ConfigSchema] = None,
        auto_reload: bool = False,
        reload_interval: float = 5.0
    ):
        self.config_path = Path(config_path) if config_path else None
        self.schema = schema or ConfigSchema()
        self.values: Dict[str, Any] = {}
        self.sources: Dict[str, ConfigSource] = {}
        self.watchers: Dict[str, List[Callable[[str, Any], None]]] = {}
        self.lock = threading.RLock()
        self.auto_reload = auto_reload
        self.reload_interval = reload_interval
        self._reload_thread: Optional[threading.Thread] = None
        self._stop_reload = threading.Event()
        self._last_modified: Optional[datetime] = None

        # Initialize with defaults
        self._init_defaults()

        # Load from file if exists
        if self.config_path and self.config_path.exists():
            self._load_file()

        # Load from environment
        self._load_environment()

        # Start auto-reload if enabled
        if auto_reload and self.config_path:
            self._start_reload_thread()

    def _init_defaults(self):
        """Initialize with default values from schema."""
        with self.lock:
            for key, config in self.schema.values.items():
                self.values[key] = config.default
                self.sources[key] = ConfigSource.DEFAULT

    def _load_file(self):
        """Load configuration from file."""
        if not self.config_path or not self.config_path.exists():
            return

        with self.lock:
            try:
                with open(self.config_path) as f:
                    if self.config_path.suffix in (".yaml", ".yml"):
                        data = yaml.safe_load(f) or {}
                    else:
                        data = json.load(f)

                # Flatten nested config
                flat = self._flatten_dict(data)

                # Update values
                for key, value in flat.items():
                    if key in self.schema.values:
                        try:
                            config = self.schema.values[key]
                            cast_value = config.cast_value(value)
                            old_value = self.values.get(key)
                            self.values[key] = cast_value
                            self.sources[key] = ConfigSource.FILE

                            # Notify watchers if changed
                            if old_value != cast_value:
                                self._notify_watchers(key, cast_value)
                        except ValueError as e:
                            logger.error(f"Config load error for {key}: {e}")

                self._last_modified = datetime.now()
                logger.info(f"Loaded configuration from {self.config_path}")

            except Exception as e:
                logger.error(f"Failed to load config file: {e}")

    def _flatten_dict(self, d: Dict[str, Any], parent_key: str = "") -> Dict[str, Any]:
        """Flatten nested dictionary with dot notation."""
        items = {}
        for k, v in d.items():
            new_key = f"{parent_key}.{k}" if parent_key else k
            if isinstance(v, dict):
                items.update(self._flatten_dict(v, new_key))
            else:
                items[new_key] = v
        return items

    def _load_environment(self):
        """Load configuration from environment variables."""
        with self.lock:
            for key, config in self.schema.values.items():
                env_var = config.env_var
                if env_var and env_var in os.environ:
                    try:
                        value = os.environ[env_var]
                        cast_value = config.cast_value(value)
                        old_value = self.values.get(key)
                        self.values[key] = cast_value
                        self.sources[key] = ConfigSource.ENVIRONMENT

                        # Notify watchers if changed
                        if old_value != cast_value:
                            self._notify_watchers(key, cast_value)
                    except ValueError as e:
                        logger.error(f"Config env load error for {key}: {e}")

    def _start_reload_thread(self):
        """Start the auto-reload thread."""
        def reload_loop():
            while not self._stop_reload.is_set():
                time.sleep(self.reload_interval)
                if self.config_path and self.config_path.exists():
                    try:
                        mtime = datetime.fromtimestamp(self.config_path.stat().st_mtime)
                        if self._last_modified and mtime > self._last_modified:
                            logger.info("Config file changed, reloading...")
                            self._load_file()
                    except Exception as e:
                        logger.error(f"Error checking config file: {e}")

        self._reload_thread = threading.Thread(target=reload_loop, daemon=True)
        self._reload_thread.start()

    def _stop_reload_thread(self):
        """Stop the auto-reload thread."""
        if self._reload_thread:
            self._stop_reload.set()
            self._reload_thread.join(timeout=2.0)
            self._reload_thread = None

    def _notify_watchers(self, key: str, value: Any):
        """Notify watchers of a configuration change."""
        if key in self.watchers:
            for callback in self.watchers[key]:
                try:
                    callback(key, value)
                except Exception as e:
                    logger.error(f"Config watcher error for {key}: {e}")

    def get(self, key: str, default: Any = None) -> Any:
        """Get a configuration value."""
        with self.lock:
            return self.values.get(key, default)

    def get_typed(self, key: str, data_type: Type[T]) -> T:
        """Get a configuration value with type checking."""
        value = self.get(key)
        if value is None:
            return None
        if not isinstance(value, data_type):
            raise TypeError(f"Config '{key}' is {type(value)}, expected {data_type}")
        return value

    def set(
        self,
        key: str,
        value: Any,
        source: ConfigSource = ConfigSource.RUNTIME,
        validate: bool = True
    ) -> Tuple[bool, str]:
        """
        Set a configuration value.

        Returns:
            Tuple of (success, error_message)
        """
        with self.lock:
            if key not in self.schema.values:
                return False, f"Unknown configuration key: {key}"

            config = self.schema.values[key]

            try:
                cast_value = config.cast_value(value)
            except ValueError as e:
                return False, str(e)

            # Create temp config for validation
            if validate:
                temp_config = ConfigValue(
                    key=key,
                    value=cast_value,
                    data_type=config.data_type,
                    min_value=config.min_value,
                    max_value=config.max_value,
                    choices=config.choices,
                    required=config.required
                )
                valid, message = temp_config.validate()
                if not valid:
                    return False, message

            # Update value
            old_value = self.values.get(key)
            self.values[key] = cast_value
            self.sources[key] = source

            # Notify watchers if changed
            if old_value != cast_value:
                self._notify_watchers(key, cast_value)

            return True, ""

    def watch(self, key: str, callback: Callable[[str, Any], None]):
        """Register a callback for configuration changes."""
        with self.lock:
            if key not in self.watchers:
                self.watchers[key] = []
            self.watchers[key].append(callback)

    def unwatch(self, key: str, callback: Callable[[str, Any], None]):
        """Unregister a configuration change callback."""
        with self.lock:
            if key in self.watchers and callback in self.watchers[key]:
                self.watchers[key].remove(callback)

    def reload(self) -> bool:
        """Reload configuration from file."""
        try:
            self._load_file()
            return True
        except Exception as e:
            logger.error(f"Failed to reload config: {e}")
            return False

    def save(self, path: Optional[str] = None) -> bool:
        """Save configuration to file."""
        save_path = Path(path) if path else self.config_path
        if not save_path:
            return False

        with self.lock:
            try:
                # Build nested dict from flat values
                data = {}
                for key, value in self.values.items():
                    parts = key.split(".")
                    current = data
                    for part in parts[:-1]:
                        if part not in current:
                            current[part] = {}
                        current = current[part]
                    current[parts[-1]] = value

                with open(save_path, "w") as f:
                    if save_path.suffix in (".yaml", ".yml"):
                        yaml.dump(data, f, default_flow_style=False)
                    else:
                        json.dump(data, f, indent=2)

                logger.info(f"Saved configuration to {save_path}")
                return True
            except Exception as e:
                logger.error(f"Failed to save config: {e}")
                return False

    def validate(self) -> List[Tuple[str, str]]:
        """Validate all configuration values."""
        return self.schema.validate_all(self.values)

    def get_all(self) -> Dict[str, Any]:
        """Get all configuration values."""
        with self.lock:
            return dict(self.values)

    def get_sources(self) -> Dict[str, ConfigSource]:
        """Get sources for all values."""
        with self.lock:
            return dict(self.sources)

    def get_schema_info(self) -> Dict[str, Dict[str, Any]]:
        """Get schema information for all options."""
        return {key: config.to_dict() for key, config in self.schema.values.items()}

    def reset(self, key: Optional[str] = None):
        """Reset configuration to defaults."""
        with self.lock:
            if key:
                if key in self.schema.values:
                    config = self.schema.values[key]
                    old_value = self.values.get(key)
                    self.values[key] = config.default
                    self.sources[key] = ConfigSource.DEFAULT
                    if old_value != config.default:
                        self._notify_watchers(key, config.default)
            else:
                for key, config in self.schema.values.items():
                    old_value = self.values.get(key)
                    self.values[key] = config.default
                    self.sources[key] = ConfigSource.DEFAULT
                    if old_value != config.default:
                        self._notify_watchers(key, config.default)

    def export_env_vars(self) -> str:
        """Export configuration as environment variable commands."""
        lines = []
        for key, value in self.values.items():
            if key in self.schema.values:
                env_var = self.schema.values[key].env_var
                if env_var:
                    lines.append(f"export {env_var}={repr(value)}")
        return "\n".join(lines)


def create_default_schema() -> ConfigSchema:
    """Create the default configuration schema for Infinite Map."""
    schema = ConfigSchema()

    # Cache settings
    schema.add("cache.enabled", ConfigDataType.BOOLEAN, True, "Enable caching")
    schema.add("cache.size_mb", ConfigDataType.INTEGER, 100, "Cache size in MB", min_value=1, max_value=16384)
    schema.add("cache.ttl_seconds", ConfigDataType.INTEGER, 3600, "Cache TTL in seconds", min_value=0)
    schema.add("cache.prefetch_enabled", ConfigDataType.BOOLEAN, True, "Enable predictive prefetching")

    # Performance settings
    schema.add("performance.read_buffer_size", ConfigDataType.INTEGER, 65536, "Read buffer size", min_value=4096)
    schema.add("performance.write_buffer_size", ConfigDataType.INTEGER, 65536, "Write buffer size", min_value=4096)
    schema.add("performance.max_threads", ConfigDataType.INTEGER, 8, "Max worker threads", min_value=1, max_value=64)
    schema.add("performance.parallel_io", ConfigDataType.BOOLEAN, True, "Enable parallel I/O")

    # WAL settings
    schema.add("wal.enabled", ConfigDataType.BOOLEAN, True, "Enable write-ahead logging")
    schema.add("wal.sync_on_write", ConfigDataType.BOOLEAN, True, "Sync WAL on every write")
    schema.add("wal.max_size_mb", ConfigDataType.INTEGER, 100, "Max WAL size before rotation", min_value=1)
    schema.add("wal.checkpoint_interval", ConfigDataType.INTEGER, 60, "Checkpoint interval in seconds", min_value=1)

    # Snapshot settings
    schema.add("snapshot.auto_create", ConfigDataType.BOOLEAN, False, "Auto-create snapshots")
    schema.add("snapshot.retention_count", ConfigDataType.INTEGER, 10, "Number of snapshots to retain", min_value=1)
    schema.add("snapshot.interval_minutes", ConfigDataType.INTEGER, 60, "Auto-snapshot interval", min_value=1)

    # Monitoring settings
    schema.add("monitoring.enabled", ConfigDataType.BOOLEAN, True, "Enable monitoring")
    schema.add("monitoring.metrics_interval", ConfigDataType.INTEGER, 60, "Metrics collection interval", min_value=1)
    schema.add("monitoring.health_check_interval", ConfigDataType.INTEGER, 30, "Health check interval", min_value=1)

    # Logging settings
    schema.add("logging.level", ConfigDataType.STRING, "INFO", "Log level", choices=["DEBUG", "INFO", "WARNING", "ERROR"])
    schema.add("logging.file", ConfigDataType.PATH, "", "Log file path")
    schema.add("logging.max_size_mb", ConfigDataType.INTEGER, 100, "Max log file size", min_value=1)

    return schema
