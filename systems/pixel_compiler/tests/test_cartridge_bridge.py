# systems/pixel_compiler/tests/test_cartridge_bridge.py
"""Tests for cartridge bridge WebSocket handler."""

import pytest
import json
import asyncio
from unittest.mock import Mock, patch, AsyncMock


class TestCartridgeBridge:
    """Test WebSocket bridge for cartridge assembly."""

    def test_handle_assemble_request(self):
        """Bridge should handle assemble request and return PNG bytes."""
        from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request

        request = {
            "action": "assemble",
            "name": "test_cart",
            "files": [
                {"path": "main.py", "content": "cHJpbnQoJ2hlbGxvJyk="}  # base64
            ]
        }

        result = handle_cartridge_request(request)

        assert result["success"] is True
        assert "cartridge" in result
        assert result["cartridge"]["format"] == "png"
        assert len(result["cartridge"]["data"]) > 0

    def test_handle_deploy_request(self):
        """Bridge should handle deploy request with location."""
        from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request

        request = {
            "action": "deploy",
            "name": "deploy_test",
            "files": [
                {"path": "code.py", "content": "eCA9IDE="}  # base64
            ],
            "location": {"x": 1000, "y": 2000}
        }

        result = handle_cartridge_request(request)

        assert result["success"] is True
        assert "location" in result
        assert result["location"]["x"] == 1000
        assert result["location"]["y"] == 2000

    def test_invalid_action_returns_error(self):
        """Invalid action should return error."""
        from systems.visual_shell.web.cartridge_bridge import handle_cartridge_request

        request = {
            "action": "invalid",
            "name": "test"
        }

        result = handle_cartridge_request(request)

        assert result["success"] is False
        assert "error" in result
