"""
Master Stage - Subprocess Mirror Bridge

Enables isolated validation of perception upgrades by running 
proposed code in a shadow process and comparing results against 
benchmarks.
"""
import asyncio
import json
import logging
import subprocess
import sys
import os
from pathlib import Path
from typing import Dict, Any, List, Optional, Tuple

from systems.evolution_daemon.safety.data_structures import EvolutionProposal, SandboxResult
from systems.evolution_daemon.safety.sandbox_manager import SandboxManager

logger = logging.getLogger("evolution_daemon.mirror_bridge")

class MirrorValidationResult:
    """Outcome of a mirror validation run"""
    def __init__(
        self, 
        success: bool, 
        accuracy_score: float, 
        immortality_passed: bool,
        metrics: Dict[str, Any],
        issues: List[str] = None
    ):
        self.success = success
        self.accuracy_score = accuracy_score
        self.immortality_passed = immortality_passed
        self.metrics = metrics
        self.issues = issues or []

class SubprocessMirrorBridge:
    """
    Bridge for running perception benchmarks in an isolated shadow process.
    """
    
    def __init__(self, sandbox_manager: SandboxManager):
        self.sandbox_manager = sandbox_manager

    async def validate_proposal(
        self, 
        proposal: EvolutionProposal,
        benchmark_suite_path: str = "systems/evolution_daemon/benchmarks/visual/perception_benchmark.py"
    ) -> MirrorValidationResult:
        """
        Run mirror validation for a master stage proposal.
        """
        logger.info(f"🪞 Starting mirror validation for {proposal.proposal_id}")
        
        sandbox_path = None
        try:
            # 1. Create sandbox and apply changes
            sandbox_path = await self.sandbox_manager.create_sandbox(proposal)
            diff_applied = await self.sandbox_manager.apply_diff(sandbox_path, proposal.diff_content)
            
            if not diff_applied:
                return MirrorValidationResult(
                    success=False,
                    accuracy_score=0.0,
                    immortality_passed=False,
                    metrics={},
                    issues=["Failed to apply diff to mirror sandbox"]
                )

            # 2. Spawn shadow runner subprocess
            # We use a dedicated script to run the benchmarks in the sandbox context
            runner_script = Path(__file__).parent / "shadow_perception_runner.py"
            
            result = subprocess.run(
                [sys.executable, str(runner_script), sandbox_path],
                capture_output=True,
                text=True,
                timeout=60,
                cwd=os.getcwd() # Run from root to maintain imports
            )
            
            if result.returncode != 0:
                logger.error(f"Shadow runner failed: {result.stderr}")
                return MirrorValidationResult(
                    success=False,
                    accuracy_score=0.0,
                    immortality_passed=False,
                    metrics={},
                    issues=[f"Shadow runner exited with code {result.returncode}: {result.stderr[:200]}"]
                )

            # 3. Parse and evaluate results
            try:
                data = json.loads(result.stdout)
                return self._evaluate_results(data)
            except json.JSONDecodeError:
                logger.error(f"Failed to parse shadow runner output: {result.stdout}")
                return MirrorValidationResult(
                    success=False,
                    accuracy_score=0.0,
                    immortality_passed=False,
                    metrics={},
                    issues=["Invalid JSON output from shadow runner"]
                )

        except Exception as e:
            logger.error(f"Mirror validation error: {e}")
            return MirrorValidationResult(
                success=False,
                accuracy_score=0.0,
                immortality_passed=False,
                metrics={},
                issues=[str(e)]
            )
        finally:
            if sandbox_path:
                await self.sandbox_manager.cleanup(sandbox_path)

    def _evaluate_results(self, data: Dict[str, Any]) -> MirrorValidationResult:
        """Evaluate benchmark results against the Balanced Validation Matrix."""
        accuracy = data.get("overall_accuracy", 0.0)
        immortality = data.get("immortality_passed", False)
        metrics = data.get("metrics", {})
        issues = data.get("issues", [])
        
        # Balanced Matrix Logic
        # Safety (Immortality) is MANDATORY
        # Accuracy must be >= threshold (e.g. 0.8)
        success = immortality and accuracy >= 0.8
        
        if not immortality:
            issues.append("MANDATORY: Immortality checks failed (Terminal/Anchors not found)")
        if accuracy < 0.8:
            issues.append(f"ACCURACY: Perception score {accuracy:.2f} below threshold 0.80")
            
        return MirrorValidationResult(
            success=success,
            accuracy_score=accuracy,
            immortality_passed=immortality,
            metrics=metrics,
            issues=issues
        )
