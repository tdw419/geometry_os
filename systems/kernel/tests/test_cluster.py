# systems/kernel/tests/test_cluster.py
import pytest
from systems.kernel.cluster import (
    KernelCluster,
    ClusterConfig,
    ClusterStatus
)


class TestKernelCluster:
    """Tests for kernel clusters."""

    def test_cluster_creation(self):
        """Can create a kernel cluster."""
        cluster = KernelCluster(name="main")

        assert cluster.name == "main"
        assert cluster.status == ClusterStatus.INITIALIZING

    def test_cluster_add_kernel(self):
        """Can add kernels to cluster."""
        from systems.kernel import HybridKernel, KernelConfig

        cluster = KernelCluster(name="test")
        kernel = HybridKernel(config=KernelConfig(gpu_enabled=False))

        cluster.add_kernel("worker-1", kernel)

        assert cluster.kernel_count == 1

    def test_cluster_start_stop(self):
        """Can start and stop cluster."""
        from systems.kernel import HybridKernel, KernelConfig

        cluster = KernelCluster(name="test")
        cluster.add_kernel("w1", HybridKernel(config=KernelConfig(gpu_enabled=False)))

        cluster.start()
        assert cluster.status == ClusterStatus.RUNNING

        cluster.stop()
        assert cluster.status == ClusterStatus.STOPPED

    def test_cluster_config(self):
        """Cluster accepts configuration."""
        config = ClusterConfig(
            min_kernels=2,
            max_kernels=10,
            auto_scale=True
        )
        cluster = KernelCluster(name="auto", config=config)

        assert cluster.config.auto_scale is True
        assert cluster.config.min_kernels == 2
