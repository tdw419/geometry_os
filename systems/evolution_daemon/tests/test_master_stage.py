"""
Master Stage - Visual Self-Evolution Tests
"""
import pytest

from systems.evolution_daemon.stages.master_stage import (
    CapabilityType,
    MasterStage,
    VisualCapabilityProposal,
)
from systems.evolution_daemon.visual_verification_service import VisualIntent


def test_master_stage_initialization():
    master = MasterStage()
    assert master.active_proposals == []
    assert master.daemon is None
    assert "trap_enter" in master._required_shader_functions
    assert "trap_ret" in master._required_shader_functions
    assert "check_timer_interrupt" in master._required_shader_functions


def test_capability_type_values():
    """Test all capability types have correct values."""
    assert CapabilityType.VERIFICATION_CRITERIA.value == "verification_criteria"
    assert CapabilityType.RENDERING_LOGIC.value == "rendering_logic"
    assert CapabilityType.SHADER_PARAMETER.value == "shader_parameter"
    assert CapabilityType.SPATIAL_HEURISTIC.value == "spatial_heuristic"


@pytest.mark.asyncio
async def test_propose_capability_upgrade():
    master = MasterStage()
    intent = VisualIntent(
        element_type="test_element",
        position=(100, 100),
        size=(50, 50)
    )

    proposal = await master.propose_capability_upgrade(
        capability_type=CapabilityType.VERIFICATION_CRITERIA,
        description="Add heuristic for window titles",
        target_file="systems/evolution_daemon/visual_verification_service.py",
        new_code="CRITICAL_TYPES.add('new_type')",
        verification_intent=intent
    )

    assert proposal.capability_id.startswith("cap_verification_criteria_")
    assert len(master.active_proposals) == 1
    assert master.active_proposals[0].capability_type == CapabilityType.VERIFICATION_CRITERIA


@pytest.mark.asyncio
async def test_propose_multiple_upgrades():
    """Test creating multiple proposals."""
    master = MasterStage()
    intent = VisualIntent(
        element_type="test",
        position=(0, 0),
        size=(100, 100)
    )

    for i in range(3):
        await master.propose_capability_upgrade(
            capability_type=CapabilityType.SPATIAL_HEURISTIC,
            description=f"Heuristic {i}",
            target_file="spatial.py",
            new_code=f"# code {i}",
            verification_intent=intent
        )

    assert len(master.active_proposals) == 3


@pytest.mark.asyncio
async def test_execute_upgrade_no_daemon():
    """Test execute_upgrade fails gracefully without daemon."""
    master = MasterStage()
    intent = VisualIntent(
        element_type="test",
        position=(0, 0),
        size=(100, 100)
    )
    proposal = VisualCapabilityProposal(
        capability_id="test-001",
        capability_type=CapabilityType.SHADER_PARAMETER,
        modification_description="Test",
        target_file="test.wgsl",
        new_code_fragment="// test",
        visual_intent=intent
    )

    result = await master.execute_upgrade(proposal)
    assert result is False


@pytest.mark.asyncio
async def test_execute_upgrade_with_daemon():
    """Test execute_upgrade with daemon connected."""
    class MockDaemon:
        pass

    master = MasterStage(evolution_daemon=MockDaemon())
    intent = VisualIntent(
        element_type="test",
        position=(0, 0),
        size=(100, 100)
    )
    proposal = VisualCapabilityProposal(
        capability_id="cap-001",
        capability_type=CapabilityType.SHADER_PARAMETER,
        modification_description="Test upgrade",
        target_file="test.wgsl",
        new_code_fragment="// test code",
        visual_intent=intent
    )

    result = await master.execute_upgrade(proposal)
    assert result is True


@pytest.mark.asyncio
async def test_mirror_validate():
    """Test mirror validation."""
    master = MasterStage()
    intent = VisualIntent(
        element_type="test",
        position=(0, 0),
        size=(100, 100)
    )
    proposal = VisualCapabilityProposal(
        capability_id="test-001",
        capability_type=CapabilityType.VERIFICATION_CRITERIA,
        modification_description="Test",
        target_file="verify.py",
        new_code_fragment="# test",
        visual_intent=intent
    )

    result = await master.mirror_validate(proposal)
    assert result is True


def test_validate_shader_safety_valid():
    """Test shader safety validation passes for valid shader."""
    master = MasterStage()
    valid_shader = """
    @compute @workgroup_size(64)
    fn main() {
        trap_enter();
        trap_ret();
        check_timer_interrupt();
    }
    """
    assert master.validate_shader_safety(valid_shader) is True


def test_validate_shader_safety_with_definitions():
    """Test shader safety with function definitions."""
    master = MasterStage()
    shader_with_defs = """
    fn trap_enter() { }
    fn trap_ret() { }
    fn check_timer_interrupt() { }
    """
    assert master.validate_shader_safety(shader_with_defs) is True


def test_validate_shader_safety_missing_function():
    """Test shader safety fails when missing required function."""
    master = MasterStage()
    incomplete_shader = """
    @compute @workgroup_size(64)
    fn main() {
        trap_enter();
        // missing trap_ret and check_timer_interrupt
    }
    """
    assert master.validate_shader_safety(incomplete_shader) is False


def test_validate_shader_safety_empty():
    """Test shader safety fails for empty shader."""
    master = MasterStage()
    assert master.validate_shader_safety("") is False


@pytest.mark.asyncio
async def test_propose_from_tectonic_result_failed():
    """Test propose_from_tectonic_result with failed tectonic shift."""
    master = MasterStage()

    class FailedResult:
        success = False

    result = await master.propose_from_tectonic_result(FailedResult())
    assert result is None


@pytest.mark.asyncio
async def test_propose_from_tectonic_result_no_shader():
    """Test propose_from_tectonic_result with no shader code."""
    master = MasterStage()

    class NoShaderResult:
        success = True
        best_shader_code = None

    result = await master.propose_from_tectonic_result(NoShaderResult())
    assert result is None


@pytest.mark.asyncio
async def test_propose_from_tectonic_result_unsafe_shader():
    """Test propose_from_tectonic_result with unsafe shader."""
    master = MasterStage()

    class UnsafeShaderResult:
        success = True
        best_shader_code = "// unsafe - missing required functions"
        best_mutation_id = "test-001"
        final_ipc = 0.5
        baseline_ipc = 0.4
        improvement_pct = 0.25

    result = await master.propose_from_tectonic_result(UnsafeShaderResult())
    assert result is None


@pytest.mark.asyncio
async def test_propose_from_tectonic_result_success():
    """Test propose_from_tectonic_result with valid shader."""
    master = MasterStage()

    class SuccessResult:
        success = True
        best_shader_code = """
        fn trap_enter() {}
        fn trap_ret() {}
        fn check_timer_interrupt() {}
        """
        best_mutation_id = "opt-001"
        final_ipc = 0.65
        baseline_ipc = 0.5
        improvement_pct = 0.30

    result = await master.propose_from_tectonic_result(SuccessResult())
    assert result is not None
    assert result.capability_type == CapabilityType.SHADER_PARAMETER
    assert "+30.0% IPC" in result.modification_description
