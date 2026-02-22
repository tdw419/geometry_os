"""
Perception Bridge Tests

Tests the integration between NeuralPerceptionKernel and Evolution Daemon.
"""

import pytest
import asyncio
import numpy as np
from unittest.mock import Mock, AsyncMock, patch


class TestPerceptionBridge:
    """Test suite for perception-daemon integration."""

    @pytest.fixture
    def bridge(self):
        """Create a PerceptionBridge instance."""
        from systems.evolution_daemon.perception.perception_bridge import PerceptionBridge
        return PerceptionBridge()

    @pytest.fixture
    def sample_rts_data(self):
        """Create sample RTS data for testing."""
        # 64x64 RGBA image data
        data = np.random.randint(0, 256, (64, 64, 4), dtype=np.uint8)
        return data.tobytes()

    @pytest.mark.asyncio
    async def test_initialization(self, bridge):
        """Test PerceptionBridge initialization."""
        assert bridge.kernel is not None
        assert bridge.config is not None
        assert bridge.kernel.patch_size == 16

    @pytest.mark.asyncio
    async def test_analyze_region(self, bridge, sample_rts_data):
        """Test region analysis."""
        result = await bridge.analyze_region(sample_rts_data, width=64, height=64)

        # PerceptionResult is a dataclass with direct attributes
        assert result.total_patches > 0
        assert hasattr(result, 'hotspots')

    @pytest.mark.asyncio
    async def test_fracture_detection(self, bridge):
        """Test fracture detection in corrupted data."""
        # All zeros = fracture
        fracture_data = np.zeros((64, 64, 4), dtype=np.uint8).tobytes()

        result = await bridge.analyze_region(fracture_data, width=64, height=64)

        # Should detect fractures
        assert result.fracture_patches > 0
        assert len(result.hotspots) > 0

    @pytest.mark.asyncio
    async def test_evolution_daemon_callback(self, bridge, sample_rts_data):
        """Test callback to Evolution Daemon."""
        callback_called = False
        received_result = None

        async def mock_callback(result):
            nonlocal callback_called, received_result
            callback_called = True
            received_result = result

        bridge.set_evolution_callback(mock_callback)

        # Create data with fractures to trigger callback
        fracture_data = np.zeros((64, 64, 4), dtype=np.uint8).tobytes()

        await bridge.analyze_and_report(fracture_data, width=64, height=64)

        assert callback_called
        assert received_result is not None
        assert received_result['type'] == 'fracture_detected'
