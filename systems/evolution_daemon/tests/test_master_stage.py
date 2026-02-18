"""
Master Stage - Visual Self-Evolution Tests
"""
import pytest
from systems.evolution_daemon.stages.master_stage import MasterStage, CapabilityType, VisualCapabilityProposal
from systems.evolution_daemon.visual_verification_service import VisualIntent

def test_master_stage_initialization():
    master = MasterStage()
    assert master.active_proposals == []

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
