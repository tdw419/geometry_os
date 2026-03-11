"""
Evolution Daemon - Ambient Mode

V2.0 Ambient Narrative System for WordPress WebMCP integration.

When enabled, the daemon:
- Connects to WordPress via WebMCP
- Broadcasts heartbeat status to the narrative session
- Logs thoughts and steering actions to WordPress
"""

import asyncio
import logging
from typing import TYPE_CHECKING, Optional

if TYPE_CHECKING:
    from .webmcp_client import WebMCPClient

logger = logging.getLogger("evolution_daemon.ambient")

# V2.0 Ambient Narrative System - WordPress WebMCP
try:
    from systems.visual_shell.api.evolution_webmcp_bridge import (
        EvolutionWebMCPBridge,
        EvolutionWebMCPHook,
    )
    HAS_WEBMCP = True
except ImportError:
    HAS_WEBMCP = False
    EvolutionWebMCPBridge = None
    EvolutionWebMCPHook = None


class AmbientModeController:
    """
    Controller for Ambient Narrative Mode.

    Manages the connection between the Evolution Daemon and WordPress
    via WebMCP for narrative broadcasting.

    Attributes:
        enabled: Whether ambient mode is currently active
        state: Current ambient state (MONITORING, SUGGESTING, STEERING)
        wordpress_url: WordPress base URL
    """

    VALID_STATES = ("MONITORING", "SUGGESTING", "STEERING")

    def __init__(self, wordpress_url: str = "http://localhost:8080"):
        """
        Initialize the ambient mode controller.

        Args:
            wordpress_url: WordPress base URL for WebMCP
        """
        self.enabled = False
        self.state = "MONITORING"
        self.wordpress_url = wordpress_url
        self.webmcp_hook = None
        self._heartbeat_task: asyncio.Task | None = None

    def enable(self) -> bool:
        """
        Enable Ambient Narrative Mode.

        Returns:
            True if enabled successfully, False if WebMCP not available
        """
        if not HAS_WEBMCP:
            logger.warning("⚠️ WebMCP not available - ambient mode disabled")
            return False

        self.enabled = True

        # Initialize WebMCP hook
        bridge = EvolutionWebMCPBridge(wordpress_url=self.wordpress_url, enabled=True)
        self.webmcp_hook = EvolutionWebMCPHook(
            bridge=bridge,
            log_improvements=True,
            update_architecture=True,
            min_delta_threshold=0.01
        )

        logger.info(f"📖 Ambient Narrative Mode enabled (WordPress: {self.wordpress_url})")
        return True

    def disable(self) -> None:
        """Disable Ambient Narrative Mode."""
        self.enabled = False
        if self._heartbeat_task:
            self._heartbeat_task.cancel()
            self._heartbeat_task = None
        logger.info("📖 Ambient Narrative Mode disabled")

    async def set_state(self, new_state: str) -> bool:
        """
        Change the ambient state.

        Args:
            new_state: The new ambient state (MONITORING, SUGGESTING, STEERING)

        Returns:
            True if state changed, False if invalid state
        """
        if new_state not in self.VALID_STATES:
            logger.warning(f"Invalid ambient state: {new_state}")
            return False

        old_state = self.state
        self.state = new_state
        logger.info(f"📖 Ambient state: {old_state} → {new_state}")
        return True

    async def publish_thought(
        self,
        thought: str,
        webmcp: Optional['WebMCPClient'] = None,
        visual_connected: bool = False,
        new_state: str = None
    ) -> None:
        """
        Publish an AI thought to the narrative session.

        Args:
            thought: The thought text
            webmcp: WebMCPClient instance for broadcasting
            visual_connected: Whether visual interface is connected
            new_state: Optional state to transition to
        """
        if not self.enabled:
            return

        if new_state:
            await self.set_state(new_state)

        # Broadcast to visual bridge
        if visual_connected and webmcp:
            await webmcp._call("narrative_event", {
                "event_type": "thought",
                "thought": thought,
                "state": self.state
            })

        logger.info(f"💭 Published thought: {thought[:50]}...")

    async def send_heartbeat(
        self,
        webmcp: Optional['WebMCPClient'] = None,
        visual_connected: bool = False,
        evolution_count: int = 0
    ) -> None:
        """
        Send daemon status heartbeat to visual bridge.

        Args:
            webmcp: WebMCPClient instance for broadcasting
            visual_connected: Whether visual interface is connected
            evolution_count: Current evolution count
        """
        if not self.enabled:
            return

        if visual_connected and webmcp:
            await webmcp._call("daemon_heartbeat", {
                "state": self.state,
                "evolution_count": evolution_count,
                "visual_connected": visual_connected
            })

        logger.debug(f"💓 Ambient heartbeat: {self.state}")

    async def broadcast_state_change(
        self,
        webmcp: Optional['WebMCPClient'] = None,
        visual_connected: bool = False,
        evolution_count: int = 0
    ) -> None:
        """
        Broadcast a state change event to the visual bridge.

        Args:
            webmcp: WebMCPClient instance
            visual_connected: Whether visual interface is connected
            evolution_count: Current evolution count
        """
        if visual_connected and webmcp:
            await webmcp._call("narrative_event", {
                "event_type": "state_change",
                "old_state": self.state,
                "new_state": self.state,
                "evolution_count": evolution_count
            })
