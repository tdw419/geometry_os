"""
Master Stage - Full Validation Test Suite

This suite proves the functional capabilities of the Master Stage:
1. Perception Upgrade (Capability Proof)
2. Lethal Mutation Rejection (Safety Proof)
3. Closed-Loop Rendering (Architecture Proof)
4. Primordial Rollback (Recovery Proof)
"""
import pytest
import asyncio
from unittest.mock import MagicMock, AsyncMock, patch
from systems.evolution_daemon.evolution_daemon import EvolutionDaemon, EvolutionTask, EvolutionProposal
from systems.evolution_daemon.stages.mirror_bridge import MirrorValidationResult
from systems.evolution_daemon.stages.master_stage import CapabilityType
from systems.evolution_daemon.visual_verification_service import VisualIntent

@pytest.fixture
def daemon():
    daemon = EvolutionDaemon(api_key="test_key")
    daemon.visual_connected = True
    
    # Mock visual shell
    daemon.webmcp = MagicMock()
    daemon.webmcp.broadcast_event = AsyncMock()
    daemon.webmcp.place_tile = AsyncMock()
    daemon.webmcp.place_text = AsyncMock()
    daemon.webmcp.get_visual_state = AsyncMock(return_value={"children": []})
    
    # Mock Git
    daemon.git = MagicMock()
    daemon.git.commit_evolution = AsyncMock(return_value="commit_sha_v14")
    daemon.git.create_pr_branch = AsyncMock(return_value="v14-upgrade-branch")
    
    # Mock Safety Components
    daemon.sandbox = MagicMock()
    daemon.sandbox.validate = AsyncMock()
    
    daemon.mirror_bridge = MagicMock()
    daemon.mirror_bridge.validate_proposal = AsyncMock()
    
    daemon.guardian_gate = MagicMock()
    daemon.guardian_gate.review = AsyncMock()
    
    daemon.tier_router = MagicMock()
    daemon.tier_router.classify = MagicMock(return_value=1)
    daemon.tier_router.get_tier_description = MagicMock(return_value="Tier 1")
    
    daemon.monitor = MagicMock()
    daemon.monitor.capture_baseline = AsyncMock()
    daemon.monitor.monitor = AsyncMock()
    
    daemon.recovery = MagicMock()
    daemon.recovery.is_paused = MagicMock(return_value=(False, ""))
    daemon.recovery.handle_regression = AsyncMock()
    
    daemon.vfs = MagicMock()
    daemon.vfs.read_file = AsyncMock()
    daemon.vfs.write_file = AsyncMock()
    
    return daemon

@pytest.mark.asyncio
async def test_perception_upgrade_v14(daemon):
    """
    Tier 1: Perception Upgrade (Capability Proof)
    Tests that the AI can successfully add a new heuristic to its perception system.
    """
    # 1. Propose upgrade (via MasterStage)
    task = await daemon.master_stage.propose_capability_upgrade(
        capability_type=CapabilityType.VERIFICATION_CRITERIA,
        description="Add 'system_tray_icon' as RELAXED type",
        target_file="systems/evolution_daemon/visual_verification_service.py",
        new_code='NON_CRITICAL_TYPES.add("system_tray_icon")',
        verification_intent=VisualIntent(element_type="system_tray_icon", position=(10, 10), size=(20, 20))
    )
    
    # Wrap in EvolutionTask (normally done by MasterStage.execute_upgrade)
    task_obj = EvolutionTask(
        task_id=task.capability_id,
        goal=f"MASTER UPGRADE: {task.modification_description}",
        target_file=task.target_file,
        visual_intent=task.visual_intent,
        priority=10
    )
    
    # 2. Mock pipeline success
    daemon._create_proposal = AsyncMock(return_value=EvolutionProposal(
        proposal_id=task.capability_id,
        goal=task_obj.goal,
        target_files=[task.target_file],
        diff_content="+ NON_CRITICAL_TYPES.add('system_tray_icon')"
    ))
    daemon.sandbox.validate.return_value = MagicMock(passed=True)
    daemon.mirror_bridge.validate_proposal.return_value = MirrorValidationResult(
        success=True, accuracy_score=0.98, immortality_passed=True, metrics={}
    )
    daemon.guardian_gate.review.return_value = MagicMock(approved=True, risk_level="low", confidence=0.95)
    daemon.vfs.read_file.return_value = "original_code"
    daemon.monitor.monitor.return_value = MagicMock(healthy=True)
    
    # 3. Execute
    success = await daemon.safe_evolve(task_obj)
    
    # 4. Verify
    assert success is True
    assert task_obj.status == "completed"
    daemon.mirror_bridge.validate_proposal.assert_called_once()
    daemon.git.commit_evolution.assert_called_once()
    logger_msg = f"SUCCESS: {task_obj.goal[:25]}"
    # Check if success was logged visually (indirectly via mock calls)
    assert daemon.webmcp.place_text.called

@pytest.mark.asyncio
async def test_lethal_mutation_rejection_v14(daemon):
    """
    Tier 2: Lethal Mutation Rejection (Safety Proof)
    Tests that the system rejects changes that break Immortality Checks.
    """
    # 1. Propose lethal mutation
    task = await daemon.master_stage.propose_capability_upgrade(
        capability_type=CapabilityType.VERIFICATION_CRITERIA,
        description="Remove terminal detection logic",
        target_file="systems/evolution_daemon/visual_verification_service.py",
        new_code="# Lethal removal of code",
        verification_intent=VisualIntent(element_type="terminal", position=(0, 0), size=(100, 100))
    )
    
    task_obj = EvolutionTask(
        task_id=task.capability_id,
        goal=f"MASTER UPGRADE: {task.modification_description}",
        target_file=task.target_file,
        visual_intent=task.visual_intent,
        priority=10
    )
    
    # 2. Mock Sandbox PASS but Mirror FAIL
    daemon._create_proposal = AsyncMock(return_value=EvolutionProposal(
        proposal_id=task.capability_id,
        goal=task_obj.goal,
        target_files=[task.target_file],
        diff_content="- detection_logic()"
    ))
    daemon.sandbox.validate.return_value = MagicMock(passed=True)
    
    # MIRROR VALIDATION DETECTS LETHAL CHANGE
    daemon.mirror_bridge.validate_proposal.return_value = MirrorValidationResult(
        success=False, 
        accuracy_score=0.05, 
        immortality_passed=False, 
        metrics={}, 
        issues=["MANDATORY: Immortality checks failed (Terminal not found)"]
    )
    
    daemon.vfs.read_file.return_value = "original_code"
    
    # 3. Execute
    success = await daemon.safe_evolve(task_obj)
    
    # 4. Verify rejection
    assert success is False
    assert task_obj.status == "rejected"
    assert "Mirror validation failed" in task_obj.result
    # Guardian should never be consulted for lethal mutations caught by Mirror
    daemon.guardian_gate.review.assert_not_called()

@pytest.mark.asyncio
async def test_closed_loop_rendering_v14(daemon):
    """
    Tier 3: Closed-Loop Rendering (Architecture Proof)
    Tests that the AI can modify rendering and verify it using its own perception.
    """
    # 1. Propose rendering change
    task = await daemon.master_stage.propose_capability_upgrade(
        capability_type=CapabilityType.RENDERING_LOGIC,
        description="Change evolution task tiles to Cyan",
        target_file="systems/visual_shell/web/application.js",
        new_code="TASK_COLOR = 0x00FFFF;",
        verification_intent=VisualIntent(
            element_type="evolution_task", 
            position=(400, 300), 
            size=(150, 30),
            properties={"color": "#00ffff"}
        )
    )
    
    task_obj = EvolutionTask(
        task_id=task.capability_id,
        goal=f"MASTER UPGRADE: {task.modification_description}",
        target_file=task.target_file,
        visual_intent=task.visual_intent,
        priority=10
    )
    
    # 2. Mock Pipeline
    daemon._create_proposal = AsyncMock(return_value=EvolutionProposal(
        proposal_id=task.capability_id,
        goal=task_obj.goal,
        target_files=[task.target_file],
        diff_content="TASK_COLOR = 0x00FFFF;"
    ))
    daemon.sandbox.validate.return_value = MagicMock(passed=True)
    daemon.mirror_bridge.validate_proposal.return_value = MirrorValidationResult(
        success=True, accuracy_score=1.0, immortality_passed=True, metrics={}
    )
    daemon.guardian_gate.review.return_value = MagicMock(approved=True, risk_level="low", confidence=1.0)
    daemon.vfs.read_file.return_value = "original_js"
    daemon.monitor.monitor.return_value = MagicMock(healthy=True)
    
    # Mock Phase 7: Visual Verify - Seeing the new Cyan color
    daemon.webmcp.get_visual_state.return_value = {
        "children": [
            {
                "type": "evolution_task",
                "x": 400, "y": 300, "width": 150, "height": 30,
                "color": "#00ffff"
            }
        ]
    }
    
    # 3. Execute
    success = await daemon.safe_evolve(task_obj)
    
    # 4. Verify
    assert success is True
    # Verify VisualVerify was called and succeeded
    assert task_obj.visual_attempt > 0

@pytest.mark.asyncio
async def test_primordial_rollback_v14(daemon):
    """
    Tier 4: Primordial Rollback (Recovery Proof)
    Tests automated recovery from a mutation that passes mirror validation but crashes in monitor.
    """
    # 1. Propose mutation
    task_id = "cap_runtime_failure"
    task_obj = EvolutionTask(
        task_id=task_id,
        goal="Self-modifying brain upgrade",
        target_file="systems/evolution_daemon/visual_verification_service.py"
    )
    
    # 2. Mock Pipeline up to Monitor
    daemon._create_proposal = AsyncMock(return_value=EvolutionProposal(
        proposal_id=task_id,
        goal=task_obj.goal,
        target_files=[task_obj.target_file],
        diff_content="--- dangerous diff"
    ))
    daemon.sandbox.validate.return_value = MagicMock(passed=True)
    daemon.mirror_bridge.validate_proposal.return_value = MirrorValidationResult(
        success=True, accuracy_score=0.9, immortality_passed=True, metrics={}
    )
    daemon.guardian_gate.review.return_value = MagicMock(approved=True, risk_level="low", confidence=0.8)
    
    # Snapshot created here
    daemon.vfs.read_file.return_value = "GENETIC_DNA_STABLE"
    
    # MONITOR DETECTS REGRESSION
    daemon.monitor.monitor.return_value = MagicMock(healthy=False, issues=["Crash in metabolism loop"])
    
    # Mock Recovery
    daemon.recovery.handle_regression = AsyncMock(return_value=MagicMock(value="auto_revert"))
    
    # 3. Execute
    success = await daemon.safe_evolve(task_obj)
    
    # 4. Verify Rollback
    assert success is False
    assert task_obj.status == "reverted"
    # Verify Primordial Rollback wrote the stable DNA back
    daemon.vfs.write_file.assert_called_with(task_obj.target_file, "GENETIC_DNA_STABLE")
    daemon.recovery.handle_regression.assert_called_once()
