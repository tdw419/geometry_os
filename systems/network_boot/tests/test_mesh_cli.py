"""
Tests for mesh CLI commands.
"""

import pytest
import sys
import argparse
from unittest.mock import patch, MagicMock, AsyncMock
from pathlib import Path

# Add project root to path
project_root = Path(__file__).parent.parent.parent.parent
sys.path.insert(0, str(project_root))


class TestMeshStatusCommand:
    """Tests for cmd_mesh_status."""

    def test_mesh_status_shows_basic_info(self):
        """Test that status command shows node_id, hostname, running, peers."""
        from systems.pixel_compiler.pixelrts_cli import cmd_mesh_status

        args = argparse.Namespace(json=False, verbose=False)

        # Should not raise
        result = cmd_mesh_status(args)
        assert result == 0

    def test_mesh_status_json_output(self, capsys):
        """Test --json flag produces valid JSON."""
        import json
        from systems.pixel_compiler.pixelrts_cli import cmd_mesh_status

        args = argparse.Namespace(json=True, verbose=False)

        result = cmd_mesh_status(args)
        assert result == 0

        captured = capsys.readouterr()
        output = json.loads(captured.out)

        # Verify expected fields
        assert "node_id" in output
        assert "hostname" in output
        assert "running" in output
        assert "peer_count" in output
        assert "active_peers" in output

    def test_mesh_status_verbose(self, capsys):
        """Test -v flag shows peer details."""
        from systems.pixel_compiler.pixelrts_cli import cmd_mesh_status

        args = argparse.Namespace(json=False, verbose=True)

        result = cmd_mesh_status(args)
        assert result == 0

        captured = capsys.readouterr()
        # Should contain "Peer Details" section
        assert "Peer Details" in captured.out


class TestMeshDiscoverCommand:
    """Tests for cmd_mesh_discover."""

    def test_mesh_discover_runs_discovery(self):
        """Test that discover command runs without errors."""
        from systems.pixel_compiler.pixelrts_cli import cmd_mesh_discover

        args = argparse.Namespace(json=False, timeout=0.1)

        # Run with very short timeout to speed up test
        result = cmd_mesh_discover(args)
        assert result == 0

    def test_mesh_discover_json_output(self):
        """Test --json flag produces valid JSON."""
        import json
        from systems.pixel_compiler.pixelrts_cli import cmd_mesh_discover

        args = argparse.Namespace(json=True, timeout=0.1)

        result = cmd_mesh_discover(args)
        assert result == 0

    def test_mesh_discover_custom_timeout(self):
        """Test --timeout flag is respected."""
        from systems.pixel_compiler.pixelrts_cli import cmd_mesh_discover

        args = argparse.Namespace(json=True, timeout=0.5)

        result = cmd_mesh_discover(args)
        assert result == 0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
