"""
Configuration Registry

Central registry for all component configurations in Geometry OS.
Provides a unified interface for accessing and managing configurations
across all system components.
"""

import json
import logging
import threading
from collections.abc import Callable
from datetime import datetime
from pathlib import Path
from typing import Any

import yaml

from systems.config_hub.core.manager import ConfigManager
from systems.config_hub.core.schema import (
    ConfigDataType,
    ConfigPriority,
    ConfigSchema,
    ConfigSource,
)

logger = logging.getLogger(__name__)


class ConfigRegistry:
    """
    Central registry for all component configurations.

    The registry manages configuration managers for all components,
    providing a unified interface for:
    - Registering component schemas
    - Loading configurations from files and environment
    - Accessing values across components
    - Watching for changes
    - Exporting and importing configurations

    Usage:
        registry = ConfigRegistry()

        # Register schemas
        registry.register_schema(evolution_schema)
        registry.register_schema(visual_shell_schema)

        # Load all configurations
        registry.load_all("/etc/geometry-os")

        # Access values
        cache_size = registry.get("evolution_daemon", "cache.size_mb")

        # Watch for changes
        registry.watch("evolution_daemon", "cache.size_mb", on_change)
    """

    def __init__(self, config_dir: str | Path | None = None):
        """
        Initialize the configuration registry.

        Args:
            config_dir: Default directory for configuration files
        """
        self.config_dir = Path(config_dir) if config_dir else None
        self._schemas: dict[str, ConfigSchema] = {}
        self._managers: dict[str, ConfigManager] = {}
        self._global_watchers: list[Callable[[str, str, Any, Any], None]] = []
        self._lock = threading.RLock()
        self._initialized = False

    def register_schema(self, schema: ConfigSchema) -> None:
        """
        Register a component configuration schema.

        Args:
            schema: Schema to register
        """
        with self._lock:
            if schema.component in self._schemas:
                logger.warning(f"Overwriting existing schema for {schema.component}")

            self._schemas[schema.component] = schema

            # Create manager if not exists
            if schema.component not in self._managers:
                self._managers[schema.component] = ConfigManager(
                    schema=schema,
                    config_dir=self.config_dir,
                )

            logger.info(f"Registered schema for {schema.component}")

    def get_schema(self, component: str) -> ConfigSchema | None:
        """Get schema for a component."""
        return self._schemas.get(component)

    def get_manager(self, component: str) -> ConfigManager | None:
        """Get configuration manager for a component."""
        return self._managers.get(component)

    def get_components(self) -> list[str]:
        """Get list of registered components."""
        with self._lock:
            return list(self._schemas.keys())

    def load_all(
        self,
        config_dir: str | Path | None = None,
        load_env: bool = True,
    ) -> dict[str, list[str]]:
        """
        Load configurations for all registered components.

        Args:
            config_dir: Directory containing config files
            load_env: Whether to also load from environment

        Returns:
            Dictionary mapping component names to lists of loaded keys
        """
        dir_path = Path(config_dir) if config_dir else self.config_dir
        results = {}

        with self._lock:
            for component, manager in self._managers.items():
                loaded = []

                # Load from file
                if dir_path:
                    file_loaded = manager.load_from_file(config_dir=dir_path)
                    loaded.extend(file_loaded)

                # Load from environment
                if load_env:
                    env_loaded = manager.load_from_environment()
                    loaded.extend(env_loaded)

                results[component] = loaded

        self._initialized = True
        logger.info(f"Loaded configurations for {len(results)} components")
        return results

    def load_component(
        self,
        component: str,
        config_dir: str | Path | None = None,
        load_env: bool = True,
    ) -> list[str]:
        """
        Load configuration for a specific component.

        Args:
            component: Component name
            config_dir: Directory containing config files
            load_env: Whether to also load from environment

        Returns:
            List of loaded keys
        """
        manager = self._managers.get(component)
        if not manager:
            logger.warning(f"No manager for component {component}")
            return []

        loaded = []

        if config_dir:
            file_loaded = manager.load_from_file(config_dir=Path(config_dir))
            loaded.extend(file_loaded)

        if load_env:
            env_loaded = manager.load_from_environment()
            loaded.extend(env_loaded)

        return loaded

    def get(self, component: str, key: str, default: Any = None) -> Any:
        """
        Get a configuration value.

        Args:
            component: Component name
            key: Configuration key
            default: Default value if not found

        Returns:
            Configuration value
        """
        manager = self._managers.get(component)
        if manager:
            return manager.get(key, default)
        return default

    def get_typed(self, component: str, key: str, data_type: type) -> Any:
        """Get a configuration value with type checking."""
        manager = self._managers.get(component)
        if manager:
            return manager.get_typed(key, data_type)
        return None

    def set(
        self,
        component: str,
        key: str,
        value: Any,
        validate: bool = True,
        source: ConfigSource = ConfigSource.RUNTIME,
        priority: ConfigPriority = ConfigPriority.RUNTIME,
    ) -> tuple[bool, str]:
        """
        Set a configuration value.

        Args:
            component: Component name
            key: Configuration key
            value: New value
            validate: Whether to validate
            source: Source of the value
            priority: Priority for the value

        Returns:
            Tuple of (success, error_message)
        """
        manager = self._managers.get(component)
        if not manager:
            return False, f"No manager for component {component}"

        # Get old value for notification
        old_value = manager.get(key)

        result = manager.set(key, value, validate, source, priority)

        # Notify global watchers if changed
        if result[0]:
            new_value = manager.get(key)
            if old_value != new_value:
                self._notify_global_watchers(component, key, new_value, old_value)

        return result

    def set_batch(
        self,
        component: str,
        values: dict[str, Any],
        validate: bool = True,
        source: ConfigSource = ConfigSource.RUNTIME,
        priority: ConfigPriority = ConfigPriority.RUNTIME,
    ) -> dict[str, tuple[bool, str]]:
        """
        Set multiple configuration values at once.

        Args:
            component: Component name
            values: Dictionary of key-value pairs
            validate: Whether to validate
            source: Source of the values
            priority: Priority for the values

        Returns:
            Dictionary mapping keys to (success, error) tuples
        """
        results = {}
        manager = self._managers.get(component)

        if not manager:
            for key in values:
                results[key] = (False, f"No manager for component {component}")
            return results

        for key, value in values.items():
            old_value = manager.get(key)
            result = manager.set(key, value, validate, source, priority)
            results[key] = result

            if result[0]:
                new_value = manager.get(key)
                if old_value != new_value:
                    self._notify_global_watchers(component, key, new_value, old_value)

        return results

    def get_all(self, component: str) -> dict[str, Any]:
        """Get all configuration values for a component."""
        manager = self._managers.get(component)
        if manager:
            return manager.get_all()
        return {}

    def get_all_components(self) -> dict[str, dict[str, Any]]:
        """Get all configuration values for all components."""
        with self._lock:
            return {
                component: manager.get_all()
                for component, manager in self._managers.items()
            }

    def watch(
        self,
        component: str,
        key: str,
        callback: Callable[[str, str, Any, Any], None],
    ) -> None:
        """
        Watch for changes to a specific configuration value.

        Args:
            component: Component name
            key: Configuration key
            callback: Function called with (component, key, new_value, old_value)
        """
        manager = self._managers.get(component)
        if manager:
            # Wrap callback to include component name
            def wrapped_callback(k: str, new_val: Any, old_val: Any) -> None:
                callback(component, k, new_val, old_val)

            manager.watch(key, wrapped_callback)

    def watch_global(
        self,
        callback: Callable[[str, str, Any, Any], None],
    ) -> None:
        """
        Watch for changes to any configuration value.

        Args:
            callback: Function called with (component, key, new_value, old_value)
        """
        with self._lock:
            self._global_watchers.append(callback)

    def validate(self, component: str | None = None) -> dict[str, dict[str, list[str]]]:
        """
        Validate configuration values.

        Args:
            component: Specific component to validate, or None for all

        Returns:
            Dictionary mapping components to validation errors
        """
        errors = {}

        with self._lock:
            components = [component] if component else list(self._managers.keys())

            for comp in components:
                manager = self._managers.get(comp)
                if manager:
                    comp_errors = manager.validate()
                    if comp_errors:
                        errors[comp] = comp_errors

        return errors

    def reset(self, component: str | None = None) -> None:
        """
        Reset configuration to defaults.

        Args:
            component: Specific component to reset, or None for all
        """
        with self._lock:
            components = [component] if component else list(self._managers.keys())

            for comp in components:
                manager = self._managers.get(comp)
                if manager:
                    manager.reset()

    def save(self, component: str | None = None, path: str | Path | None = None) -> bool:
        """
        Save configuration to files.

        Args:
            component: Specific component to save, or None for all
            path: File path (uses default if not provided)

        Returns:
            True if all saves were successful
        """
        with self._lock:
            components = [component] if component else list(self._managers.keys())
            success = True

            for comp in components:
                manager = self._managers.get(comp)
                if manager:
                    if not manager.save(path):
                        success = False

            return success

    def export_all(self, include_secrets: bool = False) -> dict[str, Any]:
        """
        Export all configurations as a dictionary.

        Args:
            include_secrets: Whether to include secret values

        Returns:
            Dictionary with all configurations
        """
        with self._lock:
            return {
                "version": "1.0",
                "exported_at": datetime.now().isoformat(),
                "components": {
                    component: manager.to_dict(include_secrets)
                    for component, manager in self._managers.items()
                },
            }

    def import_all(
        self,
        data: dict[str, Any],
        source: ConfigSource = ConfigSource.RUNTIME,
        priority: ConfigPriority = ConfigPriority.RUNTIME,
    ) -> dict[str, dict[str, tuple[bool, str]]]:
        """
        Import configurations from a dictionary.

        Args:
            data: Dictionary with configurations
            source: Source to mark values as coming from
            priority: Priority for imported values

        Returns:
            Dictionary mapping components to key results
        """
        results = {}

        with self._lock:
            components = data.get("components", {})

            for component, values in components.items():
                if component in self._managers:
                    manager = self._managers[component]
                    loaded = manager.load_from_dict(values, source, priority)
                    results[component] = {k: (True, "") for k in loaded}
                else:
                    results[component] = {
                        k: (False, f"Unknown component: {component}")
                        for k in values
                    }

        return results

    def to_yaml(self, include_secrets: bool = False) -> str:
        """Export all configurations as YAML."""
        return yaml.dump(self.export_all(include_secrets), default_flow_style=False)

    def to_json(self, include_secrets: bool = False) -> str:
        """Export all configurations as JSON."""
        return json.dumps(self.export_all(include_secrets), indent=2)

    def _notify_global_watchers(
        self,
        component: str,
        key: str,
        new_value: Any,
        old_value: Any,
    ) -> None:
        """Notify global watchers of a configuration change."""
        for callback in self._global_watchers:
            try:
                callback(component, key, new_value, old_value)
            except Exception as e:
                logger.error(f"Global watcher error for {component}.{key}: {e}")

    def create_snapshot(self) -> dict[str, Any]:
        """
        Create a snapshot of current configurations.

        Returns:
            Snapshot data that can be used for rollback
        """
        with self._lock:
            return {
                "snapshot_at": datetime.now().isoformat(),
                "configurations": self.export_all(include_secrets=True),
            }

    def restore_snapshot(self, snapshot: dict[str, Any]) -> dict[str, dict[str, tuple[bool, str]]]:
        """
        Restore configurations from a snapshot.

        Args:
            snapshot: Snapshot data from create_snapshot()

        Returns:
            Results of the restore operation
        """
        configurations = snapshot.get("configurations", {})
        return self.import_all(
            configurations,
            source=ConfigSource.RUNTIME,
            priority=ConfigPriority.DEPLOYED,  # High priority for restore
        )
