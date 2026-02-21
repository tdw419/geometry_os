"""
Terminal Area Agent - Phase 20-25: Generative Evolution

An Area Agent that perceives terminal textures as cognitive artifacts
and proposes evolutionary improvements.

WordPress Integration:
- Semantic journaling of evolution events
- Visual sync via Visual Bridge (port 8768)
"""

import numpy as np
from dataclasses import dataclass
from typing import Dict, Any, Optional, Tuple
import logging

# Import analyzers
from evolution_daemon.terminal_texture_analyzer import TerminalTextureAnalyzer
from evolution_daemon.pattern_recognizer import PatternRecognizer

# Import semantic publisher for WordPress integration
try:
    from evolution_daemon.semantic_publisher import EvolutionJournaler
    SEMANTIC_PUBLISHING_ENABLED = True
except ImportError:
    SEMANTIC_PUBLISHING_ENABLED = False

logger = logging.getLogger(__name__)


@dataclass
class EvolutionProposal:
    """A proposed evolution for a terminal region."""
    agent_id: str
    operation: str
    region: Tuple[int, int, int, int]
    confidence: float
    rationale: str
    metadata: Dict[str, Any]


class TerminalAreaAgent:
    """
    Area Agent for terminal texture perception and evolution.

    Monitors a rectangular region of the infinite map,
    analyzes terminal content, and proposes generative improvements.
    """

    def __init__(
        self,
        agent_id: str,
        bounds: Tuple[int, int, int, int],  # x1, y1, x2, y2
        semantic_publishing: bool = True
    ):
        """
        Initialize the terminal area agent.

        Args:
            agent_id: Unique identifier for this agent
            bounds: Region bounds as (x1, y1, x2, y2)
            semantic_publishing: Enable WordPress semantic journaling
        """
        self.agent_id = agent_id
        self.bounds = bounds
        self.width = bounds[2] - bounds[0]
        self.height = bounds[3] - bounds[1]

        # Initialize analyzers
        self.texture_analyzer = TerminalTextureAnalyzer(
            cols=self.width,
            rows=self.height
        )
        self.pattern_recognizer = PatternRecognizer()

        # State tracking
        self.analysis_history: list = []
        self.evolution_count: int = 0

        # Semantic publisher for WordPress integration
        self.journaler = None
        if semantic_publishing and SEMANTIC_PUBLISHING_ENABLED:
            self.journaler = EvolutionJournaler(enabled=True)
            logger.info(f"Semantic publishing enabled for {agent_id}")

        logger.info(f"Initialized TerminalAreaAgent: {agent_id}, bounds={bounds}")

    def analyze(self, texture: np.ndarray) -> Dict[str, Any]:
        """
        Analyze the terminal texture region.

        Args:
            texture: Full texture array

        Returns:
            Analysis results
        """
        # Extract region
        x1, y1, x2, y2 = self.bounds
        region = texture[y1:y2, x1:x2]

        # Load into analyzer
        self.texture_analyzer.load_from_buffer(region)

        # Perform analysis
        analysis_result = self.texture_analyzer.analyze()

        # Detect patterns
        patterns = self.pattern_recognizer.detect_patterns(region)

        result = {
            'density': analysis_result.density,
            'entropy': analysis_result.entropy,
            'non_empty_cells': analysis_result.non_empty_cells,
            'patterns': [(p.type.name, p.confidence) for p in patterns],
            'region_bounds': self.bounds,
        }

        self.analysis_history.append(result)
        return result

    def propose_evolution(self, texture: np.ndarray) -> Optional[EvolutionProposal]:
        """
        Propose an evolutionary improvement based on analysis.

        Args:
            texture: Full texture array

        Returns:
            Evolution proposal or None
        """
        analysis = self.analyze(texture)

        # Journal analysis event to WordPress
        if self.journaler:
            self.journaler.log_analysis(self.agent_id, analysis)

        # Decision logic based on analysis
        operation = None
        rationale = ""

        if analysis['density'] < 0.1:
            # Very sparse region - might need consolidation
            operation = "consolidate"
            rationale = "Region has low density, consider consolidation"

        elif analysis['entropy'] > 5.0:
            # High entropy - might benefit from sharpening
            operation = "sharpen"
            rationale = "High entropy suggests need for determinism"

        elif analysis['density'] > 0.8:
            # Dense region - might have dead code
            operation = "erode"
            rationale = "Dense region may contain dead code"

        if operation:
            self.evolution_count += 1
            proposal = EvolutionProposal(
                agent_id=self.agent_id,
                operation=operation,
                region=self.bounds,
                confidence=min(0.9, 0.5 + len(self.analysis_history) * 0.05),
                rationale=rationale,
                metadata=analysis
            )

            # Journal proposal to WordPress
            if self.journaler:
                self.journaler.log_proposal(proposal)

            return proposal

        return None

    def apply_evolution(
        self,
        texture: np.ndarray,
        proposal: EvolutionProposal
    ) -> np.ndarray:
        """
        Apply an evolution proposal to the texture.

        Args:
            texture: Full texture array
            proposal: Evolution proposal to apply

        Returns:
            Modified texture
        """
        from evolution_daemon.morphological_ops import (
            erode_texture, sharpen_texture
        )

        x1, y1, x2, y2 = proposal.region
        region = texture[y1:y2, x1:x2].copy()

        if proposal.operation == "erode":
            region = erode_texture(region)
        elif proposal.operation == "sharpen":
            region = sharpen_texture(region)
        elif proposal.operation == "consolidate":
            # Simple consolidation: fill gaps
            # (placeholder for more sophisticated logic)
            pass

        # Write back to texture
        texture[y1:y2, x1:x2] = region
        return texture
