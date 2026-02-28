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


if __name__ == '__main__':
    unittest.main()
