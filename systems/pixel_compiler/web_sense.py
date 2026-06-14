"""
WebSense - An agent that provides a gateway to the World Wide Web.
"""

import logging
from typing import Any

import requests
from systems.visual_shell.swarm.worker_agent import WorkerAgent

logger = logging.getLogger(__name__)

class WebSense(WorkerAgent):
    """
    An agent that allows other agents to fetch content from the web.
    """

    AGENT_CAPABILITIES = [
        "sense",
        "web_fetch"
    ]

    def __init__(self, agent_id: str, a2a_url: str = "ws://localhost:8766"):
        """
        Initialize the WebSense agent.

        Args:
            agent_id: Unique identifier for this agent.
            a2a_url: WebSocket URL for A2A communication.
        """
        super().__init__(agent_id=agent_id, a2a_url=a2a_url)
        self.capabilities = list(self.AGENT_CAPABILITIES)
        self.logger.info(f"WebSense {self.agent_id} online.")

    async def handle_message(self, msg: dict[str, Any]) -> dict[str, Any] | None:
        """Handle incoming A2A messages."""
        msg_type = msg.get("type")

        if msg_type == "fetch_url":
            return self._handle_fetch_url(msg)

        return await super().handle_message(msg)

    def _handle_fetch_url(self, msg: dict[str, Any]) -> dict[str, Any]:
        """Handle a request to fetch a URL."""
        url = msg.get("url")
        if not url:
            return {"type": "error", "message": "Missing 'url' for fetch_url."}

        try:
            response = requests.get(url, timeout=10)
            response.raise_for_status() # Raise an exception for bad status codes
            
            # For now, we only handle text content
            if "text" in response.headers.get("Content-Type", ""):
                return {"type": "web_content", "url": url, "content": response.text}
            else:
                return {"type": "error", "message": f"Unsupported content type: {response.headers.get('Content-Type')}"}

        except requests.exceptions.RequestException as e:
            return {"type": "error", "message": str(e)}
