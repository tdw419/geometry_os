"""
Evolution Daemon V8 - With Vibe Coding Support.

Integrates VibeAgentOrchestrator for WorldView-style parallel evolution
where multiple specialized agents work simultaneously on different tracks.

This is a lightweight evolution daemon focused on vibe coding orchestration.
"""

import asyncio
from typing import List, Dict, Any, Optional
from datetime import datetime
from dataclasses import dataclass, field

from systems.evolution_daemon.vibe_orchestrator import (
    VibeAgentOrchestrator,
    AgentTrack,
    VibeSession,
)


@dataclass
class EvolutionConfig:
    """Configuration for evolution daemon."""
    default_tracks: List[AgentTrack] = field(default_factory=lambda: [
        AgentTrack.LOGIC,
        AgentTrack.PERFORMANCE,
    ])
    session_timeout: float = 300.0  # 5 minutes default
    max_concurrent_sessions: int = 3


class EvolutionDaemonV8:
    """
    Evolution daemon with vibe coding support.

    This daemon integrates the VibeAgentOrchestrator to enable WorldView-style
    evolution where multiple AI agents work in parallel on different technical
    domains (shaders, logic, performance, data, UI).

    Usage:
        daemon = EvolutionDaemonV8()

        # Simple evolution with default tracks
        results = await daemon.evolve_with_vibe("Optimize rendering pipeline")

        # Custom tracks for specific needs
        results = await daemon.evolve_with_vibe(
            goal="Implement thermal visualization",
            tracks=[AgentTrack.SHADER, AgentTrack.PERFORMANCE]
        )

        # Check active sessions
        sessions = daemon.get_vibe_sessions()
    """

    def __init__(self, config: Optional[EvolutionConfig] = None):
        """
        Initialize the evolution daemon.

        Args:
            config: Optional configuration. Uses defaults if not provided.
        """
        self.config = config or EvolutionConfig()
        self.vibe_orchestrator = VibeAgentOrchestrator()
        self._evolution_history: List[Dict[str, Any]] = []

    async def evolve_with_vibe(
        self,
        goal: str,
        tracks: Optional[List[AgentTrack]] = None,
    ) -> Dict[str, Any]:
        """
        Perform evolution using parallel vibe coding agents.

        This is the WorldView-style evolution where multiple agents
        work simultaneously on different aspects of the codebase.

        Args:
            goal: The high-level goal for this evolution session
            tracks: Which agent tracks to activate (default: Logic + Performance)

        Returns:
            Aggregated results from all agents with structure:
            {
                "session_id": str,
                "goal": str,
                "status": str,
                "results": Dict[str, Any],  # Per-track results
                "started_at": str,
                "completed_at": str,
            }
        """
        if tracks is None:
            tracks = self.config.default_tracks

        started_at = datetime.now().isoformat()

        session = await self.vibe_orchestrator.start_session(
            goal=goal,
            tracks=tracks,
        )

        results = await self.vibe_orchestrator.wait_for_completion(
            session,
            timeout=self.config.session_timeout,
        )

        completed_at = datetime.now().isoformat()

        evolution_result = {
            "session_id": session.session_id,
            "goal": goal,
            "status": session.status,
            "results": results,
            "tracks": [t.value for t in tracks],
            "started_at": started_at,
            "completed_at": completed_at,
        }

        self._evolution_history.append(evolution_result)
        return evolution_result

    def get_vibe_sessions(self) -> List[Dict[str, Any]]:
        """
        Get all active vibe coding sessions.

        Returns:
            List of session dictionaries with metadata:
            [
                {
                    "session_id": str,
                    "goal": str,
                    "status": str,
                    "tracks": List[str],
                    "created_at": str,
                },
                ...
            ]
        """
        sessions = self.vibe_orchestrator.list_active_sessions()
        return [
            {
                "session_id": s.session_id,
                "goal": s.goal,
                "status": s.status,
                "tracks": [t.value for t in s.tracks],
                "created_at": s.created_at.isoformat(),
            }
            for s in sessions
        ]

    def get_evolution_history(self) -> List[Dict[str, Any]]:
        """
        Get history of all evolution sessions.

        Returns:
            List of completed evolution results.
        """
        return self._evolution_history.copy()

    def get_session(self, session_id: str) -> Optional[VibeSession]:
        """
        Get a specific session by ID.

        Args:
            session_id: The session identifier

        Returns:
            VibeSession if found, None otherwise
        """
        return self.vibe_orchestrator.get_session(session_id)

    async def evolve_shader(self, goal: str) -> Dict[str, Any]:
        """
        Convenience method for shader-focused evolution.

        Uses SHADER and PERFORMANCE tracks.

        Args:
            goal: Shader optimization goal

        Returns:
            Evolution results
        """
        return await self.evolve_with_vibe(
            goal=goal,
            tracks=[AgentTrack.SHADER, AgentTrack.PERFORMANCE],
        )

    async def evolve_data_pipeline(self, goal: str) -> Dict[str, Any]:
        """
        Convenience method for data pipeline evolution.

        Uses DATA and LOGIC tracks.

        Args:
            goal: Data pipeline goal

        Returns:
            Evolution results
        """
        return await self.evolve_with_vibe(
            goal=goal,
            tracks=[AgentTrack.DATA, AgentTrack.LOGIC],
        )

    async def evolve_full_stack(self, goal: str) -> Dict[str, Any]:
        """
        Convenience method for full-stack evolution.

        Uses all 5 tracks: SHADER, LOGIC, PERFORMANCE, DATA, UI.

        Args:
            goal: Full-stack evolution goal

        Returns:
            Evolution results
        """
        return await self.evolve_with_vibe(
            goal=goal,
            tracks=[
                AgentTrack.SHADER,
                AgentTrack.LOGIC,
                AgentTrack.PERFORMANCE,
                AgentTrack.DATA,
                AgentTrack.UI,
            ],
        )


# Convenience function for quick evolution
async def quick_evolve(goal: str, tracks: Optional[List[AgentTrack]] = None) -> Dict[str, Any]:
    """
    Quick evolution helper function.

    Creates a daemon and runs evolution in one call.

    Args:
        goal: Evolution goal
        tracks: Optional tracks (uses defaults if not provided)

    Returns:
        Evolution results
    """
    daemon = EvolutionDaemonV8()
    return await daemon.evolve_with_vibe(goal, tracks)
