# systems/kernel/load_balancer.py
"""
Load Balancer for Kernel Clusters

Provides intelligent load distribution across kernels.
"""
from dataclasses import dataclass, field
from typing import Dict, List, Optional, Any
import time
import logging

logger = logging.getLogger(__name__)


@dataclass
class KernelLoad:
    """Load metrics for a kernel."""
    name: str
    cpu: float = 0.0         # 0.0 to 1.0
    memory: float = 0.0      # 0.0 to 1.0
    queue_depth: int = 0     # Pending requests
    latency_ms: float = 0.0  # Average latency
    error_rate: float = 0.0  # 0.0 to 1.0
    last_updated: float = field(default_factory=time.time)
    _config: Optional['LoadBalancerConfig'] = None

    @property
    def weighted_load(self) -> float:
        """Calculate weighted load score using default or config."""
        cfg = self._config or LoadBalancerConfig()

        # Normalize queue_depth to 0-1 range (assuming max 100)
        normalized_queue = min(self.queue_depth / 100.0, 1.0)

        # Use provided weights
        return (
            self.cpu * cfg.cpu_weight +
            self.memory * cfg.memory_weight +
            normalized_queue * cfg.queue_weight +
            self.error_rate * cfg.error_weight
        )

    def calculate_weighted_load(self, config: 'LoadBalancerConfig') -> float:
        """Calculate weighted load score with custom config."""
        # Normalize queue_depth to 0-1 range (assuming max 100)
        normalized_queue = min(self.queue_depth / 100.0, 1.0)

        # Use provided weights
        return (
            self.cpu * config.cpu_weight +
            self.memory * config.memory_weight +
            normalized_queue * config.queue_weight +
            self.error_rate * config.error_weight
        )


@dataclass
class LoadBalancerConfig:
    """Configuration for load balancer."""
    cpu_weight: float = 0.4
    memory_weight: float = 0.3
    queue_weight: float = 0.2
    error_weight: float = 0.1
    max_latency_ms: float = 1000.0
    health_threshold: float = 0.8  # Consider unhealthy above this


class LoadBalancer:
    """
    Balances load across kernel instances.

    Usage:
        balancer = LoadBalancer()

        # Register kernels
        balancer.register("kernel-1")
        balancer.register("kernel-2")

        # Update load metrics
        balancer.update_load("kernel-1", cpu=0.5, memory=0.3)

        # Select best kernel
        kernel = balancer.select_kernel()
    """

    def __init__(self, config: Optional[LoadBalancerConfig] = None):
        self.config = config or LoadBalancerConfig()
        self._loads: Dict[str, KernelLoad] = {}

    @property
    def kernels(self) -> List[str]:
        return list(self._loads.keys())

    def register(self, name: str):
        """Register a kernel with load balancer."""
        self._loads[name] = KernelLoad(name=name, _config=self.config)
        logger.info(f"Registered kernel '{name}' with load balancer")

    def unregister(self, name: str):
        """Unregister a kernel."""
        self._loads.pop(name, None)

    def update_load(
        self,
        name: str,
        cpu: Optional[float] = None,
        memory: Optional[float] = None,
        queue_depth: Optional[int] = None,
        latency_ms: Optional[float] = None,
        error_rate: Optional[float] = None
    ):
        """Update load metrics for a kernel."""
        if name not in self._loads:
            self.register(name)

        load = self._loads[name]
        if cpu is not None:
            load.cpu = cpu
        if memory is not None:
            load.memory = memory
        if queue_depth is not None:
            load.queue_depth = queue_depth
        if latency_ms is not None:
            load.latency_ms = latency_ms
        if error_rate is not None:
            load.error_rate = error_rate
        load.last_updated = time.time()

    def get_load(self, name: str) -> Optional[KernelLoad]:
        """Get load metrics for a kernel."""
        return self._loads.get(name)

    def select_kernel(
        self,
        exclude: Optional[List[str]] = None
    ) -> Optional[str]:
        """Select best kernel based on load."""
        exclude = exclude or []

        available = {
            name: load for name, load in self._loads.items()
            if name not in exclude and load.calculate_weighted_load(self.config) < self.config.health_threshold
        }

        if not available:
            # Fall back to all kernels if none are healthy
            available = {
                name: load for name, load in self._loads.items()
                if name not in exclude
            }

        if not available:
            return None

        # Select kernel with lowest weighted load
        return min(available.items(), key=lambda x: x[1].calculate_weighted_load(self.config))[0]

    def get_all_loads(self) -> Dict[str, KernelLoad]:
        """Get load for all kernels."""
        return dict(self._loads)

    def get_summary(self) -> Dict[str, Any]:
        """Get load balancer summary."""
        loads = list(self._loads.values())
        if not loads:
            return {"kernels": 0, "avg_load": 0.0}

        return {
            "kernels": len(loads),
            "avg_load": sum(l.calculate_weighted_load(self.config) for l in loads) / len(loads),
            "max_load": max(l.calculate_weighted_load(self.config) for l in loads),
            "min_load": min(l.calculate_weighted_load(self.config) for l in loads)
        }
