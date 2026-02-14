# systems/pixel_compiler/tests/test_swarm_manager.py
"""Tests for SwarmManager - parallel WASM agent execution."""

import pytest
import numpy as np


class TestSwarmManagerInit:
    """Test SwarmManager initialization."""

    def test_import_swarm_manager(self):
        """SwarmManager can be imported."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        assert SwarmManager is not None

    def test_swarm_manager_instantiation(self):
        """SwarmManager can be instantiated."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        manager = SwarmManager()
        assert manager is not None

    def test_swarm_manager_constants(self):
        """SwarmManager has correct constants."""
        from systems.pixel_compiler.swarm_manager import SwarmManager
        assert SwarmManager.MAX_AGENTS == 1024
        assert SwarmManager.AGENT_MEMORY_SIZE == 64 * 1024  # 64KB
        assert SwarmManager.GLOBALS_PER_AGENT == 16
