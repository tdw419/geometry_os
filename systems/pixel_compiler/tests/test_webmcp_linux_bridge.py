"""Tests for WebMCP Linux Bridge."""
import pytest
from unittest.mock import patch, MagicMock


class TestLinuxBridgeImport:
    """Test that the module can be imported."""

    def test_import_module(self):
        """Should be able to import the linux bridge module."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        assert LinuxBridge is not None


class TestLinuxBridgeInstantiation:
    """Test LinuxBridge class can be instantiated."""

    def test_create_bridge_instance(self):
        """Should create a LinuxBridge instance."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()
        assert bridge is not None

    def test_bridge_has_session_id(self):
        """Bridge should have a default session_id."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()
        assert hasattr(bridge, 'session_id')
        assert bridge.session_id is None

    def test_bridge_has_status(self):
        """Bridge should track status."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()
        assert hasattr(bridge, 'status')
        assert bridge.status == 'stopped'


class TestQEMUCommandBuilding:
    """Test QEMU command construction."""

    def test_build_qemu_command(self):
        """Should build correct QEMU command."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        cmd = bridge._build_qemu_command()

        assert 'qemu-system-x86_64' in cmd
        assert '-m 1024' in cmd
        assert '-nographic' in cmd
        assert '-serial mon:stdio' in cmd
        assert 'console=ttyS0' in cmd

    def test_qemu_command_uses_project_paths(self):
        """QEMU command should use project-relative paths."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        cmd = bridge._build_qemu_command()

        assert 'kernel' in cmd
        assert 'initrd' in cmd
        assert 'alpine_disk.qcow2' in cmd


class TestLinuxBridgeBoot:
    """Test Linux boot functionality."""

    @patch('subprocess.Popen')
    def test_boot_starts_qemu_process(self, mock_popen):
        """Boot should start QEMU subprocess."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        mock_process = MagicMock()
        mock_popen.return_value = mock_process

        result = bridge.boot()

        assert mock_popen.called
        assert bridge.status == 'booting'
        assert bridge.session_id is not None

    @patch('subprocess.Popen')
    def test_boot_returns_session_info(self, mock_popen):
        """Boot should return session information."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        mock_process = MagicMock()
        mock_popen.return_value = mock_process

        result = bridge.boot()

        assert 'session_id' in result
        assert 'status' in result
        assert result['status'] == 'booting'

    def test_shutdown_terminates_process(self):
        """Shutdown should terminate the QEMU process."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        mock_process = MagicMock()
        mock_process.poll.return_value = None  # Process is running
        bridge._process = mock_process

        bridge.shutdown()

        mock_process.terminate.assert_called_once()
        assert bridge.status == 'stopped'


class TestCommandExecution:
    """Test command execution in Linux."""

    def test_exec_command_requires_running_instance(self):
        """Exec should fail if no instance is running."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        result = bridge.exec_command('ls')

        assert 'error' in result
        assert 'not running' in result['error'].lower()

    @patch('select.select')
    def test_exec_command_sends_to_stdin(self, mock_select):
        """Exec should send command to process stdin."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        # Mock running process
        mock_process = MagicMock()
        mock_process.poll.return_value = None
        mock_process.stdin = MagicMock()
        mock_process.stdout = MagicMock()
        bridge._process = mock_process

        # Mock select to return immediately with empty output
        mock_select.return_value = ([], [], [])

        result = bridge.exec_command('echo hello', timeout=1)

        # Should have written to stdin
        mock_process.stdin.write.assert_called()

    @patch('select.select')
    def test_exec_command_returns_timeout_on_no_response(self, mock_select):
        """Exec should timeout if no response received."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        mock_process = MagicMock()
        mock_process.poll.return_value = None
        mock_process.stdin = MagicMock()
        mock_process.stdout = MagicMock()
        mock_process.stdout.read = MagicMock(return_value=b'')
        bridge._process = mock_process

        # Mock select to return no readable data
        mock_select.return_value = ([], [], [])

        result = bridge.exec_command('slow-command', timeout=0.1)

        assert result.get('timeout') is True or 'timeout' in result.get('error', '').lower()


class TestFileOperations:
    """Test file read/write operations."""

    def test_read_file_uses_cat_command(self):
        """read_file should use cat command internally."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        # Mock exec_command
        bridge.exec_command = MagicMock(return_value={
            'stdout': 'file contents here',
            'exit_code': 0
        })

        result = bridge.read_file('/etc/hostname')

        # Should have called exec_command with cat
        call_args = bridge.exec_command.call_args[0][0]
        assert 'cat' in call_args
        assert '/etc/hostname' in call_args

    def test_write_file_uses_echo_or_cat(self):
        """write_file should write via command."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        bridge.exec_command = MagicMock(return_value={
            'stdout': '',
            'exit_code': 0
        })

        result = bridge.write_file('/tmp/test.txt', 'hello world')

        assert result.get('success') is True
        # Should have called exec_command to write
        assert bridge.exec_command.called


class TestWebSocketHandler:
    """Test WebSocket command handling."""

    def test_handle_command_routes_boot(self):
        """handle_command should route 'boot' to boot method."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        bridge.boot = MagicMock(return_value={'session_id': 'test', 'status': 'booting'})

        result = bridge.handle_command({'command': 'boot'})

        bridge.boot.assert_called_once()
        assert result['status'] == 'booting'

    def test_handle_command_routes_exec(self):
        """handle_command should route 'exec' to exec_command."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        bridge.exec_command = MagicMock(return_value={'stdout': 'output'})

        result = bridge.handle_command({
            'command': 'exec',
            'cmd': 'ls -la'
        })

        bridge.exec_command.assert_called_once_with('ls -la')

    def test_handle_command_routes_read_file(self):
        """handle_command should route 'read_file'."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        bridge.read_file = MagicMock(return_value={'content': 'data'})

        result = bridge.handle_command({
            'command': 'read_file',
            'path': '/etc/hosts'
        })

        bridge.read_file.assert_called_once_with('/etc/hosts')

    def test_handle_command_unknown_returns_error(self):
        """handle_command should return error for unknown commands."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        result = bridge.handle_command({'command': 'unknown_thing'})

        assert 'error' in result


class TestAsyncWebSocket:
    """Test async WebSocket server functionality."""

    @pytest.mark.asyncio
    async def test_async_handle_websocket_message(self):
        """Should handle WebSocket messages asynchronously."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge

        bridge = LinuxBridge()
        bridge.handle_command = MagicMock(return_value={'status': 'ok'})

        # Mock websocket
        mock_ws = MagicMock()

        # This should process the message
        result = await bridge.handle_websocket_message(mock_ws, '{"command": "status"}')

        assert result is not None
        # Result should be valid JSON
        import json
        parsed = json.loads(result)
        assert 'status' in parsed

    def test_get_status_method(self):
        """Should have a status method."""
        from systems.pixel_compiler.webmcp_linux_bridge import LinuxBridge
        bridge = LinuxBridge()

        result = bridge.get_status()

        assert 'status' in result
        assert 'session_id' in result
