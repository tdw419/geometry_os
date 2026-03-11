"""
Geometry OS Centralized Configuration Hub
==========================================

A unified configuration management system that provides:
- Schema-based validation
- Multiple configuration sources (file, env, defaults, remote)
- Hot reload and change notifications
- Instance deployment and synchronization
- Version control and rollback
- Health verification

Usage:
    from systems.config_hub import ConfigHub, get_config_hub

    # Get the singleton hub
    hub = get_config_hub()

    # Register a component's config schema
    hub.register_schema("evolution_daemon", evolution_schema)

    # Get configuration value
    cache_size = hub.get("evolution_daemon", "cache.size_mb", default=100)

    # Watch for changes
    hub.watch("evolution_daemon", "cache.size_mb", on_cache_change)

    # Deploy to instances
    hub.deploy_to_instances(["node-01", "node-02"])
"""

from systems.config_hub.core.schema import (
    ConfigSchema,
    ConfigValue,
    ConfigDataType,
    ConfigSource,
    ConfigValidationError,
)
from systems.config_hub.core.manager import ConfigManager
from systems.config_hub.core.registry import ConfigRegistry
from systems.config_hub.hub import ConfigHub, get_config_hub
from systems.config_hub.deployment.deployer import ConfigDeployer, DeploymentResult
from systems.config_hub.deployment.verifier import ConfigVerifier, VerificationResult

__all__ = [
    # Core
    "ConfigSchema",
    "ConfigValue",
    "ConfigDataType",
    "ConfigSource",
    "ConfigValidationError",
    "ConfigManager",
    "ConfigRegistry",
    # Hub
    "ConfigHub",
    "get_config_hub",
    # Deployment
    "ConfigDeployer",
    "DeploymentResult",
    "ConfigVerifier",
    "VerificationResult",
]

__version__ = "1.0.0"
