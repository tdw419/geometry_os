# systems/kernel/orchestration_tools.py
"""
Orchestration Tools for WebMCP Integration

Provides tools for AI-driven cluster management.
"""
import asyncio
from typing import Dict, List, Optional, Any
import logging

from .cluster import KernelCluster, ClusterConfig
from .orchestration import OrchestrationEngine, OrchestrationConfig
from .load_balancer import LoadBalancer
from .cluster_metrics import ClusterMetricsCollector

logger = logging.getLogger(__name__)


class OrchestrationTools:
    """
    Tools for managing kernel orchestration via WebMCP.

    Usage:
        tools = OrchestrationTools()

        # Create a cluster
        await tools.create_cluster("compute", kernel_count=3)

        # Dispatch request
        result = await tools.dispatch("compute", {"type": "syscall"})

        # Get metrics
        metrics = await tools.get_metrics("compute")
    """

    def __init__(self):
        self._clusters: Dict[str, KernelCluster] = {}
        self._engines: Dict[str, OrchestrationEngine] = {}
        self._metrics: Dict[str, ClusterMetricsCollector] = {}
        self._load_balancers: Dict[str, LoadBalancer] = {}

    async def create_cluster(
        self,
        name: str,
        kernel_count: int = 1,
        config: Optional[Dict[str, Any]] = None
    ) -> Dict[str, Any]:
        """Create a new kernel cluster."""
        from . import HybridKernel, KernelConfig, KernelType

        if name in self._clusters:
            return {"success": False, "error": f"Cluster '{name}' already exists"}

        # Create cluster
        cluster_config = ClusterConfig(**config) if config else ClusterConfig()
        cluster = KernelCluster(name=name, config=cluster_config)

        # Add kernels
        for i in range(kernel_count):
            kernel = HybridKernel(config=KernelConfig(gpu_enabled=False))
            kernel.initialize()
            cluster.add_kernel(f"worker-{i}", kernel)

        # Create engine and metrics
        engine = OrchestrationEngine(config=OrchestrationConfig())
        metrics = ClusterMetricsCollector(cluster_name=name)
        load_balancer = LoadBalancer()

        # Register kernels with load balancer
        for i in range(kernel_count):
            load_balancer.register(f"worker-{i}")

        # Start cluster
        cluster.start()

        # Store
        self._clusters[name] = cluster
        self._engines[name] = engine
        self._metrics[name] = metrics
        self._load_balancers[name] = load_balancer

        return {
            "success": True,
            "cluster_name": name,
            "kernel_count": kernel_count
        }

    async def destroy_cluster(self, name: str) -> Dict[str, Any]:
        """Destroy a cluster."""
        if name not in self._clusters:
            return {"success": False, "error": f"Cluster '{name}' not found"}

        cluster = self._clusters[name]
        cluster.stop()

        del self._clusters[name]
        del self._engines[name]
        del self._metrics[name]
        del self._load_balancers[name]

        return {"success": True, "cluster_name": name}

    async def list_clusters(self) -> Dict[str, Any]:
        """List all clusters."""
        clusters = []

        for name, cluster in self._clusters.items():
            clusters.append(cluster.get_status())

        return {"clusters": clusters, "count": len(clusters)}

    async def dispatch(
        self,
        cluster: str,
        request: Dict[str, Any]
    ) -> Dict[str, Any]:
        """Dispatch a request to a cluster."""
        if cluster not in self._clusters:
            return {"success": False, "error": f"Cluster '{cluster}' not found"}

        cluster_obj = self._clusters[cluster]
        result = await cluster_obj.dispatch(request)

        # Record metrics
        self._metrics[cluster].increment(
            result.get("kernel", "unknown"),
            "dispatches"
        )

        return result

    async def get_metrics(self, cluster: str) -> Dict[str, Any]:
        """Get cluster metrics."""
        if cluster not in self._metrics:
            return {"success": False, "error": f"Cluster '{cluster}' not found"}

        summary = self._metrics[cluster].get_cluster_summary()
        return {"success": True, "metrics": summary.to_dict()}

    async def scale_cluster(
        self,
        cluster: str,
        target_count: int
    ) -> Dict[str, Any]:
        """Scale cluster to target kernel count."""
        if cluster not in self._clusters:
            return {"success": False, "error": f"Cluster '{cluster}' not found"}

        current = self._clusters[cluster].kernel_count

        if target_count < current:
            return {"success": False, "error": "Scale down not yet supported"}

        # Add more kernels
        from . import HybridKernel, KernelConfig

        for i in range(current, target_count):
            kernel = HybridKernel(config=KernelConfig(gpu_enabled=False))
            kernel.initialize()
            self._clusters[cluster].add_kernel(f"worker-{i}", kernel)
            self._load_balancers[cluster].register(f"worker-{i}")

        return {
            "success": True,
            "cluster": cluster,
            "previous_count": current,
            "new_count": target_count
        }


# WebMCP tool functions
async def orchestration_list_clusters() -> Dict[str, Any]:
    """List all kernel clusters."""
    tools = OrchestrationTools()
    return await tools.list_clusters()


async def orchestration_get_metrics(cluster: str) -> Dict[str, Any]:
    """Get metrics for a cluster."""
    tools = OrchestrationTools()
    return await tools.get_metrics(cluster)
