"""
Evolution Daemon V11/V13 - Safety Pipeline Package

This package provides the complete V11/V13 safety pipeline for the Evolution Daemon:

V11 Components:
- SandboxManager: Two-stage pre-commit validation (syntax, imports, heartbeat tests)
- GuardianGate: AI-powered code review with security and logic checks
- TierRouter: Risk-based classification (Tier 1-3)
- GitIntegration: Atomic commits with structured messages and rollback
- PostCommitMonitor: Tiered health monitoring after commits
- EvolutionRecovery: Automated regression handling

V13 Components:
- PrognosticsStore: Persistent storage for health predictions
- PrognosticsEngine: ML-based predictive health monitoring
- MetabolismMonitor: Adaptive resource throttling

Data Structures:
- EvolutionProposal: Describes a proposed code change
- SandboxResult: Results of sandbox validation
- GuardianVerdict: AI review decision
- MonitoringResult: Post-commit health check results
- RecoveryAction: Actions to take on regression
- EvolutionResult: Final outcome of evolution attempt
- HealthPrediction: Predicted health state of an RTS file (V13)
- MetabolismState: Current system resource state (V13)
- ThrottleLevel: Resource throttle levels (V13)

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

    # V13: Predictive health monitoring
    store = PrognosticsStore()
    engine = PrognosticsEngine(store)
    prediction = await engine.predict_health("rts_file.png")

    # V13: Metabolism monitoring
    metabolism = MetabolismMonitor()
    state = await metabolism.check_resources()
"""

from .data_structures import (
    EvolutionProposal,
    SandboxResult,
    GuardianVerdict,
    MonitoringResult,
    RecoveryAction,
    EvolutionResult,
    # V13 additions
    HealthPrediction,
    MetabolismState,
    ThrottleLevel,
    # V13.1 behavioral defense additions
    AgentBehavioralProfile,
    BehavioralEvent,
)
from .sandbox_manager import SandboxManager
from .guardian_gate import GuardianGate
from .tier_router import TierRouter
from .git_integration import GitIntegration
from .post_commit_monitor import PostCommitMonitor, EvolutionRecovery
# V13 components
from .prognostics_store import PrognosticsStore
from .prognostics_engine import PrognosticsEngine
from .metabolism_monitor import MetabolismMonitor
# V13.1 behavioral defense components
from .behavioral_monitor import BehavioralMonitor
from .wordpress_sentinel import WordPressSentinel

__all__ = [
    # Data structures
    "EvolutionProposal",
    "SandboxResult",
    "GuardianVerdict",
    "MonitoringResult",
    "RecoveryAction",
    "EvolutionResult",
    # V13 data structures
    "HealthPrediction",
    "MetabolismState",
    "ThrottleLevel",
    # V13.1 behavioral defense data structures
    "AgentBehavioralProfile",
    "BehavioralEvent",
    # V11 Components
    "SandboxManager",
    "GuardianGate",
    "TierRouter",
    "GitIntegration",
    "PostCommitMonitor",
    "EvolutionRecovery",
    # V13 Components
    "PrognosticsStore",
    "PrognosticsEngine",
    "MetabolismMonitor",
    # V13.1 behavioral defense components
    "BehavioralMonitor",
    "WordPressSentinel",
]

__version__ = "13.1.0"
