"""
Kernel Orchestration Engine

Provides intelligent workload distribution across multiple neural kernels.
"""
import asyncio
from dataclasses import dataclass, field
from enum import Enum, auto
from typing import Dict, List, Optional, Any, Callable
import time
import logging

from .kernel_registry import KernelRegistry, KernelStatus
from .unified_neural_kernel import KernelType, KernelRequest, SysCall

logger = logging.getLogger(__name__)


class RoutingStrategy(Enum):
    """Strategy for routing requests to kernels."""
    ROUND_ROBIN = "round_robin"          # Rotate through kernels
    LEAST_LOADED = "least_loaded"         # Pick kernel with lowest load
    CAPABILITY_BASED = "capability_based" # Match request to kernel capabilities
    RANDOM = "random"                     # Random selection
    PRIMARY_FALLBACK = "primary_fallback" # Use primary, fallback on error


@dataclass
class OrchestrationConfig:
    """Configuration for orchestration engine."""
    strategy: RoutingStrategy = RoutingStrategy.ROUND_ROBIN
    max_concurrent: int = 100
    timeout_ms: int = 5000
    retry_count: int = 2
    enable_failover: bool = True


@dataclass
class OrchestrationMetrics:
    """Metrics for orchestration engine."""
    total_dispatches: int = 0
    successful_dispatches: int = 0
    failed_dispatches: int = 0
    avg_latency_ms: float = 0.0
    kernel_distribution: Dict[str, int] = field(default_factory=dict)


class OrchestrationEngine:
    """
    Orchestrates workload distribution across multiple kernels.

    Usage:
        registry = KernelRegistry()
        # ... register kernels ...

        engine = OrchestrationEngine(registry=registry)

        # Dispatch to specific kernel
        result = await engine.dispatch("main", request)

        # Dispatch to any available kernel
        result = await engine.dispatch_any(request)
    """

    def __init__(
        self,
        registry: Optional[KernelRegistry] = None,
        config: Optional[OrchestrationConfig] = None
    ):
        self.registry = registry or KernelRegistry()
        self.config = config or OrchestrationConfig()
        self._round_robin_index = 0
        self._metrics = OrchestrationMetrics()
        self._semaphore = asyncio.Semaphore(self.config.max_concurrent)

    @property
    def strategy(self) -> RoutingStrategy:
        return self.config.strategy

    @property
    def max_concurrent(self) -> int:
        return self.config.max_concurrent

    async def dispatch(
        self,
        kernel_name: str,
        request: Dict[str, Any]
    ) -> Dict[str, Any]:
        """Dispatch a request to a specific kernel."""
        start_time = time.time()

        async with self._semaphore:
            entry = self.registry._kernels.get(kernel_name)
            if not entry:
                return {
                    "success": False,
                    "error": f"Kernel '{kernel_name}' not found"
                }

            if not entry.is_healthy:
                return {
                    "success": False,
                    "error": f"Kernel '{kernel_name}' is not healthy"
                }

            try:
                # Dispatch to kernel
                result = await self._execute_kernel(entry.kernel, request)
                self._record_success(kernel_name, time.time() - start_time)
                return result
            except Exception as e:
                self._record_failure(kernel_name)
                return {"success": False, "error": str(e)}

    async def dispatch_any(self, request: Dict[str, Any]) -> Dict[str, Any]:
        """Dispatch to any available kernel based on strategy."""
        kernel_name = self._select_kernel(request)
        if not kernel_name:
            return {"success": False, "error": "No available kernels"}

        return await self.dispatch(kernel_name, request)

    def _select_kernel(self, request: Dict[str, Any]) -> Optional[str]:
        """Select a kernel based on routing strategy."""
        available = [
            name for name, entry in self.registry._kernels.items()
            if entry.is_healthy
        ]

        if not available:
            return None

        if self.config.strategy == RoutingStrategy.ROUND_ROBIN:
            return self._select_round_robin(available)
        elif self.config.strategy == RoutingStrategy.LEAST_LOADED:
            return self._select_least_loaded(available)
        elif self.config.strategy == RoutingStrategy.RANDOM:
            import random
            return random.choice(available)
        else:
            return available[0]

    def _select_round_robin(self, available: List[str]) -> str:
        """Select next kernel in round-robin order."""
        self._round_robin_index = (self._round_robin_index + 1) % len(available)
        return available[self._round_robin_index]

    def _select_least_loaded(self, available: List[str]) -> str:
        """Select kernel with lowest load."""
        # Simple: select one with fewest dispatches
        loads = {
            name: self._metrics.kernel_distribution.get(name, 0)
            for name in available
        }
        return min(loads, key=loads.get)

    async def _execute_kernel(
        self,
        kernel,
        request: Dict[str, Any]
    ) -> Dict[str, Any]:
        """Execute request on kernel."""
        # Use kernel's dispatch method
        if hasattr(kernel, 'dispatch_syscall'):
            # Determine syscall type from request
            syscall_type = request.get("type", "ping")
            try:
                syscall = SysCall[syscall_type.upper()]
            except (KeyError, AttributeError):
                syscall = SysCall.READ  # Default

            kernel_request = KernelRequest(
                uid=request.get("uid", 0),
                syscall=syscall,
                args=request
            )
            result = kernel.dispatch_syscall(kernel_request)
            return {"success": True, "result": result}
        else:
            return {"success": True, "result": "pong"}

    def _record_success(self, kernel_name: str, latency: float):
        """Record successful dispatch."""
        self._metrics.total_dispatches += 1
        self._metrics.successful_dispatches += 1
        self._metrics.kernel_distribution[kernel_name] = \
            self._metrics.kernel_distribution.get(kernel_name, 0) + 1

    def _record_failure(self, kernel_name: str):
        """Record failed dispatch."""
        self._metrics.total_dispatches += 1
        self._metrics.failed_dispatch += 1

    def get_metrics(self) -> Dict[str, Any]:
        """Get orchestration metrics."""
        return {
            "dispatches": self._metrics.total_dispatches,
            "successful": self._metrics.successful_dispatches,
            "failed": self._metrics.failed_dispatches,
            "distribution": dict(self._metrics.kernel_distribution)
        }
