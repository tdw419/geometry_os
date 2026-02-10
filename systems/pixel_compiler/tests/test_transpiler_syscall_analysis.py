"""
Tests for Universal Transpiler Syscall Analysis Integration

Tests the integration of SyscallBridge into UniversalTranspiler for
providing syscall compatibility information when transpiling native binaries.
"""

import pytest
import tempfile
import os
from pathlib import Path

from systems.pixel_compiler.universal_transpiler import UniversalTranspiler
import systems.pixel_compiler.syscall_bridge as sb_module
SyscallBridge = sb_module.SyscallBridge


class TestTranspilerSyscallAnalysis:
    """Test syscall analysis integration in UniversalTranspiler."""

    @pytest.fixture
    def temp_dir(self):
        """Create a temporary directory for test files."""
        temp_dir = tempfile.mkdtemp()
        yield temp_dir
        # Cleanup
        import shutil
        shutil.rmtree(temp_dir, ignore_errors=True)

    @pytest.fixture
    def elf_binary(self, temp_dir):
        """Create a minimal ELF binary for testing."""
        elf_path = Path(temp_dir) / "test.elf"
        # ELF 64-bit magic bytes
        with open(elf_path, 'wb') as f:
            f.write(b'\x7fELF\x02\x01\x01\x00')
        return str(elf_path)

    def test_syscall_bridge_available(self):
        """Test that UniversalTranspiler has syscall_bridge attribute."""
        transpiler = UniversalTranspiler()

        assert hasattr(transpiler, 'syscall_bridge'), \
            "UniversalTranspiler should have syscall_bridge attribute"
        assert isinstance(transpiler.syscall_bridge, SyscallBridge), \
            "syscall_bridge should be a SyscallBridge instance"

    def test_syscall_bridge_initialized(self):
        """Test that syscall_bridge is properly initialized."""
        transpiler = UniversalTranspiler()

        # Should be able to call methods on the bridge
        supported = transpiler.syscall_bridge.list_supported_syscalls()
        assert isinstance(supported, dict), "list_supported_syscalls should return a dict"

        unsupported = transpiler.syscall_bridge.list_unsupported_syscalls()
        assert isinstance(unsupported, dict), "list_unsupported_syscalls should return a dict"

    def test_analyze_elf_binary_with_syscall_report(self, elf_binary, capsys):
        """Test that ELF binary analysis includes syscall compatibility report."""
        transpiler = UniversalTranspiler()

        # This should analyze the binary and provide syscall info
        result = transpiler._transpile_binary_to_wasm(elf_binary, "elf")

        # Result should be the path back (simulation mode)
        assert result == elf_binary, "Should return original path in simulation mode"

        # Check that syscall report was printed
        captured = capsys.readouterr()
        assert "Syscall Compatibility Check" in captured.out, \
            "Should print syscall compatibility report"
        assert "Supported examples:" in captured.out, \
            "Should show supported syscalls"
        assert "Unsupported:" in captured.out, \
            "Should show unsupported syscalls"
        assert "Total mapped syscalls:" in captured.out, \
            "Should show total count"

    def test_report_unsupported_syscalls(self):
        """Test that unsupported syscalls are correctly reported."""
        transpiler = UniversalTranspiler()

        # Get dict of unsupported syscalls
        unsupported = transpiler.syscall_bridge.list_unsupported_syscalls()

        # Should include known unsupported syscalls
        assert 'fork' in unsupported, "fork should be in unsupported dict"
        assert 'execve' in unsupported, "execve should be in unsupported dict"
        assert 'clone' in unsupported, "clone should be in unsupported dict"
        assert 'mmap' in unsupported, "mmap should be in unsupported dict"

    def test_report_supported_syscalls(self):
        """Test that supported syscalls are correctly reported."""
        transpiler = UniversalTranspiler()

        # Get dict of supported syscalls
        supported = transpiler.syscall_bridge.list_supported_syscalls()

        # Should include known supported syscalls
        assert 'write' in supported, "write should be in supported dict"
        assert 'read' in supported, "read should be in supported dict"
        assert 'exit' in supported, "exit should be in supported dict"
        assert 'openat' in supported, "openat should be in supported dict"
        assert 'close' in supported, "close should be in supported dict"

    def test_syscall_check_method(self):
        """Test the check_syscall_supported method."""
        transpiler = UniversalTranspiler()

        # Check supported syscall - returns bool
        supported = transpiler.syscall_bridge.check_syscall_supported('write')
        assert supported is True, "write should be supported"

        # Check unsupported syscall
        supported = transpiler.syscall_bridge.check_syscall_supported('fork')
        assert supported is False, "fork should not be supported"

    def test_wasi_function_mapping(self):
        """Test getting WASI function mapping for syscalls."""
        transpiler = UniversalTranspiler()

        # Check known syscall mapping - returns SyscallMapping object
        mapping = transpiler.syscall_bridge.get_wasi_function('write')
        assert mapping is not None, "write should have a WASI mapping"
        assert mapping.wasi_function.value == 'fd_write', "write should map to fd_write"

        mapping = transpiler.syscall_bridge.get_wasi_function('exit')
        assert mapping is not None, "exit should have a WASI mapping"
        assert mapping.wasi_function.value == 'proc_exit', "exit should map to proc_exit"

        # Check unknown syscall
        mapping = transpiler.syscall_bridge.get_wasi_function('nonexistent_syscall')
        assert mapping is None, "Unknown syscall should return None"
