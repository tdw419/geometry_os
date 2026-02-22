"""
Kernel Bridge - Python Bridge Module for WebMCP Integration

Provides a JSON-serializable API for kernel management operations,
enabling WebMCP and JavaScript clients to interact with the neural
kernel subsystem.

Features:
- List, create, and manage kernels
- Hot-swap active kernels
- Health monitoring and metrics
- Syscall dispatch through active kernel
- Full rollback support

Usage:
    from systems.kernel.bridge import KernelBridge, BridgeConfig

    # Create bridge with default config
    bridge = KernelBridge()

    # Create and activate a kernel
    result = bridge.create_kernel(
        name="main_kernel",
        kernel_type="hybrid",
        gpu_enabled=True,
        make_active=True
    )

    # List all kernels
    kernels = bridge.list_kernels()

    # Dispatch a syscall
    result = bridge.dispatch_syscall("READ", {"address": 0x1000})

    # Hot-swap to different kernel
    result = bridge.swap_kernel("backup_kernel")

    # Rollback if needed
    result = bridge.rollback()
"""

from dataclasses import dataclass, asdict
from typing import Dict, Any, Optional, List, Union
import time

from .unified_neural_kernel import (
    KernelFactory,
    KernelConfig,
    KernelType,
    KernelRequest,
    KernelResult,
    SysCall,
)
from .kernel_registry import KernelRegistry, KernelStatus


@dataclass
class BridgeConfig:
    """Configuration for KernelBridge."""
    default_gpu_enabled: bool = False
    auto_initialize: bool = True


class KernelBridge:
    """
    JSON-serializable API bridge for kernel management.

    This class wraps the KernelRegistry and KernelFactory to provide
    a clean, JSON-friendly interface suitable for WebMCP integration.

    All methods return dictionaries that are JSON-serializable, making
    them easy to call from JavaScript via WebMCP tools.
    """

    def __init__(self, config: Optional[BridgeConfig] = None):
        """
        Initialize the kernel bridge.

        Args:
            config: Optional bridge configuration. Uses defaults if not provided.
        """
        self.config = config or BridgeConfig()
        self._registry = KernelRegistry()
        self._active_name: Optional[str] = None

    def _success(self, **kwargs) -> Dict[str, Any]:
        """Create a success response dictionary."""
        return {"success": True, **kwargs}

    def _error(self, message: str, **kwargs) -> Dict[str, Any]:
        """Create an error response dictionary."""
        return {"success": False, "error": message, **kwargs}

    def list_kernels(self) -> Dict[str, Any]:
        """
        List all registered kernels.

        Returns:
            Dictionary with:
            - kernels: List of kernel info dictionaries
            - active: Name of active kernel (or None)
            - count: Number of registered kernels
        """
        kernels = self._registry.list_kernels()
        active = self._registry.get_active_name()

        return {
            "success": True,
            "kernels": kernels,
            "active": active,
            "count": len(kernels)
        }

    def create_kernel(
        self,
        name: str,
        kernel_type: str,
        gpu_enabled: Optional[bool] = None,
        version: str = "1.0.0",
        tags: Optional[List[str]] = None,
        make_active: bool = False,
    ) -> Dict[str, Any]:
        """
        Create and register a new kernel.

        Args:
            name: Unique name for the kernel
            kernel_type: Type of kernel ("hybrid", "gpu_resident", "dispatcher")
            gpu_enabled: Whether to enable GPU acceleration (uses config default if None)
            version: Version string for the kernel
            tags: Optional list of tags for categorization
            make_active: Whether to make this the active kernel

        Returns:
            Dictionary with:
            - success: Whether creation succeeded
            - name: Name of created kernel
            - message: Status message
            - error: Error message if failed
        """
        try:
            # Determine GPU setting
            if gpu_enabled is None:
                gpu_enabled = self.config.default_gpu_enabled

            # Create kernel configuration
            kernel_type_enum = KernelType[kernel_type.upper()]
            config = KernelConfig(
                kernel_type=kernel_type_enum,
                gpu_enabled=gpu_enabled,
            )

            # Create kernel via factory
            kernel = KernelFactory.create(kernel_type_enum, config=config)

            # Register with registry
            success = self._registry.register(
                name=name,
                kernel=kernel,
                kernel_type=kernel_type_enum,
                version=version,
                tags=tags or [],
                make_active=make_active,
            )

            if success:
                return self._success(
                    name=name,
                    message=f"Kernel '{name}' created successfully",
                    type=kernel_type,
                    active=self._registry.get_active_name()
                )
            else:
                return self._error(
                    f"Kernel '{name}' already exists or registration failed",
                    name=name
                )

        except KeyError:
            return self._error(
                f"Invalid kernel type: {kernel_type}",
                name=name
            )
        except ValueError as e:
            return self._error(
                str(e),
                name=name
            )
        except Exception as e:
            return self._error(
                f"Failed to create kernel: {str(e)}",
                name=name
            )

    def swap_kernel(self, name: str) -> Dict[str, Any]:
        """
        Hot-swap to a different kernel.

        Args:
            name: Name of kernel to swap to

        Returns:
            Dictionary with:
            - success: Whether swap succeeded
            - active: Name of now-active kernel
            - error: Error message if failed
        """
        if self._registry.swap(name):
            return self._success(
                active=self._registry.get_active_name(),
                message=f"Swapped to kernel '{name}'"
            )
        else:
            return self._error(
                f"Cannot swap to kernel '{name}': not found or not healthy"
            )

    def health_check(self, name: Optional[str] = None) -> Dict[str, Any]:
        """
        Check health of a kernel.

        Args:
            name: Name of kernel to check (checks all if None)

        Returns:
            Dictionary with:
            - success: Whether check succeeded
            - health: Health status dictionary
            - error: Error message if failed
        """
        try:
            health = self._registry.health_check(name)
            # Check if health result contains an error
            if isinstance(health, dict) and "error" in health:
                return self._error(health["error"], health=health)
            return self._success(health=health)
        except Exception as e:
            return self._error(f"Health check failed: {str(e)}")

    def get_metrics(self, name: str) -> Dict[str, Any]:
        """
        Get performance metrics for a kernel.

        Args:
            name: Name of kernel to get metrics for

        Returns:
            Dictionary with:
            - success: Whether operation succeeded
            - metrics: Metrics dictionary
            - error: Error message if failed
        """
        kernel = self._registry.get(name)
        if kernel is None:
            return self._error(f"Kernel '{name}' not found")

        try:
            metrics = kernel.get_metrics()
            return self._success(
                metrics={
                    "total_dispatches": metrics.total_dispatches,
                    "successful_dispatches": metrics.successful_dispatches,
                    "failed_dispatches": metrics.failed_dispatches,
                    "total_latency_ns": metrics.total_latency_ns,
                    "avg_latency_ns": metrics.avg_latency_ns,
                    "success_rate": metrics.success_rate,
                    "gpu_dispatches": metrics.gpu_dispatches,
                    "cpu_dispatches": metrics.cpu_dispatches,
                    "cache_hits": metrics.cache_hits,
                    "cache_hit_rate": metrics.cache_hit_rate,
                    "mutations_applied": metrics.mutations_applied,
                }
            )
        except Exception as e:
            return self._error(f"Failed to get metrics: {str(e)}")

    def dispatch_syscall(
        self,
        syscall: str,
        args: Dict[str, Any],
        uid: Optional[int] = None,
        priority: int = 0,
    ) -> Dict[str, Any]:
        """
        Dispatch a syscall through the active kernel.

        Args:
            syscall: Syscall name (e.g., "READ", "WRITE", "ALLOC")
            args: Arguments for the syscall
            uid: Optional unique ID for the request
            priority: Request priority (default 0)

        Returns:
            Dictionary with:
            - success: Whether dispatch succeeded
            - data: Result data
            - latency_ns: Execution latency in nanoseconds
            - path_taken: Execution path (e.g., "1.0_FAST", "GPU_DISPATCH")
            - error: Error message if failed
        """
        kernel = self._registry.get_active()
        if kernel is None:
            return self._error("No active kernel available")

        try:
            # Parse syscall enum
            syscall_enum = SysCall[syscall.upper()]

            # Create request
            request = KernelRequest(
                uid=uid or int(time.time() * 1000000),
                syscall=syscall_enum,
                args=args,
                priority=priority,
            )

            # Dispatch through kernel
            result: KernelResult = kernel.dispatch_syscall(request)

            return {
                "success": result.success,
                "data": result.data,
                "latency_ns": result.latency_ns,
                "path_taken": result.path_taken,
                "gpu_time_ns": result.gpu_time_ns,
                "cpu_time_ns": result.cpu_time_ns,
                "cache_hit": result.cache_hit,
            }

        except KeyError:
            return self._error(f"Invalid syscall: {syscall}")
        except Exception as e:
            return self._error(f"Dispatch failed: {str(e)}")

    def unregister_kernel(self, name: str) -> Dict[str, Any]:
        """
        Remove a kernel from the registry.

        Args:
            name: Name of kernel to remove

        Returns:
            Dictionary with:
            - success: Whether removal succeeded
            - message: Status message
            - error: Error message if failed
        """
        if self._registry.unregister(name):
            return self._success(
                message=f"Kernel '{name}' unregistered",
                active=self._registry.get_active_name()
            )
        else:
            return self._error(
                f"Cannot unregister kernel '{name}': not found or is active with no backup"
            )

    def rollback(self) -> Dict[str, Any]:
        """
        Rollback to the previous kernel.

        Returns:
            Dictionary with:
            - success: Whether rollback succeeded
            - active: Name of now-active kernel
            - error: Error message if failed
        """
        if self._registry.rollback():
            return self._success(
                active=self._registry.get_active_name(),
                message="Rollback successful"
            )
        else:
            return self._error("No kernel history to rollback to")


# Convenience function for getting a global bridge instance
_global_bridge: Optional[KernelBridge] = None


def get_bridge(config: Optional[BridgeConfig] = None) -> KernelBridge:
    """
    Get the global kernel bridge instance.

    Args:
        config: Optional configuration (only used on first call)

    Returns:
        Global KernelBridge instance
    """
    global _global_bridge
    if _global_bridge is None:
        _global_bridge = KernelBridge(config=config)
    return _global_bridge


def set_bridge(bridge: KernelBridge):
    """
    Set the global kernel bridge instance.

    Args:
        bridge: KernelBridge instance to use globally
    """
    global _global_bridge
    _global_bridge = bridge
