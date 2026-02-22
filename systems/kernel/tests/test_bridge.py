"""
Unit tests for KernelBridge - Python Bridge Module for WebMCP integration.

Tests follow TDD approach: Define expected behavior first.
"""

import pytest
from unittest.mock import Mock, patch, MagicMock
import json

from systems.kernel.bridge import KernelBridge, BridgeConfig


class TestKernelBridge:
    """Test suite for KernelBridge class."""

    def test_bridge_initialization(self):
        """Test that KernelBridge initializes correctly with default config."""
        bridge = KernelBridge()

        assert bridge.config is not None
        assert isinstance(bridge.config, BridgeConfig)
        assert bridge.config.default_gpu_enabled is False
        assert bridge.config.auto_initialize is True

    def test_bridge_initialization_with_custom_config(self):
        """Test that KernelBridge accepts custom configuration."""
        config = BridgeConfig(
            default_gpu_enabled=True,
            auto_initialize=False
        )
        bridge = KernelBridge(config=config)

        assert bridge.config.default_gpu_enabled is True
        assert bridge.config.auto_initialize is False

    def test_list_kernels_empty(self):
        """Test list_kernels returns empty list when no kernels registered."""
        bridge = KernelBridge()
        result = bridge.list_kernels()

        assert isinstance(result, dict)
        assert "kernels" in result
        assert "active" in result
        assert result["kernels"] == []
        assert result["active"] is None
        assert result["count"] == 0

    def test_create_kernel(self):
        """Test create_kernel creates and registers a new kernel."""
        bridge = KernelBridge()

        # Mock the kernel factory and registry
        with patch('systems.kernel.bridge.KernelFactory') as mock_factory, \
             patch.object(bridge, '_registry') as mock_registry:

            mock_kernel = Mock()
            mock_kernel.state.name = "READY"
            mock_factory.create.return_value = mock_kernel
            mock_registry.register.return_value = True

            result = bridge.create_kernel(
                name="test_kernel",
                kernel_type="hybrid",
                gpu_enabled=True,
                version="1.0.0",
                tags=["test", "demo"],
                make_active=True
            )

            assert isinstance(result, dict)
            assert result["success"] is True
            assert result["name"] == "test_kernel"
            assert "message" in result

    def test_create_kernel_already_exists(self):
        """Test create_kernel fails if kernel name already exists."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.register.return_value = False

            result = bridge.create_kernel(
                name="existing_kernel",
                kernel_type="hybrid"
            )

            assert result["success"] is False
            assert "error" in result

    def test_list_kernels_after_create(self):
        """Test list_kernels returns registered kernels after creation."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.list_kernels.return_value = [
                {
                    "name": "kernel_a",
                    "type": "HYBRID",
                    "version": "1.0.0",
                    "status": "STANDBY",
                    "state": "READY",
                    "use_count": 0,
                    "error_count": 0,
                    "tags": []
                },
                {
                    "name": "kernel_b",
                    "type": "GPU_RESIDENT",
                    "version": "2.0.0",
                    "status": "ACTIVE",
                    "state": "READY",
                    "use_count": 5,
                    "error_count": 0,
                    "tags": ["gpu"]
                }
            ]
            mock_registry.get_active_name.return_value = "kernel_b"

            result = bridge.list_kernels()

            assert result["count"] == 2
            assert len(result["kernels"]) == 2
            assert result["active"] == "kernel_b"
            assert result["kernels"][0]["name"] == "kernel_a"
            assert result["kernels"][1]["name"] == "kernel_b"

    def test_swap_kernel(self):
        """Test swap_kernel hot-swaps to a different kernel."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.swap.return_value = True
            mock_registry.get_active_name.return_value = "new_kernel"

            result = bridge.swap_kernel("new_kernel")

            assert result["success"] is True
            assert result["active"] == "new_kernel"
            mock_registry.swap.assert_called_once_with("new_kernel")

    def test_swap_kernel_not_found(self):
        """Test swap_kernel fails when kernel not found."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.swap.return_value = False

            result = bridge.swap_kernel("nonexistent")

            assert result["success"] is False
            assert "error" in result

    def test_health_check(self):
        """Test health_check returns health status for a kernel."""
        bridge = KernelBridge()

        expected_health = {
            "state": "READY",
            "metrics": {
                "total_dispatches": 100,
                "success_rate": 0.99,
                "avg_latency_ns": 500,
                "cache_hit_rate": 0.85,
            },
            "config": {
                "kernel_type": "HYBRID",
                "gpu_enabled": True,
            },
            "registry_status": "ACTIVE",
            "use_count": 50,
            "error_count": 1,
            "age_seconds": 3600.0
        }

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.health_check.return_value = expected_health

            result = bridge.health_check("test_kernel")

            assert result["success"] is True
            assert "health" in result
            assert result["health"]["state"] == "READY"
            mock_registry.health_check.assert_called_once_with("test_kernel")

    def test_health_check_kernel_not_found(self):
        """Test health_check fails when kernel not found."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.health_check.return_value = {"error": "Kernel not found"}

            result = bridge.health_check("nonexistent")

            assert result["success"] is False
            assert "error" in result

    def test_get_metrics(self):
        """Test get_metrics returns performance metrics for a kernel."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_kernel = Mock()
            mock_metrics = Mock()
            mock_metrics.total_dispatches = 1000
            mock_metrics.successful_dispatches = 990
            mock_metrics.failed_dispatches = 10
            mock_metrics.avg_latency_ns = 250
            mock_metrics.success_rate = 0.99
            mock_metrics.cache_hit_rate = 0.80
            mock_kernel.get_metrics.return_value = mock_metrics
            mock_registry.get.return_value = mock_kernel

            result = bridge.get_metrics("test_kernel")

            assert result["success"] is True
            assert "metrics" in result
            assert result["metrics"]["total_dispatches"] == 1000

    def test_get_metrics_kernel_not_found(self):
        """Test get_metrics fails when kernel not found."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.get.return_value = None

            result = bridge.get_metrics("nonexistent")

            assert result["success"] is False
            assert "error" in result

    def test_dispatch_syscall(self):
        """Test dispatch_syscall sends syscall through active kernel."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_kernel = Mock()
            mock_result = Mock()
            mock_result.success = True
            mock_result.data = {"value": 42}
            mock_result.latency_ns = 100
            mock_result.path_taken = "1.0_FAST"
            mock_kernel.dispatch_syscall.return_value = mock_result
            mock_registry.get_active.return_value = mock_kernel

            result = bridge.dispatch_syscall(
                syscall="READ",
                args={"address": 0x1000},
                uid=1
            )

            assert result["success"] is True
            assert result["data"]["value"] == 42
            assert "latency_ns" in result
            assert result["path_taken"] == "1.0_FAST"

    def test_dispatch_syscall_no_active_kernel(self):
        """Test dispatch_syscall fails when no active kernel."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.get_active.return_value = None

            result = bridge.dispatch_syscall(
                syscall="READ",
                args={"address": 0x1000}
            )

            assert result["success"] is False
            assert "error" in result

    def test_unregister_kernel(self):
        """Test unregister_kernel removes kernel from registry."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.unregister.return_value = True

            result = bridge.unregister_kernel("test_kernel")

            assert result["success"] is True
            mock_registry.unregister.assert_called_once_with("test_kernel")

    def test_unregister_kernel_not_found(self):
        """Test unregister_kernel fails when kernel not found."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.unregister.return_value = False

            result = bridge.unregister_kernel("nonexistent")

            assert result["success"] is False
            assert "error" in result

    def test_rollback(self):
        """Test rollback reverts to previous kernel."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.rollback.return_value = True
            mock_registry.get_active_name.return_value = "previous_kernel"

            result = bridge.rollback()

            assert result["success"] is True
            assert result["active"] == "previous_kernel"
            mock_registry.rollback.assert_called_once()

    def test_rollback_no_history(self):
        """Test rollback fails when no swap history exists."""
        bridge = KernelBridge()

        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.rollback.return_value = False

            result = bridge.rollback()

            assert result["success"] is False
            assert "error" in result

    def test_json_serializable_results(self):
        """Test that all bridge methods return JSON-serializable results."""
        bridge = KernelBridge()

        # Test all methods return JSON-serializable dicts
        with patch.object(bridge, '_registry') as mock_registry:
            mock_registry.list_kernels.return_value = []
            mock_registry.get_active_name.return_value = None
            mock_registry.register.return_value = True
            mock_registry.swap.return_value = True
            mock_registry.health_check.return_value = {"state": "READY"}
            mock_registry.get.return_value = None
            mock_registry.get_active.return_value = None
            mock_registry.unregister.return_value = True
            mock_registry.rollback.return_value = True

            # All these should return JSON-serializable dicts
            results = [
                bridge.list_kernels(),
                bridge.create_kernel("test", "hybrid"),
                bridge.swap_kernel("test"),
                bridge.health_check("test"),
                bridge.get_metrics("test"),
                bridge.dispatch_syscall("READ", {}),
                bridge.unregister_kernel("test"),
                bridge.rollback(),
            ]

            for result in results:
                assert isinstance(result, dict), f"Result is not a dict: {result}"
                # This will raise if not serializable
                json.dumps(result)


class TestBridgeConfig:
    """Test suite for BridgeConfig dataclass."""

    def test_default_config(self):
        """Test BridgeConfig has sensible defaults."""
        config = BridgeConfig()

        assert config.default_gpu_enabled is False
        assert config.auto_initialize is True

    def test_custom_config(self):
        """Test BridgeConfig accepts custom values."""
        config = BridgeConfig(
            default_gpu_enabled=True,
            auto_initialize=False
        )

        assert config.default_gpu_enabled is True
        assert config.auto_initialize is False
