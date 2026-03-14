"""
FilesystemSense - An agent providing a view into the local filesystem.
"""

import os
import logging
from typing import Any

from systems.visual_shell.swarm.worker_agent import WorkerAgent

logger = logging.getLogger(__name__)

class FilesystemSense(WorkerAgent):
    """
    An agent that provides other agents with a view into the local filesystem.
    """

    AGENT_CAPABILITIES = [
        "sense",
        "filesystem_read"
    ]

    def __init__(self, agent_id: str, a2a_url: str = "ws://localhost:8766", root_dir: str = "."):
        """
        Initialize the FilesystemSense agent.

        Args:
            agent_id: Unique identifier for this agent.
            a2a_url: WebSocket URL for A2A communication.
            root_dir: The root directory this agent is allowed to see.
        """
        super().__init__(agent_id=agent_id, a2a_url=a2a_url)
        self.capabilities = list(self.AGENT_CAPABILITIES)
        self.root_dir = os.path.abspath(root_dir)
        self.logger.info(f"FilesystemSense {self.agent_id} online, root: {self.root_dir}")

    async def handle_message(self, msg: dict[str, Any]) -> dict[str, Any] | None:
        """Handle incoming A2A messages."""
        msg_type = msg.get("type")

        if msg_type == "list_directory":
            return self._handle_list_directory(msg)
        elif msg_type == "read_file":
            return self._handle_read_file(msg)

        return await super().handle_message(msg)

    def _resolve_path(self, user_path: str) -> str | None:
        """Safely resolve a user-provided path against the root directory."""
        if ".." in user_path:
            return None # Disallow parent directory traversal
        
        abs_path = os.path.abspath(os.path.join(self.root_dir, user_path))
        if os.path.commonpath([self.root_dir, abs_path]) != self.root_dir:
            return None # Path is outside the root directory
        
        return abs_path

    def _handle_list_directory(self, msg: dict[str, Any]) -> dict[str, Any]:
        """Handle a request to list a directory."""
        path = msg.get("path", ".")
        safe_path = self._resolve_path(path)
        
        if not safe_path or not os.path.isdir(safe_path):
            return {"type": "error", "message": "Invalid or inaccessible directory."}

        try:
            entries = os.listdir(safe_path)
            return {"type": "directory_listing", "path": path, "entries": entries}
        except Exception as e:
            return {"type": "error", "message": str(e)}

    def _handle_read_file(self, msg: dict[str, Any]) -> dict[str, Any]:
        """Handle a request to read a file."""
        path = msg.get("path")
        if not path:
            return {"type": "error", "message": "Missing 'path' for read_file."}

        safe_path = self._resolve_path(path)
        if not safe_path or not os.path.isfile(safe_path):
            return {"type": "error", "message": "File not found or is not a file."}

        try:
            with open(safe_path, "r", encoding="utf-8") as f:
                content = f.read()
            return {"type": "file_content", "path": path, "content": content}
        except Exception as e:
            return {"type": "error", "message": str(e)}
