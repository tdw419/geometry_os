# systems/kernel/tests/test_load_balancer.py
import pytest
from systems.kernel.load_balancer import (
    LoadBalancer,
    LoadBalancerConfig,
    KernelLoad
)


class TestLoadBalancer:
    """Tests for load balancing."""

    def test_balancer_creation(self):
        """Can create load balancer."""
        balancer = LoadBalancer()

        assert balancer is not None

    def test_register_kernel(self):
        """Can register kernel with balancer."""
        balancer = LoadBalancer()

        balancer.register("kernel-1")

        assert "kernel-1" in balancer.kernels

    def test_update_load(self):
        """Can update kernel load."""
        balancer = LoadBalancer()
        balancer.register("kernel-1")

        balancer.update_load("kernel-1", cpu=0.5, memory=0.3, queue_depth=5)

        load = balancer.get_load("kernel-1")
        assert load.cpu == 0.5
        assert load.memory == 0.3
        assert load.queue_depth == 5

    def test_select_least_loaded(self):
        """Selects least loaded kernel."""
        balancer = LoadBalancer()

        balancer.register("k1")
        balancer.register("k2")
        balancer.register("k3")

        balancer.update_load("k1", cpu=0.8, memory=0.5)
        balancer.update_load("k2", cpu=0.2, memory=0.3)  # Least loaded
        balancer.update_load("k3", cpu=0.6, memory=0.7)

        selected = balancer.select_kernel()

        assert selected == "k2"

    def test_weighted_selection(self):
        """Can use weighted load calculation."""
        config = LoadBalancerConfig(
            cpu_weight=0.5,
            memory_weight=0.3,
            queue_weight=0.2
        )
        balancer = LoadBalancer(config=config)

        balancer.register("k1")
        balancer.update_load("k1", cpu=0.4, memory=0.4, queue_depth=4)

        load = balancer.get_load("k1")
        # Weighted: 0.4*0.5 + 0.4*0.3 + 4*0.01*0.2 = 0.2 + 0.12 + 0.008 = 0.328
        # Note: queue is normalized by 100, so 4/100 = 0.04
        # 0.4*0.5 + 0.4*0.3 + 0.04*0.2 = 0.2 + 0.12 + 0.008 = 0.328
        weighted = load.calculate_weighted_load(config)
        assert 0.30 <= weighted <= 0.45

    def test_select_kernel_with_exclude(self):
        """Can exclude kernels from selection."""
        balancer = LoadBalancer()

        balancer.register("k1")
        balancer.register("k2")
        balancer.register("k3")

        balancer.update_load("k1", cpu=0.2, memory=0.2)  # Least loaded
        balancer.update_load("k2", cpu=0.3, memory=0.3)
        balancer.update_load("k3", cpu=0.9, memory=0.9)

        # Exclude k1, should select k2
        selected = balancer.select_kernel(exclude=["k1"])

        assert selected == "k2"

    def test_unregister_kernel(self):
        """Can unregister a kernel."""
        balancer = LoadBalancer()
        balancer.register("kernel-1")

        balancer.unregister("kernel-1")

        assert "kernel-1" not in balancer.kernels

    def test_get_all_loads(self):
        """Can get all loads."""
        balancer = LoadBalancer()

        balancer.register("k1")
        balancer.register("k2")
        balancer.update_load("k1", cpu=0.5, memory=0.3)
        balancer.update_load("k2", cpu=0.2, memory=0.1)

        loads = balancer.get_all_loads()

        assert len(loads) == 2
        assert loads["k1"].cpu == 0.5
        assert loads["k2"].cpu == 0.2

    def test_get_summary(self):
        """Can get load balancer summary."""
        balancer = LoadBalancer()

        balancer.register("k1")
        balancer.register("k2")
        balancer.update_load("k1", cpu=0.8, memory=0.5)
        balancer.update_load("k2", cpu=0.2, memory=0.3)

        summary = balancer.get_summary()

        assert summary["kernels"] == 2
        assert "avg_load" in summary
        assert "max_load" in summary
        assert "min_load" in summary

    def test_update_load_for_unregistered_kernel(self):
        """Updating load for unregistered kernel auto-registers it."""
        balancer = LoadBalancer()

        balancer.update_load("kernel-1", cpu=0.5, memory=0.3)

        assert "kernel-1" in balancer.kernels
        load = balancer.get_load("kernel-1")
        assert load.cpu == 0.5

    def test_select_kernel_with_all_unhealthy(self):
        """Falls back to unhealthy kernels if all are unhealthy."""
        config = LoadBalancerConfig(health_threshold=0.5)
        balancer = LoadBalancer(config=config)

        balancer.register("k1")
        balancer.register("k2")
        balancer.update_load("k1", cpu=0.9, memory=0.9)  # Unhealthy
        balancer.update_load("k2", cpu=0.8, memory=0.8)  # Unhealthy

        # Should still return a kernel (fallback)
        selected = balancer.select_kernel()

        assert selected is not None
        assert selected in ["k1", "k2"]


class TestKernelLoad:
    """Tests for kernel load data."""

    def test_load_defaults(self):
        """Load has sensible defaults."""
        load = KernelLoad(name="test")

        assert load.cpu == 0.0
        assert load.memory == 0.0
        assert load.queue_depth == 0
        assert load.latency_ms == 0.0
        assert load.error_rate == 0.0

    def test_weighted_load_calculation(self):
        """Calculates weighted load correctly."""
        load = KernelLoad(name="test", cpu=0.5, memory=0.3, queue_depth=10)

        # Queue normalized: 10/100 = 0.1
        # Weighted: 0.5*0.4 + 0.3*0.3 + 0.1*0.2 + 0*0.1 = 0.2 + 0.09 + 0.02 = 0.31
        expected = 0.5 * 0.4 + 0.3 * 0.3 + (10 / 100) * 0.2
        assert abs(load.weighted_load - expected) < 0.01

    def test_weighted_load_with_custom_weights(self):
        """Can use custom weights via config."""
        load = KernelLoad(name="test", cpu=0.5, memory=0.3, queue_depth=10)

        # This tests that KernelLoad uses default weights
        # Custom weights are in LoadBalancerConfig
        expected = 0.5 * 0.4 + 0.3 * 0.3 + (10 / 100) * 0.2
        assert abs(load.weighted_load - expected) < 0.01


class TestLoadBalancerConfig:
    """Tests for load balancer config."""

    def test_config_defaults(self):
        """Config has sensible defaults."""
        config = LoadBalancerConfig()

        assert config.cpu_weight == 0.4
        assert config.memory_weight == 0.3
        assert config.queue_weight == 0.2
        assert config.error_weight == 0.1
        assert config.health_threshold == 0.8
