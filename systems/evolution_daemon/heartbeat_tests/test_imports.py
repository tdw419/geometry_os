"""
Heartbeat Test: Core Module Imports

Verifies that critical Geometry OS modules can be imported without errors.
This is the most basic smoke test - if this fails, something is fundamentally broken.
"""

import pytest


def test_import_data_structures():
    """Test that safety data structures can be imported"""
    from systems.evolution_daemon.safety.data_structures import (
        EvolutionProposal,
        SandboxResult,
        GuardianVerdict,
        MonitoringResult,
        RecoveryAction,
        EvolutionResult
    )
    assert EvolutionProposal is not None
    assert SandboxResult is not None
    assert GuardianVerdict is not None


def test_import_sandbox_manager():
    """Test that SandboxManager can be imported"""
    from systems.evolution_daemon.safety.sandbox_manager import SandboxManager
    assert SandboxManager is not None


def test_import_evolution_daemon():
    """Test that EvolutionDaemon can be imported"""
    from systems.evolution_daemon.evolution_daemon import EvolutionDaemon
    assert EvolutionDaemon is not None


def test_import_zai_integration():
    """Test that ZAI integration can be imported"""
    try:
        from zai_agent_integration import ZAIIntegration
        assert ZAIIntegration is not None
    except ImportError:
        pytest.skip("ZAI integration not available")


def test_no_syntax_errors():
    """Verify core modules have no syntax errors by compiling them"""
    import py_compile
    import tempfile
    from pathlib import Path

    # Key files to check
    files_to_check = [
        "systems/evolution_daemon/evolution_daemon.py",
        "systems/evolution_daemon/safety/data_structures.py",
        "systems/evolution_daemon/safety/sandbox_manager.py",
    ]

    for file_path in files_to_check:
        full_path = Path(file_path)
        if full_path.exists():
            # This will raise if there's a syntax error
            py_compile.compile(str(full_path), doraise=True)


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
