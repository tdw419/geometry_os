"""
Evolution Daemon V11 - Safety Pipeline Package

This package provides the complete V11 safety pipeline for the Evolution Daemon:

Components:
- SandboxManager: Two-stage pre-commit validation (syntax, imports, heartbeat tests)
- GuardianGate: AI-powered code review with security and logic checks
- TierRouter: Risk-based classification (Tier 1-3)
- GitIntegration: Atomic commits with structured messages and rollback
- PostCommitMonitor: Tiered health monitoring after commits
- EvolutionRecovery: Automated regression handling

Data Structures:
- EvolutionProposal: Describes a proposed code change
- SandboxResult: Results of sandbox validation
- GuardianVerdict: AI review decision
- MonitoringResult: Post-commit health check results
- RecoveryAction: Actions to take on regression
- EvolutionResult: Final outcome of evolution attempt

Usage:
    from systems.evolution_daemon.safety import (
        EvolutionProposal, SandboxManager, GuardianGate,
        TierRouter, GitIntegration, PostCommitMonitor
    )

    # Create proposal
    proposal = EvolutionProposal(
        proposal_id="evolve-001",
        goal="Fix bug in evolution loop",
        target_files=["daemon.py"],
        diff_content="+ fix line\\n- old line"
    )

    # Validate in sandbox
    sandbox = SandboxManager()
    result = await sandbox.validate(proposal)

    # Review with Guardian
    guardian = GuardianGate(zai_bridge=zai)
    verdict = await guardian.review(proposal, result)

    # Classify tier
    router = TierRouter()
    tier = router.classify(proposal, verdict)

    # Commit or create PR
    git = GitIntegration()
    if tier < 3:
        sha = await git.commit_evolution(proposal, verdict, tier)
    else:
        branch = await git.create_pr_branch(proposal)

    # Monitor after commit
    monitor = PostCommitMonitor(git, webmcp)
    health = await monitor.monitor(sha, tier)
"""

from .data_structures import (
    EvolutionProposal,
    SandboxResult,
    GuardianVerdict,
    MonitoringResult,
    RecoveryAction,
    EvolutionResult,
)
from .sandbox_manager import SandboxManager
from .guardian_gate import GuardianGate
from .tier_router import TierRouter
from .git_integration import GitIntegration
from .post_commit_monitor import PostCommitMonitor, EvolutionRecovery

__all__ = [
    # Data structures
    "EvolutionProposal",
    "SandboxResult",
    "GuardianVerdict",
    "MonitoringResult",
    "RecoveryAction",
    "EvolutionResult",
    # Components
    "SandboxManager",
    "GuardianGate",
    "TierRouter",
    "GitIntegration",
    "PostCommitMonitor",
    "EvolutionRecovery",
]

__version__ = "11.0.0"
