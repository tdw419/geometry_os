# systems/kernel/tests/test_orchestration.py
import pytest
from systems.kernel.orchestration import (
    OrchestrationEngine,
    OrchestrationConfig,
    RoutingStrategy
)


class TestOrchestrationEngine:
    """Tests for kernel orchestration."""

    def test_engine_creation(self):
        """Can create orchestration engine."""
        engine = OrchestrationEngine()

        assert engine is not None
        assert engine.strategy == RoutingStrategy.ROUND_ROBIN

    def test_engine_with_config(self):
        """Engine accepts configuration."""
        config = OrchestrationConfig(
            strategy=RoutingStrategy.LEAST_LOADED,
            max_concurrent=10
        )
        engine = OrchestrationEngine(config=config)

        assert engine.strategy == RoutingStrategy.LEAST_LOADED
        assert engine.max_concurrent == 10

    @pytest.mark.asyncio
    async def test_dispatch_to_kernel(self):
        """Engine can dispatch to registered kernel."""
        from systems.kernel import KernelRegistry, HybridKernel, KernelConfig, KernelType

        # Setup
        registry = KernelRegistry()
        kernel = HybridKernel(config=KernelConfig(gpu_enabled=False))
        kernel.initialize()
        registry.register("main", kernel, KernelType.HYBRID, make_active=True)

        engine = OrchestrationEngine(registry=registry)

        # Dispatch
        result = await engine.dispatch("main", {"type": "ping"})

        assert result["success"] is True

    @pytest.mark.asyncio
    async def test_round_robin_distribution(self):
        """Round robin distributes across kernels."""
        from systems.kernel import KernelRegistry, HybridKernel, KernelConfig, KernelType

        registry = KernelRegistry()

        # Create mock kernels
        for i in range(3):
            kernel = HybridKernel(config=KernelConfig(gpu_enabled=False))
            kernel.initialize()
            registry.register(f"k{i}", kernel, KernelType.HYBRID)

        engine = OrchestrationEngine(
            registry=registry,
            config=OrchestrationConfig(strategy=RoutingStrategy.ROUND_ROBIN)
        )

        # Dispatch multiple requests
        for _ in range(6):
            await engine.dispatch_any({"type": "ping"})

        # Each kernel should have received ~2 requests
        metrics = engine.get_metrics()
        assert metrics["dispatches"] == 6


class TestRoutingStrategy:
    """Tests for routing strategies."""

    def test_round_robin_exists(self):
        """Round robin strategy exists."""
        assert RoutingStrategy.ROUND_ROBIN.value == "round_robin"

    def test_least_loaded_exists(self):
        """Least loaded strategy exists."""
        assert RoutingStrategy.LEAST_LOADED.value == "least_loaded"

    def test_capability_based_exists(self):
        """Capability-based strategy exists."""
        assert RoutingStrategy.CAPABILITY_BASED.value == "capability_based"
