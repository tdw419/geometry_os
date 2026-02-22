# systems/kernel/tests/test_orchestration_integration.py
import pytest
from systems.kernel.orchestration_tools import (
    OrchestrationTools,
    orchestration_list_clusters,
    orchestration_get_metrics
)


class TestOrchestrationIntegration:
    """Tests for orchestration integration."""

    def test_tools_creation(self):
        """Can create orchestration tools."""
        tools = OrchestrationTools()

        assert tools is not None

    @pytest.mark.asyncio
    async def test_create_cluster(self):
        """Can create cluster via tools."""
        tools = OrchestrationTools()

        result = await tools.create_cluster(
            name="test-cluster",
            kernel_count=2
        )

        assert result["success"] is True
        assert "test-cluster" in result["cluster_name"]

    @pytest.mark.asyncio
    async def test_list_clusters(self):
        """Can list clusters."""
        tools = OrchestrationTools()

        await tools.create_cluster("c1", kernel_count=1)
        await tools.create_cluster("c2", kernel_count=1)

        result = await tools.list_clusters()

        assert len(result["clusters"]) == 2

    @pytest.mark.asyncio
    async def test_dispatch_to_cluster(self):
        """Can dispatch to cluster."""
        tools = OrchestrationTools()

        await tools.create_cluster("compute", kernel_count=1)

        result = await tools.dispatch(
            cluster="compute",
            request={"type": "ping"}
        )

        assert result["success"] is True

    @pytest.mark.asyncio
    async def test_destroy_cluster(self):
        """Can destroy cluster."""
        tools = OrchestrationTools()

        await tools.create_cluster("temp", kernel_count=1)
        result = await tools.destroy_cluster("temp")

        assert result["success"] is True

    @pytest.mark.asyncio
    async def test_get_metrics(self):
        """Can get cluster metrics."""
        tools = OrchestrationTools()

        await tools.create_cluster("metrics-test", kernel_count=2)
        result = await tools.get_metrics("metrics-test")

        assert result["success"] is True
        assert "metrics" in result

    @pytest.mark.asyncio
    async def test_scale_cluster(self):
        """Can scale cluster."""
        tools = OrchestrationTools()

        await tools.create_cluster("scale-test", kernel_count=1)
        result = await tools.scale_cluster("scale-test", target_count=3)

        assert result["success"] is True
        assert result["new_count"] == 3

    def test_list_clusters_function(self):
        """orchestration_list_clusters is callable."""
        assert callable(orchestration_list_clusters)

    def test_get_metrics_function(self):
        """orchestration_get_metrics is callable."""
        assert callable(orchestration_get_metrics)
