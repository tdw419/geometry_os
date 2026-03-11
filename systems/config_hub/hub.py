"""
Configuration Hub - Central Configuration Management

The main interface for Geometry OS configuration management.
Provides unified access to all configuration functionality.
"""

import json
import logging
import os
from datetime import datetime
from pathlib import Path
from typing import Any

import yaml

from systems.config_hub.core.registry import ConfigRegistry
from systems.config_hub.core.schema import (
    ConfigDataType,
    ConfigPriority,
    ConfigSchema,
    ConfigSource,
)

logger = logging.getLogger(__name__)

# Singleton instance
_hub_instance: "ConfigHub | None" = None


class ConfigHub:
    """
    Central configuration hub for Geometry OS.

    This is the main interface for configuration management, providing:
    - Schema registration for all components
    - Configuration loading from multiple sources
    - Instance deployment and synchronization
    - Version control and rollback
    - Health verification

    Usage:
        hub = ConfigHub()

        # Register component schemas
        hub.register_component("evolution_daemon", evolution_schema)

        # Load configurations
        hub.load_all()

        # Access values
        value = hub.get("evolution_daemon", "cache.size_mb")

        # Deploy to instances
        hub.deploy_to_instances(["node-01", "node-02"])
    """

    def __init__(
        self,
        config_dir: str | Path | None = None,
        state_file: str | Path | None = None,
    ):
        """
        Initialize the configuration hub.

        Args:
            config_dir: Directory for configuration files
            state_file: File to store hub state (deployments, history)
        """
        self.config_dir = Path(config_dir) if config_dir else Path.cwd() / "config"
        self.state_file = Path(state_file) if state_file else self.config_dir / ".config_hub_state.json"

        self._registry = ConfigRegistry(self.config_dir)
        self._deployment_history: list[dict[str, Any]] = []
        self._snapshots: dict[str, dict[str, Any]] = {}
        self._instance_status: dict[str, dict[str, Any]] = {}

        # Load state if exists
        self._load_state()

        # Register built-in schemas
        self._register_builtin_schemas()

    def _register_builtin_schemas(self) -> None:
        """Register schemas for built-in Geometry OS components."""
        # Evolution Daemon schema
        evolution_schema = ConfigSchema(
            component="evolution_daemon",
            description="Evolution Daemon configuration",
            version="1.0.0",
        )
        evolution_schema.add(
            "mutation.batch_size",
            ConfigDataType.INTEGER,
            100,
            "Number of mutations to process per batch",
            min_value=1,
            max_value=10000,
        )
        evolution_schema.add(
            "mutation.promotion_threshold",
            ConfigDataType.FLOAT,
            0.75,
            "PAS score threshold for mutation promotion",
            min_value=0.0,
            max_value=1.0,
        )
        evolution_schema.add(
            "evolution.interval_seconds",
            ConfigDataType.INTEGER,
            30,
            "Evolution cycle interval",
            min_value=1,
        )
        evolution_schema.add(
            "evolution.max_retries",
            ConfigDataType.INTEGER,
            3,
            "Maximum retries for failed mutations",
            min_value=0,
            max_value=10,
        )
        evolution_schema.add(
            "neural.learning_rate",
            ConfigDataType.FLOAT,
            0.001,
            "Learning rate for neural mutations",
            min_value=0.0001,
            max_value=1.0,
        )
        evolution_schema.add(
            "neural.dropout_rate",
            ConfigDataType.FLOAT,
            0.1,
            "Dropout rate for neural networks",
            min_value=0.0,
            max_value=0.5,
        )
        evolution_schema.add(
            "cache.enabled",
            ConfigDataType.BOOLEAN,
            True,
            "Enable mutation caching",
        )
        evolution_schema.add(
            "cache.size_mb",
            ConfigDataType.INTEGER,
            100,
            "Cache size in MB",
            min_value=1,
            max_value=16384,
        )
        evolution_schema.add(
            "logging.level",
            ConfigDataType.STRING,
            "INFO",
            "Log level",
            choices=["DEBUG", "INFO", "WARNING", "ERROR"],
        )
        evolution_schema.add(
            "api.port",
            ConfigDataType.PORT,
            8080,
            "API server port",
        )
        evolution_schema.add(
            "api.auth_key",
            ConfigDataType.STRING,
            "",
            "API authentication key",
            secret=True,
        )

        self._registry.register_schema(evolution_schema)

        # Visual Shell schema
        visual_shell_schema = ConfigSchema(
            component="visual_shell",
            description="Visual Shell configuration",
            version="1.0.0",
        )
        visual_shell_schema.add(
            "render.backend",
            ConfigDataType.STRING,
            "wgpu",
            "Rendering backend",
            choices=["wgpu", "vulkan", "metal", "opengl"],
        )
        visual_shell_schema.add(
            "render.vsync",
            ConfigDataType.BOOLEAN,
            True,
            "Enable vertical sync",
        )
        visual_shell_schema.add(
            "render.max_fps",
            ConfigDataType.INTEGER,
            60,
            "Maximum frames per second",
            min_value=1,
            max_value=240,
        )
        visual_shell_schema.add(
            "window.width",
            ConfigDataType.INTEGER,
            1920,
            "Default window width",
            min_value=640,
            max_value=7680,
        )
        visual_shell_schema.add(
            "window.height",
            ConfigDataType.INTEGER,
            1080,
            "Default window height",
            min_value=480,
            max_value=4320,
        )
        visual_shell_schema.add(
            "window.fullscreen",
            ConfigDataType.BOOLEAN,
            False,
            "Start in fullscreen mode",
        )
        visual_shell_schema.add(
            "neural.display_enabled",
            ConfigDataType.BOOLEAN,
            True,
            "Enable neural state visualization",
        )
        visual_shell_schema.add(
            "neural.update_interval_ms",
            ConfigDataType.INTEGER,
            16,
            "Neural display update interval",
            min_value=1,
            max_value=1000,
        )
        visual_shell_schema.add(
            "sdf.softness",
            ConfigDataType.FLOAT,
            0.5,
            "SDF edge softness",
            min_value=0.0,
            max_value=1.0,
        )
        visual_shell_schema.add(
            "infinite_map.tile_size",
            ConfigDataType.INTEGER,
            256,
            "Tile size for infinite map",
            min_value=64,
            max_value=1024,
        )

        self._registry.register_schema(visual_shell_schema)

        # Swarm schema
        swarm_schema = ConfigSchema(
            component="swarm",
            description="Swarm node configuration",
            version="1.0.0",
        )
        swarm_schema.add(
            "node.port",
            ConfigDataType.PORT,
            6000,
            "Node TCP port",
        )
        swarm_schema.add(
            "node.name",
            ConfigDataType.STRING,
            "",
            "Node name (auto-generated if empty)",
        )
        swarm_schema.add(
            "node.capabilities",
            ConfigDataType.LIST,
            ["compute"],
            "Node capabilities",
        )
        swarm_schema.add(
            "discovery.port",
            ConfigDataType.PORT,
            5001,
            "UDP discovery port",
        )
        swarm_schema.add(
            "discovery.enabled",
            ConfigDataType.BOOLEAN,
            True,
            "Enable node discovery",
        )
        swarm_schema.add(
            "sync.interval_seconds",
            ConfigDataType.INTEGER,
            10,
            "State sync interval",
            min_value=1,
        )
        swarm_schema.add(
            "sync.timeout_seconds",
            ConfigDataType.INTEGER,
            30,
            "Sync operation timeout",
            min_value=1,
        )
        swarm_schema.add(
            "heartbeat.interval_seconds",
            ConfigDataType.INTEGER,
            5,
            "Heartbeat interval",
            min_value=1,
        )
        swarm_schema.add(
            "heartbeat.timeout_seconds",
            ConfigDataType.INTEGER,
            15,
            "Heartbeat timeout",
            min_value=1,
        )

        self._registry.register_schema(swarm_schema)

        # Cognitive schema
        cognitive_schema = ConfigSchema(
            component="cognitive",
            description="Cognitive engine configuration",
            version="1.0.0",
        )
        cognitive_schema.add(
            "engine.default",
            ConfigDataType.STRING,
            "pixelbrain",
            "Default cognitive engine",
            choices=["pixelbrain", "lmstudio", "openai", "anthropic"],
        )
        cognitive_schema.add(
            "engine.fallback",
            ConfigDataType.STRING,
            "lmstudio",
            "Fallback cognitive engine",
        )
        cognitive_schema.add(
            "pixelbrain.path",
            ConfigDataType.PATH,
            "",
            "Path to PixelBrain atlas",
        )
        cognitive_schema.add(
            "lmstudio.url",
            ConfigDataType.URL,
            "http://localhost:1234",
            "LM Studio API URL",
        )
        cognitive_schema.add(
            "lmstudio.model",
            ConfigDataType.STRING,
            "",
            "LM Studio model name",
        )
        cognitive_schema.add(
            "inference.max_tokens",
            ConfigDataType.INTEGER,
            1024,
            "Maximum tokens for inference",
            min_value=1,
            max_value=32768,
        )
        cognitive_schema.add(
            "inference.temperature",
            ConfigDataType.FLOAT,
            0.7,
            "Inference temperature",
            min_value=0.0,
            max_value=2.0,
        )
        cognitive_schema.add(
            "api.openai_key",
            ConfigDataType.STRING,
            "",
            "OpenAI API key",
            secret=True,
        )
        cognitive_schema.add(
            "api.anthropic_key",
            ConfigDataType.STRING,
            "",
            "Anthropic API key",
            secret=True,
        )

        self._registry.register_schema(cognitive_schema)

        # Logging schema
        logging_schema = ConfigSchema(
            component="logging",
            description="System-wide logging configuration",
            version="1.0.0",
        )
        logging_schema.add(
            "level",
            ConfigDataType.STRING,
            "INFO",
            "Global log level",
            choices=["DEBUG", "INFO", "WARNING", "ERROR", "CRITICAL"],
        )
        logging_schema.add(
            "format",
            ConfigDataType.STRING,
            "%(asctime)s - %(name)s - %(levelname)s - %(message)s",
            "Log format string",
        )
        logging_schema.add(
            "file.path",
            ConfigDataType.PATH,
            "",
            "Log file path",
        )
        logging_schema.add(
            "file.max_size_mb",
            ConfigDataType.INTEGER,
            100,
            "Maximum log file size",
            min_value=1,
            max_value=1024,
        )
        logging_schema.add(
            "file.backup_count",
            ConfigDataType.INTEGER,
            5,
            "Number of backup log files",
            min_value=0,
            max_value=100,
        )
        logging_schema.add(
            "console.enabled",
            ConfigDataType.BOOLEAN,
            True,
            "Enable console logging",
        )
        logging_schema.add(
            "console.color",
            ConfigDataType.BOOLEAN,
            True,
            "Enable colored console output",
        )

        self._registry.register_schema(logging_schema)

    def register_component(self, name: str, schema: ConfigSchema) -> None:
        """
        Register a component configuration schema.

        Args:
            name: Component name
            schema: Configuration schema
        """
        self._registry.register_schema(schema)

    def load_all(self, config_dir: str | Path | None = None, load_env: bool = True) -> dict[str, list[str]]:
        """
        Load configurations for all components.

        Args:
            config_dir: Directory containing config files
            load_env: Whether to load from environment variables

        Returns:
            Dictionary of loaded keys per component
        """
        dir_path = Path(config_dir) if config_dir else self.config_dir
        return self._registry.load_all(dir_path, load_env)

    def get(self, component: str, key: str, default: Any = None) -> Any:
        """Get a configuration value."""
        return self._registry.get(component, key, default)

    def set(
        self,
        component: str,
        key: str,
        value: Any,
        validate: bool = True,
    ) -> tuple[bool, str]:
        """Set a configuration value."""
        return self._registry.set(component, key, value, validate)

    def set_batch(
        self,
        component: str,
        values: dict[str, Any],
        validate: bool = True,
    ) -> dict[str, tuple[bool, str]]:
        """Set multiple configuration values."""
        return self._registry.set_batch(component, values, validate)

    def get_all(self, component: str) -> dict[str, Any]:
        """Get all configuration values for a component."""
        return self._registry.get_all(component)

    def get_all_components(self) -> dict[str, dict[str, Any]]:
        """Get all configuration values for all components."""
        return self._registry.get_all_components()

    def validate(self, component: str | None = None) -> dict[str, dict[str, list[str]]]:
        """Validate configuration values."""
        return self._registry.validate(component)

    def watch(
        self,
        component: str,
        key: str,
        callback: Any,
    ) -> None:
        """Watch for configuration changes."""
        self._registry.watch(component, key, callback)

    def watch_global(self, callback: Any) -> None:
        """Watch for any configuration change."""
        self._registry.watch_global(callback)

    def create_snapshot(self, name: str | None = None) -> str:
        """
        Create a configuration snapshot.

        Args:
            name: Snapshot name (auto-generated if not provided)

        Returns:
            Snapshot ID
        """
        snapshot_id = name or f"snapshot_{datetime.now().strftime('%Y%m%d_%H%M%S')}"
        self._snapshots[snapshot_id] = self._registry.create_snapshot()
        self._save_state()
        logger.info(f"Created snapshot: {snapshot_id}")
        return snapshot_id

    def list_snapshots(self) -> list[dict[str, Any]]:
        """List all configuration snapshots."""
        return [
            {
                "id": snapshot_id,
                "created_at": data.get("snapshot_at"),
                "components": list(data.get("configurations", {}).get("components", {}).keys()),
            }
            for snapshot_id, data in self._snapshots.items()
        ]

    def restore_snapshot(self, snapshot_id: str) -> dict[str, dict[str, tuple[bool, str]]]:
        """
        Restore configuration from a snapshot.

        Args:
            snapshot_id: Snapshot ID to restore

        Returns:
            Results of the restore operation
        """
        snapshot = self._snapshots.get(snapshot_id)
        if not snapshot:
            raise ValueError(f"Snapshot not found: {snapshot_id}")

        result = self._registry.restore_snapshot(snapshot)
        logger.info(f"Restored snapshot: {snapshot_id}")
        return result

    def delete_snapshot(self, snapshot_id: str) -> bool:
        """Delete a configuration snapshot."""
        if snapshot_id in self._snapshots:
            del self._snapshots[snapshot_id]
            self._save_state()
            logger.info(f"Deleted snapshot: {snapshot_id}")
            return True
        return False

    def export_config(
        self,
        path: str | Path,
        format: str = "yaml",
        include_secrets: bool = False,
    ) -> bool:
        """
        Export configurations to a file.

        Args:
            path: Export file path
            format: Export format (yaml or json)
            include_secrets: Whether to include secret values

        Returns:
            True if export was successful
        """
        path = Path(path)
        data = self._registry.export_all(include_secrets)

        try:
            path.parent.mkdir(parents=True, exist_ok=True)

            with open(path, "w") as f:
                if format == "yaml":
                    yaml.dump(data, f, default_flow_style=False)
                else:
                    json.dump(data, f, indent=2)

            logger.info(f"Exported configuration to {path}")
            return True

        except Exception as e:
            logger.error(f"Failed to export configuration: {e}")
            return False

    def import_config(
        self,
        path: str | Path,
        priority: ConfigPriority = ConfigPriority.DEPLOYED,
    ) -> dict[str, dict[str, tuple[bool, str]]]:
        """
        Import configurations from a file.

        Args:
            path: Import file path
            priority: Priority for imported values

        Returns:
            Results of the import operation
        """
        path = Path(path)

        try:
            with open(path) as f:
                if path.suffix in (".yaml", ".yml"):
                    data = yaml.safe_load(f)
                else:
                    data = json.load(f)

            result = self._registry.import_all(
                data,
                source=ConfigSource.FILE,
                priority=priority,
            )

            logger.info(f"Imported configuration from {path}")
            return result

        except Exception as e:
            logger.error(f"Failed to import configuration: {e}")
            raise

    def get_schema_info(self, component: str | None = None) -> dict[str, Any]:
        """
        Get schema information.

        Args:
            component: Specific component, or None for all

        Returns:
            Schema information dictionary
        """
        if component:
            schema = self._registry.get_schema(component)
            return schema.to_dict() if schema else {}
        else:
            return {
                comp: schema.to_dict()
                for comp, schema in self._registry._schemas.items()
            }

    def record_deployment(self, deployment_info: dict[str, Any]) -> None:
        """Record a deployment in history."""
        deployment_info["recorded_at"] = datetime.now().isoformat()
        self._deployment_history.append(deployment_info)
        self._save_state()

    def get_deployment_history(self, limit: int = 10) -> list[dict[str, Any]]:
        """Get deployment history."""
        return self._deployment_history[-limit:]

    def update_instance_status(
        self,
        instance_id: str,
        status: dict[str, Any],
    ) -> None:
        """Update status for an instance."""
        status["updated_at"] = datetime.now().isoformat()
        self._instance_status[instance_id] = status
        self._save_state()

    def get_instance_status(self, instance_id: str | None = None) -> dict[str, Any]:
        """Get status for one or all instances."""
        if instance_id:
            return self._instance_status.get(instance_id, {})
        return dict(self._instance_status)

    def _load_state(self) -> None:
        """Load hub state from file."""
        if self.state_file and self.state_file.exists():
            try:
                with open(self.state_file) as f:
                    state = json.load(f)

                self._deployment_history = state.get("deployment_history", [])
                self._snapshots = state.get("snapshots", {})
                self._instance_status = state.get("instance_status", {})

                logger.debug(f"Loaded hub state from {self.state_file}")

            except Exception as e:
                logger.warning(f"Failed to load hub state: {e}")

    def _save_state(self) -> None:
        """Save hub state to file."""
        if not self.state_file:
            return

        try:
            self.state_file.parent.mkdir(parents=True, exist_ok=True)

            state = {
                "deployment_history": self._deployment_history,
                "snapshots": self._snapshots,
                "instance_status": self._instance_status,
            }

            with open(self.state_file, "w") as f:
                json.dump(state, f, indent=2)

        except Exception as e:
            logger.error(f"Failed to save hub state: {e}")


def get_config_hub(
    config_dir: str | Path | None = None,
    state_file: str | Path | None = None,
    reset: bool = False,
) -> ConfigHub:
    """
    Get the singleton ConfigHub instance.

    Args:
        config_dir: Configuration directory
        state_file: State file path
        reset: Force creation of new instance

    Returns:
        ConfigHub singleton instance
    """
    global _hub_instance

    if _hub_instance is None or reset:
        _hub_instance = ConfigHub(config_dir, state_file)

    return _hub_instance


def reset_config_hub() -> None:
    """Reset the ConfigHub singleton."""
    global _hub_instance
    _hub_instance = None
