"""
Test suite for Syscall Bridge - Linux to WASI translation.

These tests follow TDD principles - write the test first, then implement.
"""

import pytest

from systems.pixel_compiler.syscall_bridge import (
    WASIFunction,
    SyscallMapping,
    SyscallBridge
)


class TestSyscallRegistry:
    """Test cases for syscall registry and common syscalls."""

    def test_syscall_registry_contains_common_syscalls(self):
        """Test that the syscall registry contains common Linux syscalls."""
        bridge = SyscallBridge()

        # Check that common syscalls are registered
        common_syscalls = ['write', 'read', 'open', 'openat', 'close', 'exit',
                          'exit_group', 'clock_gettime', 'getrandom']

        for syscall in common_syscalls:
            assert syscall in bridge.LINUX_TO_WASI, \
                f"Syscall '{syscall}' should be in LINUX_TO_WASI mapping"

    def test_registry_has_wasi_function_mappings(self):
        """Test that each syscall maps to a valid WASI function."""
        bridge = SyscallBridge()

        for syscall_name, mapping in bridge.LINUX_TO_WASI.items():
            assert isinstance(mapping.wasi_function, WASIFunction), \
                f"{syscall_name} should map to a WASIFunction"


class TestWASIMapping:
    """Test cases for WASI function mapping retrieval."""

    @pytest.fixture
    def bridge(self):
        """Set up test fixtures."""
        return SyscallBridge()

    def test_get_wasi_mapping_for_known_syscall(self, bridge):
        """Test getting WASI mapping for a known syscall."""
        # Test 'write' syscall - should map to FD_WRITE
        mapping = bridge.get_wasi_function('write')

        assert mapping is not None, "Should return mapping for 'write'"
        assert mapping.linux_name == 'write'
        assert mapping.wasi_function == WASIFunction.FD_WRITE
        assert isinstance(mapping.signature_compatible, bool)

    def test_get_wasi_mapping_for_unknown_syscall(self, bridge):
        """Test getting WASI mapping for an unknown syscall."""
        # Test an unknown syscall
        mapping = bridge.get_wasi_function('unknown_syscall_xyz')

        assert mapping is None, "Should return None for unknown syscall"

    def test_get_wasi_mapping_case_sensitive(self, bridge):
        """Test that syscall lookup is case-sensitive."""
        # Linux syscalls are lowercase
        mapping_lower = bridge.get_wasi_function('write')
        mapping_upper = bridge.get_wasi_function('WRITE')

        assert mapping_lower is not None, "Lowercase 'write' should be found"
        assert mapping_upper is None, "Uppercase 'WRITE' should not be found"


class TestSyscallSupport:
    """Test cases for syscall support checking."""

    @pytest.fixture
    def bridge(self):
        """Set up test fixtures."""
        return SyscallBridge()

    def test_check_syscall_supported_returns_true_for_known(self, bridge):
        """Test check_syscall_supported returns True for supported syscalls."""
        # These should be supported
        supported = ['write', 'read', 'close', 'exit']

        for syscall in supported:
            result = bridge.check_syscall_supported(syscall)
            assert result is True, f"Syscall '{syscall}' should be supported"

    def test_check_syscall_supported_returns_false_for_unsupported(self, bridge):
        """Test check_syscall_supported returns False for unsupported syscalls."""
        # These should be unsupported
        unsupported = ['fork', 'clone', 'execve', 'ptrace', 'mmap']

        for syscall in unsupported:
            result = bridge.check_syscall_supported(syscall)
            assert result is False, f"Syscall '{syscall}' should not be supported"


class TestStubGeneration:
    """Test cases for stub WASM generation."""

    @pytest.fixture
    def bridge(self):
        """Set up test fixtures."""
        return SyscallBridge()

    def test_generate_stub_wasm_for_exit(self, bridge):
        """Test generating stub WASM for exit syscall."""
        stub = bridge.generate_stub_wasm('exit')

        assert isinstance(stub, bytes), "Stub should be bytes"
        assert len(stub) > 0, "Stub should not be empty"
        # Should contain WASM magic number
        assert stub.startswith(b'\x00asm'), "Stub should be valid WASM"

    def test_generate_stub_wasm_for_unsupported(self, bridge):
        """Test generating stub for unsupported syscall."""
        stub = bridge.generate_stub_wasm('fork')

        assert isinstance(stub, bytes), "Stub should be bytes"
        assert len(stub) > 0, "Stub should not be empty"

    def test_generate_stub_wasm_contains_error_indication(self, bridge):
        """Test that stub WASM indicates unsupported syscall."""
        # The stub should contain some indication of the unsupported syscall
        # For basic implementation, we just verify it generates valid WASM bytes
        stub = bridge.generate_stub_wasm('ptrace')

        assert stub.startswith(b'\x00asm'), \
            "Stub should be valid WASM with magic number"


class TestUnsupportedSyscalls:
    """Test cases for listing unsupported syscalls."""

    @pytest.fixture
    def bridge(self):
        """Set up test fixtures."""
        return SyscallBridge()

    def test_unsupported_syscall_list(self, bridge):
        """Test that unsupported syscalls list is populated."""
        unsupported = bridge.list_unsupported_syscalls()

        assert isinstance(unsupported, dict), "Should return a dict"
        assert len(unsupported) > 0, "Should have unsupported syscalls"

    def test_unsupported_syscalls_contain_expected(self, bridge):
        """Test that expected unsupported syscalls are in the list."""
        unsupported = bridge.list_unsupported_syscalls()

        # These should definitely be unsupported
        expected_unsupported = ['fork', 'clone', 'execve', 'wait4',
                               'ptrace', 'kill', 'signal']

        for syscall in expected_unsupported:
            assert syscall in unsupported, \
                f"Syscall '{syscall}' should be in unsupported list"

    def test_list_supported_syscalls(self, bridge):
        """Test listing supported syscalls."""
        supported = bridge.list_supported_syscalls()

        assert isinstance(supported, dict), "Should return a dict"
        assert len(supported) > 0, "Should have supported syscalls"

        # Check some expected supported syscalls
        expected_supported = ['write', 'read', 'open', 'close']

        for syscall in expected_supported:
            assert syscall in supported, \
                f"Syscall '{syscall}' should be in supported list"


class TestSyscallMapping:
    """Test cases for SyscallMapping dataclass."""

    def test_syscall_mapping_creation(self):
        """Test creating a SyscallMapping."""
        mapping = SyscallMapping(
            linux_name='write',
            wasi_function=WASIFunction.FD_WRITE,
            signature_compatible=True,
            translation_needed=False,
            notes='Direct mapping'
        )

        assert mapping.linux_name == 'write'
        assert mapping.wasi_function == WASIFunction.FD_WRITE
        assert mapping.signature_compatible is True
        assert mapping.translation_needed is False
        assert mapping.notes == 'Direct mapping'

    def test_syscall_mapping_with_translation(self):
        """Test SyscallMapping that requires translation."""
        mapping = SyscallMapping(
            linux_name='openat',
            wasi_function=WASIFunction.FD_OPEN,
            signature_compatible=False,
            translation_needed=True,
            notes='Needs path translation and flag conversion'
        )

        assert mapping.translation_needed is True
        assert mapping.signature_compatible is False


class TestWASIFunction:
    """Test cases for WASIFunction enum."""

    def test_wasi_function_contains_expected_functions(self):
        """Test that WASIFunction enum has expected values."""
        expected_functions = [
            'FD_WRITE', 'FD_READ', 'FD_CLOSE', 'FD_OPEN',
            'PROC_EXIT', 'CLOCK_TIME_GET', 'RANDOM_GET',
            'ARGS_GET', 'ENVIRON_GET'
        ]

        for func_name in expected_functions:
            assert hasattr(WASIFunction, func_name), \
                f"WASIFunction should have {func_name}"

    def test_wasi_function_values_are_unique(self):
        """Test that WASIFunction enum values are unique."""
        values = [f.value for f in WASIFunction]
        assert len(values) == len(set(values)), \
            "WASIFunction values should be unique"
