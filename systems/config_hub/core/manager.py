"""
Configuration Manager

Manages configuration for a single component with support for:
- Multiple sources (file, environment, runtime, remote)
- Hot reload with change notifications
- Thread-safe operations
- Value watching and callbacks
"""

import json
import logging
import os
import re
import threading
import time
from collections.abc import Callable
from datetime import datetime
from pathlib import Path
from typing import Any, TypeVar

import yaml

from systems.config_hub.core.schema import (
    ConfigDataType,
    ConfigPriority,
    ConfigSchema,
    ConfigSource,
    ConfigValue,
    ConfigValidationError,
)

logger = logging.getLogger(__name__)

T = TypeVar('T')


class ConfigManager:
    """
    Configuration manager for a single component.

    Provides thread-safe access to configuration values with support
    for multiple sources, validation, and change notifications.

    Usage:
        schema = ConfigSchema("my_component")
        schema.add("cache.size", ConfigDataType.INTEGER, 100, "Cache size in MB")

        manager = ConfigManager(schema)
        manager.load_from_file("config.yaml")
        manager.load_from_environment()

        size = manager.get("cache.size")  # Returns 100 or override
        manager.watch("cache.size", lambda k, v: print(f"Changed: {v}"))
    """

    def __init__(
        self,
        schema: ConfigSchema,
        config_dir: str | Path | None = None,
        auto_reload: bool = False,
        reload_interval: float = 5.0,
    ):
        """
        Initialize the configuration manager.

        Args:
            schema: Configuration schema defining all options
            config_dir: Directory to look for config files
            auto_reload: Whether to automatically reload when files change
            reload_interval: How often to check for file changes (seconds)
        """
        self.schema = schema
        self.config_dir = Path(config_dir) if config_dir else None
        self.auto_reload = auto_reload
        self.reload_interval = reload_interval

        # Current values and their sources
        self._values: dict[str, Any] = {}
        self._sources: dict[str, ConfigSource] = {}
        self._priorities: dict[str, ConfigPriority] = {}
        self._versions: dict[str, int] = {}
        self._modified_times: dict[str, datetime] = {}

        # Change watchers
        self._watchers: dict[str, list[Callable[[str, Any], None]]] = {}

        # Thread safety
        self._lock = threading.RLock()

        # Auto-reload
        self._reload_thread: threading.Thread | None = None
        self._stop_reload = threading.Event()
        self._last_file_check: datetime | None = None

        # Initialize with defaults
        self._init_defaults()

        # Start auto-reload if enabled
        if auto_reload:
            self._start_reload_thread()

    def _init_defaults(self) -> None:
        """Initialize values with schema defaults."""
        with self._lock:
            for key, config in self.schema.values.items():
                self._values[key] = config.default
                self._sources[key] = ConfigSource.DEFAULT
                self._priorities[key] = ConfigPriority.DEFAULT
                self._versions[key] = 1
                self._modified_times[key] = datetime.now()

    def load_from_file(
        self,
        path: str | Path | None = None,
        source: ConfigSource = ConfigSource.FILE,
        priority: ConfigPriority = ConfigPriority.FILE,
    ) -> list[str]:
        """
        Load configuration from a YAML or JSON file.

        Args:
            path: File path (uses component name if not provided)
            source: Source to mark values as coming from
            priority: Priority for these values

        Returns:
            List of keys that were loaded
        """
        if path is None:
            if self.config_dir:
                # Try multiple file names
                for ext in [".yaml", ".yml", ".json"]:
                    candidate = self.config_dir / f"{self.schema.component}{ext}"
                    if candidate.exists():
                        path = candidate
                        break

        if path is None:
            return []

        path = Path(path)
        if not path.exists():
            logger.warning(f"Config file not found: {path}")
            return []

        with self._lock:
            try:
                with open(path) as f:
                    if path.suffix in (".yaml", ".yml"):
                        data = yaml.safe_load(f) or {}
                    else:
                        data = json.load(f)

                # Flatten nested config
                flat = self._flatten_dict(data)

                # Update values
                loaded_keys = []
                for key, value in flat.items():
                    if key in self.schema.values:
                        try:
                            config = self.schema.values[key]

                            # Check priority - don't override higher priority values
                            current_priority = self._priorities.get(key, ConfigPriority.DEFAULT)
                            if priority.value < current_priority.value:
                                logger.debug(
                                    f"Skipping {key}: current priority {current_priority.value} "
                                    f"> new priority {priority.value}"
                                )
                                continue

                            cast_value = config.cast_value(value)
                            old_value = self._values.get(key)

                            self._values[key] = cast_value
                            self._sources[key] = source
                            self._priorities[key] = priority
                            self._versions[key] = self._versions.get(key, 0) + 1
                            self._modified_times[key] = datetime.now()

                            loaded_keys.append(key)

                            # Notify watchers if changed
                            if old_value != cast_value:
                                self._notify_watchers(key, cast_value, old_value)

                        except ConfigValidationError as e:
                            logger.error(f"Config load error for {key}: {e}")

                logger.info(f"Loaded {len(loaded_keys)} config values from {path}")
                return loaded_keys

            except Exception as e:
                logger.error(f"Failed to load config file {path}: {e}")
                return []

    def load_from_environment(self) -> list[str]:
        """
        Load configuration from environment variables.

        Returns:
            List of keys that were loaded
        """
        with self._lock:
            loaded_keys = []
            for key, config in self.schema.values.items():
                env_var = config.env_var
                if env_var and env_var in os.environ:
                    try:
                        value = os.environ[env_var]

                        # Check priority
                        current_priority = self._priorities.get(key, ConfigPriority.DEFAULT)
                        if ConfigPriority.ENVIRONMENT.value < current_priority.value:
                            continue

                        cast_value = config.cast_value(value)
                        old_value = self._values.get(key)

                        self._values[key] = cast_value
                        self._sources[key] = ConfigSource.ENVIRONMENT
                        self._priorities[key] = ConfigPriority.ENVIRONMENT
                        self._versions[key] = self._versions.get(key, 0) + 1
                        self._modified_times[key] = datetime.now()

                        loaded_keys.append(key)

                        # Notify watchers if changed
                        if old_value != cast_value:
                            self._notify_watchers(key, cast_value, old_value)

                    except ConfigValidationError as e:
                        logger.error(f"Config env load error for {key}: {e}")

            if loaded_keys:
                logger.debug(f"Loaded {len(loaded_keys)} config values from environment")
            return loaded_keys

    def load_from_dict(
        self,
        data: dict[str, Any],
        source: ConfigSource = ConfigSource.RUNTIME,
        priority: ConfigPriority = ConfigPriority.RUNTIME,
    ) -> list[str]:
        """
        Load configuration from a dictionary.

        Args:
            data: Configuration dictionary
            source: Source to mark values as coming from
            priority: Priority for these values

        Returns:
            List of keys that were loaded
        """
        with self._lock:
            flat = self._flatten_dict(data)
            loaded_keys = []

            for key, value in flat.items():
                if key in self.schema.values:
                    try:
                        config = self.schema.values[key]

                        # Check priority
                        current_priority = self._priorities.get(key, ConfigPriority.DEFAULT)
                        if priority.value < current_priority.value:
                            continue

                        cast_value = config.cast_value(value)
                        old_value = self._values.get(key)

                        self._values[key] = cast_value
                        self._sources[key] = source
                        self._priorities[key] = priority
                        self._versions[key] = self._versions.get(key, 0) + 1
                        self._modified_times[key] = datetime.now()

                        loaded_keys.append(key)

                        if old_value != cast_value:
                            self._notify_watchers(key, cast_value, old_value)

                    except ConfigValidationError as e:
                        logger.error(f"Config dict load error for {key}: {e}")

            return loaded_keys

    def get(self, key: str, default: Any = None) -> Any:
        """Get a configuration value."""
        with self._lock:
            return self._values.get(key, default)

    def get_typed(self, key: str, data_type: type[T]) -> T | None:
        """Get a configuration value with type checking."""
        value = self.get(key)
        if value is None:
            return None
        if not isinstance(value, data_type):
            raise TypeError(f"Config '{key}' is {type(value).__name__}, expected {data_type.__name__}")
        return value

    def get_all(self) -> dict[str, Any]:
        """Get all configuration values."""
        with self._lock:
            return dict(self._values)

    def get_metadata(self, key: str) -> dict[str, Any] | None:
        """Get metadata for a configuration key."""
        with self._lock:
            if key not in self._values:
                return None
            return {
                "key": key,
                "value": self._values[key],
                "source": self._sources.get(key, ConfigSource.DEFAULT).value,
                "priority": self._priorities.get(key, ConfigPriority.DEFAULT).value,
                "version": self._versions.get(key, 1),
                "modified": self._modified_times.get(key),
            }

    def set(
        self,
        key: str,
        value: Any,
        validate: bool = True,
        source: ConfigSource = ConfigSource.RUNTIME,
        priority: ConfigPriority = ConfigPriority.RUNTIME,
    ) -> tuple[bool, str]:
        """
        Set a configuration value.

        Args:
            key: Configuration key
            value: New value
            validate: Whether to validate the value
            source: Source to mark value as coming from
            priority: Priority for this value

        Returns:
            Tuple of (success, error_message)
        """
        with self._lock:
            if key not in self.schema.values:
                return False, f"Unknown configuration key: {key}"

            config = self.schema.values[key]

            # Check priority
            current_priority = self._priorities.get(key, ConfigPriority.DEFAULT)
            if priority.value < current_priority.value:
                return False, (
                    f"Cannot set {key}: current priority {current_priority.value} "
                    f"> new priority {priority.value}"
                )

            try:
                cast_value = config.cast_value(value)
            except ConfigValidationError as e:
                return False, str(e)

            # Validate
            if validate:
                temp_config = ConfigValue(
                    key=key,
                    value=cast_value,
                    data_type=config.data_type,
                    min_value=config.min_value,
                    max_value=config.max_value,
                    choices=config.choices,
                    required=config.required,
                )
                errors = temp_config.validate()
                if errors:
                    return False, "; ".join(errors)

            # Update value
            old_value = self._values.get(key)
            self._values[key] = cast_value
            self._sources[key] = source
            self._priorities[key] = priority
            self._versions[key] = self._versions.get(key, 0) + 1
            self._modified_times[key] = datetime.now()

            # Notify watchers if changed
            if old_value != cast_value:
                self._notify_watchers(key, cast_value, old_value)

            return True, ""

    def watch(self, key: str, callback: Callable[[str, Any, Any], None]) -> None:
        """
        Register a callback for configuration changes.

        Args:
            key: Configuration key to watch
            callback: Function called with (key, new_value, old_value)
        """
        with self._lock:
            if key not in self._watchers:
                self._watchers[key] = []
            self._watchers[key].append(callback)

    def unwatch(self, key: str, callback: Callable[[str, Any, Any], None]) -> None:
        """Unregister a configuration change callback."""
        with self._lock:
            if key in self._watchers and callback in self._watchers[key]:
                self._watchers[key].remove(callback)

    def validate(self) -> dict[str, list[str]]:
        """
        Validate all configuration values.

        Returns:
            Dictionary mapping keys to lists of error messages
        """
        return self.schema.validate_all(self._values)

    def reset(self, key: str | None = None) -> None:
        """
        Reset configuration to defaults.

        Args:
            key: Specific key to reset, or None for all
        """
        with self._lock:
            if key:
                if key in self.schema.values:
                    config = self.schema.values[key]
                    old_value = self._values.get(key)
                    self._values[key] = config.default
                    self._sources[key] = ConfigSource.DEFAULT
                    self._priorities[key] = ConfigPriority.DEFAULT
                    self._versions[key] = 1
                    self._modified_times[key] = datetime.now()
                    if old_value != config.default:
                        self._notify_watchers(key, config.default, old_value)
            else:
                for key, config in self.schema.values.items():
                    old_value = self._values.get(key)
                    self._values[key] = config.default
                    self._sources[key] = ConfigSource.DEFAULT
                    self._priorities[key] = ConfigPriority.DEFAULT
                    self._versions[key] = 1
                    self._modified_times[key] = datetime.now()
                    if old_value != config.default:
                        self._notify_watchers(key, config.default, old_value)

    def save(self, path: str | Path | None = None) -> bool:
        """
        Save configuration to a file.

        Args:
            path: File path (uses component name if not provided)

        Returns:
            True if save was successful
        """
        if path is None:
            if self.config_dir:
                path = self.config_dir / f"{self.schema.component}.yaml"
            else:
                return False

        path = Path(path)

        with self._lock:
            try:
                # Build nested dict from flat values
                data = {}
                for key, value in self._values.items():
                    parts = key.split(".")
                    current = data
                    for part in parts[:-1]:
                        if part not in current:
                            current[part] = {}
                        current = current[part]
                    current[parts[-1]] = value

                # Ensure directory exists
                path.parent.mkdir(parents=True, exist_ok=True)

                with open(path, "w") as f:
                    if path.suffix in (".yaml", ".yml"):
                        yaml.dump(data, f, default_flow_style=False, sort_keys=True)
                    else:
                        json.dump(data, f, indent=2)

                logger.info(f"Saved configuration to {path}")
                return True

            except Exception as e:
                logger.error(f"Failed to save config to {path}: {e}")
                return False

    def export_env_vars(self) -> str:
        """
        Export configuration as environment variable commands.

        Returns:
            Shell script with export commands
        """
        lines = []
        for key, value in self._values.items():
            if key in self.schema.values:
                env_var = self.schema.values[key].env_var
                if env_var:
                    # Handle different value types
                    if isinstance(value, bool):
                        value_str = "true" if value else "false"
                    elif isinstance(value, (list, dict)):
                        value_str = json.dumps(value)
                    else:
                        value_str = str(value)
                    lines.append(f"export {env_var}={repr(value_str)}")
        return "\n".join(lines)

    def to_dict(self, include_secrets: bool = False) -> dict[str, Any]:
        """Export configuration as dictionary."""
        with self._lock:
            result = {}
            for key, value in self._values.items():
                config = self.schema.values.get(key)
                if config and config.secret and not include_secrets:
                    result[key] = "***"
                else:
                    result[key] = value
            return result

    def _flatten_dict(self, d: dict[str, Any], parent_key: str = "") -> dict[str, Any]:
        """Flatten nested dictionary with dot notation."""
        items = {}
        for k, v in d.items():
            new_key = f"{parent_key}.{k}" if parent_key else k
            if isinstance(v, dict):
                items.update(self._flatten_dict(v, new_key))
            else:
                items[new_key] = v
        return items

    def _notify_watchers(self, key: str, new_value: Any, old_value: Any) -> None:
        """Notify watchers of a configuration change."""
        if key in self._watchers:
            for callback in self._watchers[key]:
                try:
                    callback(key, new_value, old_value)
                except Exception as e:
                    logger.error(f"Config watcher error for {key}: {e}")

    def _start_reload_thread(self) -> None:
        """Start the auto-reload thread."""
        def reload_loop():
            while not self._stop_reload.is_set():
                time.sleep(self.reload_interval)
                if self.config_dir:
                    try:
                        for ext in [".yaml", ".yml", ".json"]:
                            config_file = self.config_dir / f"{self.schema.component}{ext}"
                            if config_file.exists():
                                mtime = datetime.fromtimestamp(config_file.stat().st_mtime)
                                if self._last_file_check and mtime > self._last_file_check:
                                    logger.info(f"Config file changed, reloading: {config_file}")
                                    self.load_from_file(config_file)
                                self._last_file_check = mtime
                                break
                    except Exception as e:
                        logger.error(f"Error checking config file: {e}")

        self._reload_thread = threading.Thread(target=reload_loop, daemon=True)
        self._reload_thread.start()

    def stop_reload(self) -> None:
        """Stop the auto-reload thread."""
        if self._reload_thread:
            self._stop_reload.set()
            self._reload_thread.join(timeout=2.0)
            self._reload_thread = None

    def __del__(self) -> None:
        """Clean up on destruction."""
        self.stop_reload()
