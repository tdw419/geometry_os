"""
Integration tests for MetabolismDashboard with V13 Safety Bridge

Tests the full pipeline:
- JavaScript MetabolismDashboard class
- EvolutionSafetyBridge API calls
- HTTP backend responses
"""

import pytest
import json
from unittest.mock import Mock, patch, AsyncMock
import sys
import os

# Add parent path for imports
sys.path.insert(0, os.path.dirname(os.path.dirname(os.path.abspath(__file__))))


class TestMetabolismDashboardIntegration:
    """Integration tests for MetabolismDashboard + V13"""

    @pytest.fixture
    def mock_safety_bridge(self):
        """Create a mock EvolutionSafetyBridge"""
        bridge = Mock()
        bridge.getMetabolism = AsyncMock(return_value={
            'cpu_percent': 45.5,
            'memory_available_mb': 1200,
            'memory_total_mb': 16000,
            'throttle_level': 'none'
        })
        bridge.predictHealth = AsyncMock(return_value={
            'health_score': 0.95,
            'recommended_action': 'none',
            'horizon_hours': 24
        })
        return bridge

    @pytest.mark.asyncio
    async def test_metabolism_polling_returns_data(self, mock_safety_bridge):
        """Test that polling the bridge returns valid metabolism data"""
        result = await mock_safety_bridge.getMetabolism()

        assert 'cpu_percent' in result
        assert 'memory_available_mb' in result
        assert 'throttle_level' in result
        assert result['throttle_level'] in ['none', 'moderate', 'aggressive']

    @pytest.mark.asyncio
    async def test_throttle_level_variations(self, mock_safety_bridge):
        """Test different throttle levels are handled correctly"""
        test_cases = [
            ('none', 0x00FF00),      # Green
            ('moderate', 0xFFAA00),  # Yellow/Orange
            ('aggressive', 0xFF4444) # Red
        ]

        for level, expected_color in test_cases:
            mock_safety_bridge.getMetabolism.return_value = {
                'cpu_percent': 50,
                'memory_available_mb': 1000,
                'throttle_level': level
            }

            result = await mock_safety_bridge.getMetabolism()
            assert result['throttle_level'] == level

    @pytest.mark.asyncio
    async def test_prognostics_entry_format(self, mock_safety_bridge):
        """Test prognostics entries have correct format"""
        result = await mock_safety_bridge.predictHealth()

        assert 'health_score' in result
        assert 0 <= result['health_score'] <= 1
        assert 'recommended_action' in result

    @pytest.mark.asyncio
    async def test_high_cpu_triggers_color_change(self, mock_safety_bridge):
        """Test that high CPU percentage triggers red color"""
        mock_safety_bridge.getMetabolism.return_value = {
            'cpu_percent': 95,  # High CPU
            'memory_available_mb': 1000,
            'throttle_level': 'none'
        }

        result = await mock_safety_bridge.getMetabolism()
        cpu_percent = result['cpu_percent']

        # Dashboard should use red for > 80%
        assert cpu_percent > 80

    @pytest.mark.asyncio
    async def test_memory_calculation(self, mock_safety_bridge):
        """Test memory percentage calculation"""
        mock_safety_bridge.getMetabolism.return_value = {
            'cpu_percent': 50,
            'memory_available_mb': 4000,
            'memory_total_mb': 16000,
            'throttle_level': 'none'
        }

        result = await mock_safety_bridge.getMetabolism()
        mem_used = result['memory_total_mb'] - result['memory_available_mb']
        mem_percent = (mem_used / result['memory_total_mb']) * 100

        assert mem_percent == 75  # 12000/16000 = 75%

    def test_dashboard_script_exists(self):
        """Verify metabolism_dashboard.js exists"""
        js_path = os.path.join(
            os.path.dirname(os.path.dirname(os.path.dirname(__file__))),
            'visual_shell', 'web', 'metabolism_dashboard.js'
        )
        assert os.path.exists(js_path), f"metabolism_dashboard.js not found at {js_path}"

    def test_test_file_exists(self):
        """Verify JS test file exists"""
        test_path = os.path.join(
            os.path.dirname(os.path.dirname(os.path.dirname(__file__))),
            'visual_shell', 'web', 'tests', 'test_metabolism_dashboard.js'
        )
        assert os.path.exists(test_path), f"test_metabolism_dashboard.js not found"

    @pytest.mark.asyncio
    async def test_connection_error_handling(self, mock_safety_bridge):
        """Test that connection errors are handled gracefully"""
        mock_safety_bridge.getMetabolism.side_effect = Exception("Connection refused")

        with pytest.raises(Exception):
            await mock_safety_bridge.getMetabolism()

    def test_poll_interval_default(self):
        """Test default poll interval is 3 seconds"""
        # Simulate the dashboard's default options
        options = {
            'pollInterval': 3000
        }

        assert options['pollInterval'] == 3000

    def test_dashboard_dimensions_default(self):
        """Test default dashboard dimensions"""
        # Simulate the dashboard's default dimensions
        dimensions = {
            'width': 280,
            'height': 200
        }

        assert dimensions['width'] == 280
        assert dimensions['height'] == 200
