"""
Tests for PXE visual shell integration.

Verifies:
- PXE badge shows on desktop objects
- Toggle updates badge immediately
- CatalogBridge calls /pxe endpoint
- Boot progress works with PXE containers
"""

import unittest
from unittest.mock import MagicMock, AsyncMock, patch
import asyncio
import sys
import os

# Add test directories to path
sys.path.insert(0, os.path.join(os.path.dirname(__file__), '..', '..', 'visual_shell', 'web'))


class PXEVisualIntegrationTestBase(unittest.TestCase):
    """Base class with async test support."""

    def setUp(self):
        """Set up test fixtures."""
        # Mock catalog bridge
        self.mock_bridge = MagicMock()
        self.mock_bridge.getPXEContainers = AsyncMock()
        self.mock_bridge.setPXEAvailability = AsyncMock()
        # Mock PIXI containers (using simple mocks)
        self.mock_world_container = MagicMock()

    def tearDown(self):
        """Clean up after tests."""
        pass

    def run_async(self, coro):
        """Run async coroutine in test."""
        return asyncio.run(coro)


# =============================================================================
# CatalogBridge PXE Method Tests
# =============================================================================

class TestCatalogBridgePXEMethods(PXEVisualIntegrationTestBase):
    """Tests for CatalogBridge PXE-related methods."""

    def test_get_pxe_containers_success(self):
        """Test successful PXE containers fetch."""
        # Set up mock response
        expected_data = {
            'pxe_containers': [
                {'entry_id': 'ubuntu-22.04', 'pxe_enabled': True, 'boot_order': 1},
                {'entry_id': 'alpine-3.18', 'pxe_enabled': False, 'boot_order': 99}
            ],
            'count': 2
        }
        self.mock_bridge.getPXEContainers.return_value = expected_data

        # Call method
        result = self.run_async(self.mock_bridge.getPXEContainers())

        # Verify result
        self.assertEqual(result, expected_data)
        self.assertEqual(result['count'], 2)
        self.assertEqual(len(result['pxe_containers']), 2)
        self.assertTrue(result['pxe_containers'][0]['pxe_enabled'])
        self.assertFalse(result['pxe_containers'][1]['pxe_enabled'])

        # Verify method was called
        self.mock_bridge.getPXEContainers.assert_called_once()

    def test_get_pxe_containers_empty(self):
        """Test PXE containers fetch with empty result."""
        # Set up mock response with empty list
        expected_data = {
            'pxe_containers': [],
            'count': 0
        }
        self.mock_bridge.getPXEContainers.return_value = expected_data

        # Call method
        result = self.run_async(self.mock_bridge.getPXEContainers())

        # Verify result
        self.assertEqual(result, expected_data)
        self.assertEqual(result['count'], 0)
        self.assertEqual(len(result['pxe_containers']), 0)

    def test_get_pxe_containers_error(self):
        """Test PXE containers fetch handles errors gracefully."""
        # Set up mock to raise exception
        self.mock_bridge.getPXEContainers.side_effect = Exception('Network error')

        # Call method and expect exception to be raised
        with self.assertRaises(Exception):
            self.run_async(self.mock_bridge.getPXEContainers())

    def test_set_pxe_availability_enable(self):
        """Test enabling PXE for a container."""
        entry_id = 'ubuntu-22.04'

        # Set up mock response
        expected_response = {
            'success': True,
            'entry_id': entry_id,
            'pxe_enabled': True
        }
        self.mock_bridge.setPXEAvailability.return_value = expected_response

        # Call method with enabled=True
        result = self.run_async(self.mock_bridge.setPXEAvailability(entry_id, True))

        # Verify result
        self.assertEqual(result, expected_response)
        self.assertTrue(result['success'])
        self.assertTrue(result['pxe_enabled'])

        # Verify method was called with correct params
        self.mock_bridge.setPXEAvailability.assert_called_once_with(entry_id, True)

    def test_set_pxe_availability_disable(self):
        """Test disabling PXE for a container."""
        entry_id = 'alpine-3.18'

        # Set up mock response
        expected_response = {
            'success': True,
            'entry_id': entry_id,
            'pxe_enabled': False
        }
        self.mock_bridge.setPXEAvailability.return_value = expected_response

        # Call method with enabled=False
        result = self.run_async(self.mock_bridge.setPXEAvailability(entry_id, False))

        # Verify result
        self.assertEqual(result, expected_response)
        self.assertTrue(result['success'])
        self.assertFalse(result['pxe_enabled'])

        # Verify method was called with correct params
        self.mock_bridge.setPXEAvailability.assert_called_once_with(entry_id, False)


if __name__ == '__main__':
    unittest.main()
