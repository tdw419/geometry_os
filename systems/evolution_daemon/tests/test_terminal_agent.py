"""
Tests for TerminalAreaAgent - Phase 20-25: Generative Evolution
"""

import pytest
import numpy as np
import sys
from pathlib import Path

# Add paths for imports
sys.path.insert(0, str(Path(__file__).parent.parent.parent))

from evolution_daemon.area_agents.terminal_agent import (
    TerminalAreaAgent, EvolutionProposal
)


class TestTerminalAreaAgent:
    def test_agent_initialization(self):
        """Agent should initialize with bounds."""
        agent = TerminalAreaAgent(
            agent_id="test-terminal-1",
            bounds=(0, 0, 80, 24)
        )
        assert agent.agent_id == "test-terminal-1"
        assert agent.bounds == (0, 0, 80, 24)
        assert agent.width == 80
        assert agent.height == 24

    def test_agent_analyze_region(self):
        """Agent should analyze terminal region."""
        agent = TerminalAreaAgent(
            agent_id="test-1",
            bounds=(0, 0, 8, 8)
        )

        # Mock texture
        texture = np.zeros((16, 16, 4), dtype=np.uint8)
        texture[0, 0] = [ord('$'), 7, 0, 0]

        analysis = agent.analyze(texture)

        assert analysis is not None
        assert 'density' in analysis
        assert 'entropy' in analysis
        assert 'non_empty_cells' in analysis

    def test_agent_propose_evolution(self):
        """Agent should propose evolution based on analysis."""
        agent = TerminalAreaAgent(
            agent_id="test-1",
            bounds=(0, 0, 8, 8)
        )

        texture = np.zeros((16, 16, 4), dtype=np.uint8)

        proposal = agent.propose_evolution(texture)

        assert proposal is not None
        assert hasattr(proposal, 'operation')
        assert proposal.agent_id == "test-1"

    def test_agent_propose_consolidate_for_sparse(self):
        """Agent should propose consolidation for sparse regions."""
        agent = TerminalAreaAgent(
            agent_id="test-sparse",
            bounds=(0, 0, 8, 8)
        )

        # Very sparse texture
        texture = np.zeros((16, 16, 4), dtype=np.uint8)
        texture[0, 0] = [ord('A'), 7, 0, 0]  # Only one cell

        proposal = agent.propose_evolution(texture)

        assert proposal is not None
        assert proposal.operation == "consolidate"

    def test_agent_apply_evolution(self):
        """Agent should apply evolution to texture."""
        agent = TerminalAreaAgent(
            agent_id="test-apply",
            bounds=(0, 0, 8, 8)
        )

        texture = np.zeros((16, 16, 4), dtype=np.uint8)
        texture[2:6, 2:6] = [65, 10, 0, 1]  # Square region

        proposal = EvolutionProposal(
            agent_id="test-apply",
            operation="erode",
            region=(0, 0, 8, 8),
            confidence=0.8,
            rationale="Test erosion",
            metadata={}
        )

        evolved = agent.apply_evolution(texture, proposal)

        assert evolved is not None
        assert evolved.shape == texture.shape
