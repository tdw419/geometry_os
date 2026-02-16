"""Unit tests for SandboxManager"""

import pytest
import tempfile
from pathlib import Path

from systems.evolution_daemon.safety import (
    SandboxManager, EvolutionProposal, SandboxResult
)


@pytest.fixture
def sandbox_manager():
    """Create a SandboxManager instance"""
    with tempfile.TemporaryDirectory() as tmpdir:
        manager = SandboxManager(sandbox_base=tmpdir)
        yield manager


@pytest.fixture
def sample_proposal():
    """Create a sample evolution proposal"""
    return EvolutionProposal(
        proposal_id="test-001",
        goal="Fix a bug",
        target_files=["test_file.py"],
        diff_content="+ print('hello')\n- print('goodbye')",
        lines_changed=2
    )


class TestSandboxManager:
    """Tests for SandboxManager class"""

    def test_initialization(self, sandbox_manager):
        """Test that SandboxManager initializes correctly"""
        assert sandbox_manager.sandbox_base is not None
        assert sandbox_manager.SANDBOX_TIMEOUT == 30

    @pytest.mark.asyncio
    async def test_create_sandbox(self, sandbox_manager, sample_proposal):
        """Test sandbox creation"""
        # Create a test file first
        test_file = Path("test_file.py")
        test_file.write_text("# Original content\nprint('goodbye')\n")

        try:
            sandbox_path = await sandbox_manager.create_sandbox(sample_proposal)
            assert sandbox_path is not None
            assert "sandbox_test-001" in sandbox_path
        finally:
            if test_file.exists():
                test_file.unlink()

    @pytest.mark.asyncio
    async def test_validate_syntax_valid(self, sandbox_manager):
        """Test syntax validation with valid Python"""
        with tempfile.TemporaryDirectory() as tmpdir:
            valid_py = Path(tmpdir) / "valid.py"
            valid_py.write_text("print('hello')\n")

            valid, errors = await sandbox_manager.validate_syntax(tmpdir)
            assert valid is True
            assert len(errors) == 0

    @pytest.mark.asyncio
    async def test_validate_syntax_invalid(self, sandbox_manager):
        """Test syntax validation with invalid Python"""
        with tempfile.TemporaryDirectory() as tmpdir:
            invalid_py = Path(tmpdir) / "invalid.py"
            invalid_py.write_text("def broken(\n")  # Invalid syntax

            valid, errors = await sandbox_manager.validate_syntax(tmpdir)
            assert valid is False
            assert len(errors) > 0

    @pytest.mark.asyncio
    async def test_validate_imports_valid(self, sandbox_manager):
        """Test import validation with valid imports"""
        with tempfile.TemporaryDirectory() as tmpdir:
            valid_py = Path(tmpdir) / "imports.py"
            valid_py.write_text("import os\nimport sys\n")

            valid, errors = await sandbox_manager.validate_imports(tmpdir)
            # Should pass for stdlib imports
            assert len(errors) == 0 or all('os' not in e and 'sys' not in e for e in errors)

    @pytest.mark.asyncio
    async def test_cleanup(self, sandbox_manager, sample_proposal):
        """Test sandbox cleanup"""
        sandbox_path = await sandbox_manager.create_sandbox(sample_proposal)
        assert Path(sandbox_path).exists()

        await sandbox_manager.cleanup(sandbox_path)
        assert not Path(sandbox_path).exists()


class TestSandboxResult:
    """Tests for SandboxResult dataclass"""

    def test_pass_rate_no_tests(self):
        """Test pass rate when no tests run"""
        result = SandboxResult(
            passed=True,
            proposal_id="test",
            heartbeat_tests_passed=0,
            heartbeat_tests_total=0
        )
        assert result.heartbeat_pass_rate == 1.0  # No tests = assume pass

    def test_pass_rate_full(self):
        """Test pass rate with all tests passing"""
        result = SandboxResult(
            passed=True,
            proposal_id="test",
            heartbeat_tests_passed=5,
            heartbeat_tests_total=5
        )
        assert result.heartbeat_pass_rate == 1.0

    def test_pass_rate_partial(self):
        """Test pass rate with partial tests passing"""
        result = SandboxResult(
            passed=False,
            proposal_id="test",
            heartbeat_tests_passed=3,
            heartbeat_tests_total=5
        )
        assert result.heartbeat_pass_rate == 0.6


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
