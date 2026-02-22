"""
V14 Master Stage - 9-Phase Pipeline Integration Tests
"""
import pytest
import asyncio
from unittest.mock import MagicMock, AsyncMock, patch
from systems.evolution_daemon.evolution_daemon import EvolutionDaemon, EvolutionTask, EvolutionProposal
from systems.evolution_daemon.stages.mirror_bridge import MirrorValidationResult

@pytest.fixture
def daemon():
    daemon = EvolutionDaemon(api_key="test_key")
    daemon.visual_connected = True
    daemon.webmcp = MagicMock()
    daemon.webmcp.broadcast_event = AsyncMock()
    daemon.webmcp.place_tile = AsyncMock()
    daemon.webmcp.place_text = AsyncMock()
    daemon.git = MagicMock()
    daemon.git.commit_evolution = AsyncMock(return_value="commit_sha")
    daemon.git.create_pr_branch = AsyncMock(return_value="pr-branch")
    daemon.monitor = MagicMock()
    daemon.monitor.capture_baseline = AsyncMock()
    daemon.monitor.monitor = AsyncMock(return_value=MagicMock(healthy=True))
    
    # Mocking components that safe_evolve uses
    daemon.mirror_bridge = MagicMock()
    daemon.mirror_bridge.validate_proposal = AsyncMock()
    
    daemon.guardian_gate = MagicMock()
    daemon.guardian_gate.review = AsyncMock()
    
    daemon.sandbox = MagicMock()
    daemon.sandbox.validate = AsyncMock()
    
    return daemon

@pytest.mark.asyncio
async def test_safe_evolve_v14_master_stage_flow(daemon):
    """Test that a Master Stage task triggers Mirror Validation (Phase 3)."""
    task = EvolutionTask(
        task_id="cap_test_upgrade",
        goal="Improve button detection",
        target_file="systems/evolution_daemon/visual_verification_service.py"
    )
    
    # Mock components
    daemon._create_proposal = AsyncMock(return_value=EvolutionProposal(
        proposal_id="cap_test_upgrade",
        goal="Improve button detection",
        target_files=["systems/evolution_daemon/visual_verification_service.py"],
        diff_content="--- diff"
    ))
    daemon.sandbox.validate = AsyncMock(return_value=MagicMock(passed=True))
    
    daemon.mirror_bridge.validate_proposal = AsyncMock(return_value=MirrorValidationResult(
        success=True,
        accuracy_score=0.95,
        immortality_passed=True,
        metrics={},
        issues=[]
    ))
    
    daemon.guardian_gate.review = AsyncMock(return_value=MagicMock(approved=True, risk_level="low", confidence=0.9))
    daemon.vfs.read_file = AsyncMock(return_value="original code")
    daemon.vfs.write_file = AsyncMock()
    
    success = await daemon.safe_evolve(task)
    
    assert success is True
    # Verify Phase 3 was called
    daemon.mirror_bridge.validate_proposal.assert_called_once()
    # Verify snapshot was created (Phase 0)
    daemon.vfs.read_file.assert_called_with("systems/evolution_daemon/visual_verification_service.py")

@pytest.mark.asyncio
async def test_safe_evolve_v14_mirror_failure(daemon):
    """Test that a Mirror Validation failure rejects the mutation."""
    task = EvolutionTask(
        task_id="cap_lethal_mutation",
        goal="Break perception",
        target_file="systems/evolution_daemon/visual_verification_service.py"
    )
    
    daemon._create_proposal = AsyncMock(return_value=EvolutionProposal(
        proposal_id="cap_lethal_mutation",
        goal="Break perception",
        target_files=["systems/evolution_daemon/visual_verification_service.py"],
        diff_content="--- lethal diff"
    ))
    daemon.sandbox.validate = AsyncMock(return_value=MagicMock(passed=True))
    
    # Mirror validation FAILS
    daemon.mirror_bridge.validate_proposal = AsyncMock(return_value=MirrorValidationResult(
        success=False,
        accuracy_score=0.2,
        immortality_passed=False,
        metrics={},
        issues=["Lethal mutation: cannot find terminal"]
    ))
    
    success = await daemon.safe_evolve(task)
    
    assert success is False
    assert "Mirror validation failed" in task.result
    # Guardian should NOT be called if Mirror fails
    daemon.guardian_gate.review.assert_not_called()
