# systems/kernel/cluster.py
"""
Kernel Cluster Management

Groups multiple kernels for coordinated execution.
"""
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Dict, List, Optional, Any
import asyncio
import logging

from .unified_neural_kernel import NeuralKernelInterface, KernelConfig

logger = logging.getLogger(__name__)


class ClusterStatus(Enum):
    """Status of a kernel cluster."""
    INITIALIZING = auto()
    RUNNING = auto()
    SCALING = auto()
    STOPPED = auto()
    ERROR = auto()


@dataclass
class ClusterConfig:
    """Configuration for a kernel cluster."""
    min_kernels: int = 1
    max_kernels: int = 10
    auto_scale: bool = False
    scale_up_threshold: float = 0.8   # CPU threshold to scale up
    scale_down_threshold: float = 0.2  # CPU threshold to scale down
    health_check_interval_ms: int = 5000


class KernelCluster:
    """
    Manages a group of kernels as a unit.

    Usage:
        cluster = KernelCluster("compute")
        cluster.add_kernel("worker-1", kernel1)
        cluster.add_kernel("worker-2", kernel2)

        cluster.start()

        # Use cluster
        result = await cluster.dispatch(request)

        cluster.stop()
    """

    def __init__(
        self,
        name: str,
        config: Optional[ClusterConfig] = None
    ):
        self.name = name
        self.config = config or ClusterConfig()
        self._kernels: Dict[str, NeuralKernelInterface] = {}
        self.status = ClusterStatus.INITIALIZING
        self._health_task: Optional[asyncio.Task] = None

    @property
    def kernel_count(self) -> int:
        return len(self._kernels)

    def add_kernel(self, name: str, kernel: NeuralKernelInterface):
        """Add a kernel to the cluster."""
        self._kernels[name] = kernel
        logger.info(f"Added kernel '{name}' to cluster '{self.name}'")

    def remove_kernel(self, name: str) -> bool:
        """Remove a kernel from the cluster."""
        if name in self._kernels:
            del self._kernels[name]
            logger.info(f"Removed kernel '{name}' from cluster '{self.name}'")
            return True
        return False

    def start(self):
        """Start the cluster."""
        # Initialize all kernels
        for name, kernel in self._kernels.items():
            if hasattr(kernel, 'initialize'):
                kernel.initialize()

        self.status = ClusterStatus.RUNNING
        logger.info(f"Cluster '{self.name}' started with {self.kernel_count} kernels")

    def stop(self):
        """Stop the cluster."""
        if self._health_task:
            self._health_task.cancel()

        self.status = ClusterStatus.STOPPED
        logger.info(f"Cluster '{self.name}' stopped")

    async def dispatch(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Dispatch to any kernel in the cluster."""
        if self.status != ClusterStatus.RUNNING:
            return {"success": False, "error": "Cluster not running"}

        # Import KernelRequest to create proper request object
        from .unified_neural_kernel import KernelRequest, SysCall

        # Convert dict to KernelRequest if needed
        if not isinstance(request, KernelRequest):
            syscall_type = request.get("type", "ping")
            # Try to match syscall type
            syscall = SysCall.READ  # Default
            for sc in SysCall:
                if syscall_type.upper() == sc.name:
                    syscall = sc
                    break

            kernel_request = KernelRequest(
                uid=request.get("id", 1),
                syscall=syscall,
                args=request
            )
        else:
            kernel_request = request

        # Simple round-robin for now
        for name, kernel in self._kernels.items():
            if hasattr(kernel, 'dispatch_syscall'):
                try:
                    result = kernel.dispatch_syscall(kernel_request)
                    return {"success": True, "kernel": name, "result": result}
                except Exception as e:
                    continue

        return {"success": False, "error": "No kernel available"}

    def get_status(self) -> Dict[str, Any]:
        """Get cluster status."""
        return {
            "name": self.name,
            "status": self.status.value,
            "kernel_count": self.kernel_count,
            "kernels": list(self._kernels.keys())
        }
