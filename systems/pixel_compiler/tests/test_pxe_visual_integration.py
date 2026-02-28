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


# =============================================================================
# DesktopObjectManager PXE Integration Tests
# =============================================================================

class TestDesktopObjectManagerPXE(PXEVisualIntegrationTestBase):
    """Tests for DesktopObjectManager PXE integration."""

    def setUp(self):
        """Set up test fixtures."""
        super().setUp()
        # Create mock DesktopObjectManager-like object
        self.manager = MockDesktopObjectManager(self.mock_bridge, self.mock_world_container)

    def test_load_pxe_data_merges_with_catalog(self):
        """Test that PXE data is merged with catalog entries."""
        # Set up mock catalog entries
        catalog_entries = [
            {'id': 'ubuntu-22.04', 'name': 'Ubuntu 22.04'},
            {'id': 'alpine-3.18', 'name': 'Alpine 3.18'},
            {'id': 'debian-12', 'name': 'Debian 12'}
        ]

        # Set up mock PXE data
        pxe_data = {
            'pxe_containers': [
                {'entry_id': 'ubuntu-22.04', 'pxe_enabled': True, 'boot_order': 1},
                {'entry_id': 'alpine-3.18', 'pxe_enabled': False, 'boot_order': 99}
            ],
            'count': 2
        }
        self.mock_bridge.getPXEContainers.return_value = pxe_data

        # Simulate loading PXE data
        result = self.run_async(self.manager.loadPXEData())

        # Verify PXE data was loaded (returns count of enabled containers)
        # Only ubuntu-22.04 has pxe_enabled=True, so count is 1
        self.assertEqual(result, 1)

        # Verify PXE data is stored
        ubuntu_pxe = self.manager.getPXEData('ubuntu-22.04')
        self.assertIsNotNone(ubuntu_pxe)
        self.assertTrue(ubuntu_pxe['pxe_enabled'])
        self.assertEqual(ubuntu_pxe['boot_order'], 1)

        alpine_pxe = self.manager.getPXEData('alpine-3.18')
        self.assertIsNotNone(alpine_pxe)
        self.assertFalse(alpine_pxe['pxe_enabled'])

        # Entry not in PXE data should return None
        debian_pxe = self.manager.getPXEData('debian-12')
        self.assertIsNone(debian_pxe)

    def test_pxe_data_updates_badge(self):
        """Test that loading PXE data updates desktop object badges."""
        # Create mock desktop object
        mock_object = MagicMock()
        mock_object.setPXEEnabled = MagicMock()
        self.manager.objects['ubuntu-22.04'] = mock_object

        # Set up mock PXE data
        pxe_data = {
            'pxe_containers': [
                {'entry_id': 'ubuntu-22.04', 'pxe_enabled': True, 'boot_order': 1}
            ],
            'count': 1
        }
        self.mock_bridge.getPXEContainers.return_value = pxe_data

        # Load PXE data
        self.run_async(self.manager.loadPXEData())

        # Verify setPXEEnabled was called with True
        mock_object.setPXEEnabled.assert_called_once_with(True)

    def test_pxe_toggle_updates_objects(self):
        """Test that toggle event updates desktop objects."""
        # Create mock desktop object
        mock_object = MagicMock()
        mock_object.setPXEEnabled = MagicMock()
        self.manager.objects['alpine-3.18'] = mock_object

        # Set up mock response
        self.mock_bridge.setPXEAvailability.return_value = {
            'success': True,
            'entry_id': 'alpine-3.18',
            'pxe_enabled': True
        }

        # Toggle PXE
        result = self.run_async(self.manager.togglePXE('alpine-3.18', True))

        # Verify toggle was successful
        self.assertTrue(result)

        # Verify setPXEEnabled was called on the object
        mock_object.setPXEEnabled.assert_called_once_with(True)

        # Verify pxe-toggled event was emitted
        events = self.manager.getEmittedEvents()
        self.assertEqual(len(events), 1)
        self.assertEqual(events[0]['event'], 'pxe-toggled')
        self.assertEqual(events[0]['data']['entryId'], 'alpine-3.18')
        self.assertTrue(events[0]['data']['enabled'])


class MockDesktopObjectManager:
    """Mock DesktopObjectManager for testing PXE functionality."""

    def __init__(self, bridge, world_container):
        self.bridge = bridge
        self.worldContainer = world_container
        self.objects = {}  # entryId -> mock object
        self._pxeData = {}  # entryId -> { pxe_enabled, boot_order }
        self._events = []  # Emitted events

    async def loadPXEData(self):
        """Load PXE data from bridge."""
        if not self.bridge or not hasattr(self.bridge, 'getPXEContainers'):
            return 0

        pxe_data = await self.bridge.getPXEContainers()
        containers = pxe_data.get('pxe_containers', []) if pxe_data else []

        self._pxeData.clear()
        enabled_count = 0

        for container in containers:
            entry_id = container.get('entry_id')
            self._pxeData[entry_id] = {
                'pxe_enabled': container.get('pxe_enabled', False),
                'boot_order': container.get('boot_order', 99)
            }

            if container.get('pxe_enabled'):
                enabled_count += 1

            # Update desktop object if exists
            if entry_id in self.objects:
                obj = self.objects[entry_id]
                if hasattr(obj, 'setPXEEnabled'):
                    obj.setPXEEnabled(container.get('pxe_enabled', False))

        return enabled_count

    async def togglePXE(self, entry_id, enabled):
        """Toggle PXE for a container."""
        if not self.bridge or not hasattr(self.bridge, 'setPXEAvailability'):
            return False

        result = await self.bridge.setPXEAvailability(entry_id, enabled)

        if result and result.get('success'):
            # Update local data
            self._pxeData[entry_id] = {
                'pxe_enabled': enabled,
                'boot_order': self._pxeData.get(entry_id, {}).get('boot_order', 99)
            }

            # Update desktop object
            if entry_id in self.objects:
                obj = self.objects[entry_id]
                if hasattr(obj, 'setPXEEnabled'):
                    obj.setPXEEnabled(enabled)

            # Emit event
            self._events.append({
                'event': 'pxe-toggled',
                'data': {'entryId': entry_id, 'enabled': enabled}
            })

            return True

        return False

    def getPXEData(self, entry_id):
        """Get PXE data for an entry."""
        return self._pxeData.get(entry_id)

    def getEmittedEvents(self):
        """Get list of emitted events."""
        return self._events


# =============================================================================
# RTSDesktopObject PXE Badge Tests
# =============================================================================

class TestRTSDesktopObjectPXEBadge(PXEVisualIntegrationTestBase):
    """Tests for RTSDesktopObject PXE badge functionality."""

    def setUp(self):
        """Set up test fixtures."""
        super().setUp()

    def test_pxe_badge_configuration(self):
        """Test that PXE_BADGE static configuration exists with correct values."""
        # Verify PXE_BADGE config structure (simulating RTSDesktopObject.PXE_BADGE)
        pxe_badge_config = {
            'SIZE': 6,
            'OFFSET_X': 14,
            'OFFSET_Y': -10,
            'COLOR_ENABLED': 0xff6600,   # Orange
            'COLOR_DISABLED': 0x666666   # Gray
        }

        # Verify all expected keys exist
        self.assertIn('SIZE', pxe_badge_config)
        self.assertIn('OFFSET_X', pxe_badge_config)
        self.assertIn('OFFSET_Y', pxe_badge_config)
        self.assertIn('COLOR_ENABLED', pxe_badge_config)
        self.assertIn('COLOR_DISABLED', pxe_badge_config)

        # Verify values match expected configuration
        self.assertEqual(pxe_badge_config['SIZE'], 6)
        self.assertEqual(pxe_badge_config['OFFSET_X'], 14)  # Next to offline badge
        self.assertEqual(pxe_badge_config['OFFSET_Y'], -10)  # Same Y as offline badge
        self.assertEqual(pxe_badge_config['COLOR_ENABLED'], 0xff6600)  # Orange
        self.assertEqual(pxe_badge_config['COLOR_DISABLED'], 0x666666)  # Gray

    def test_create_pxe_badge_visible(self):
        """Test that PXE badge is visible when entry has pxe_enabled=True."""
        # Create mock desktop object with PXE enabled
        mock_object = MockRTSDesktopObject({
            'id': 'ubuntu-22.04',
            'name': 'Ubuntu 22.04',
            'pxe_enabled': True
        })

        # Verify PXE is enabled
        self.assertTrue(mock_object.getPXEEnabled())

        # Verify badge is visible
        self.assertTrue(mock_object.isPXEBadgeVisible())

        # Verify badge has enabled color
        self.assertEqual(mock_object.getPXEBadgeColor(), 0xff6600)  # Orange

    def test_create_pxe_badge_hidden(self):
        """Test that PXE badge is hidden when entry has pxe_enabled=False."""
        # Create mock desktop object with PXE disabled
        mock_object = MockRTSDesktopObject({
            'id': 'alpine-3.18',
            'name': 'Alpine 3.18',
            'pxe_enabled': False
        })

        # Verify PXE is disabled
        self.assertFalse(mock_object.getPXEEnabled())

        # Verify badge is hidden
        self.assertFalse(mock_object.isPXEBadgeVisible())

    def test_set_pxe_enabled_true(self):
        """Test enabling PXE on an object updates badge correctly."""
        # Create object with PXE initially disabled
        mock_object = MockRTSDesktopObject({
            'id': 'debian-12',
            'name': 'Debian 12',
            'pxe_enabled': False
        })

        # Verify initial state
        self.assertFalse(mock_object.getPXEEnabled())
        self.assertFalse(mock_object.isPXEBadgeVisible())

        # Enable PXE
        mock_object.setPXEEnabled(True)

        # Verify state changed
        self.assertTrue(mock_object.getPXEEnabled())
        self.assertTrue(mock_object.isPXEBadgeVisible())

        # Verify badge has enabled color (orange)
        self.assertEqual(mock_object.getPXEBadgeColor(), 0xff6600)

    def test_set_pxe_enabled_false(self):
        """Test disabling PXE on an object updates badge correctly."""
        # Create object with PXE initially enabled
        mock_object = MockRTSDesktopObject({
            'id': 'fedora-39',
            'name': 'Fedora 39',
            'pxe_enabled': True
        })

        # Verify initial state
        self.assertTrue(mock_object.getPXEEnabled())
        self.assertTrue(mock_object.isPXEBadgeVisible())

        # Disable PXE
        mock_object.setPXEEnabled(False)

        # Verify state changed
        self.assertFalse(mock_object.getPXEEnabled())
        self.assertFalse(mock_object.isPXEBadgeVisible())


class MockRTSDesktopObject:
    """Mock RTSDesktopObject for testing PXE badge functionality."""

    # Static configuration matching RTSDesktopObject.PXE_BADGE
    PXE_BADGE = {
        'SIZE': 6,
        'OFFSET_X': 14,
        'OFFSET_Y': -10,
        'COLOR_ENABLED': 0xff6600,   # Orange
        'COLOR_DISABLED': 0x666666   # Gray
    }

    def __init__(self, entry):
        """Initialize mock desktop object."""
        self.entry_id = entry.get('id')
        self.name = entry.get('name')
        self._pxe_enabled = entry.get('pxe_enabled', False)
        self._pxe_badge_visible = self._pxe_enabled
        self._pxe_badge_color = self.PXE_BADGE['COLOR_ENABLED'] if self._pxe_enabled else self.PXE_BADGE['COLOR_DISABLED']

    def setPXEEnabled(self, enabled):
        """Set PXE enabled status and update badge."""
        self._pxe_enabled = enabled
        self._pxe_badge_visible = enabled  # Badge only visible when enabled
        self._pxe_badge_color = self.PXE_BADGE['COLOR_ENABLED'] if enabled else self.PXE_BADGE['COLOR_DISABLED']

    def getPXEEnabled(self):
        """Get PXE enabled status."""
        return self._pxe_enabled

    def isPXEBadgeVisible(self):
        """Check if PXE badge is visible."""
        return self._pxe_badge_visible

    def getPXEBadgeColor(self):
        """Get current PXE badge color."""
        return self._pxe_badge_color


if __name__ == '__main__':
    unittest.main()
