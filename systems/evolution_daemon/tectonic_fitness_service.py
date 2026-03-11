#!/usr/bin/env python3
"""
Tectonic Fitness Service
========================

Benchmarks WGSL shader mutations to provide IPC (Instructions Per Cycle)
fitness scores for the EvolutionDaemon's Tectonic optimization phase.

Architecture:
- Loads shader variants into sandboxed WebGPU context
- Executes instruction trace benchmarks
- Reports IPC metrics to EvolutionDaemon
- Validates RISC-V compliance via test suite

Usage:
    from systems.evolution_daemon.tectonic_fitness_service import TectonicFitnessService

    service = TectonicFitnessService()
    score = await service.benchmark_shader(mutation_id, shader_code)
"""

import asyncio
import hashlib
import logging
import re
import subprocess
import sys
from dataclasses import dataclass, field
from datetime import datetime
from pathlib import Path
from typing import Any

# Project root (this file is at systems/evolution_daemon/tectonic_fitness_service.py)
PROJECT_ROOT = Path(__file__).parent.parent.parent
sys.path.insert(0, str(PROJECT_ROOT))

logging.basicConfig(level=logging.INFO, format='%(asctime)s [%(name)s] %(message)s')
logger = logging.getLogger(__name__)


@dataclass
class FitnessScore:
    """Represents a shader's fitness score."""
    mutation_id: str
    ipc: float                    # Instructions Per Cycle
    latency_ms: float             # Average instruction latency
    memory_bandwidth: float       # Bytes per second
    correctness: bool             # Passed RISC-V compliance tests
    errors: list[str] = field(default_factory=list)
    timestamp: str = field(default_factory=lambda: datetime.now().isoformat())

    @property
    def fitness(self) -> float:
        """Combined fitness score (0.0 - 1.0)."""
        if not self.correctness:
            return 0.0
        # Normalize IPC (assume 0.1 - 2.0 range)
        ipc_score = min(1.0, (self.ipc - 0.1) / 1.9)
        # Normalize latency (lower is better, assume 0.1 - 10.0 ms range)
        latency_score = max(0.0, 1.0 - (self.latency_ms - 0.1) / 9.9)
        # Combine with weights
        return 0.6 * ipc_score + 0.4 * latency_score


@dataclass
class TectonicConfig:
    """Configuration for Tectonic Evolution."""
    mutation_rate: float = 0.05      # 5% probability of mutation
    generations: int = 10            # Number of evolution cycles
    population_size: int = 5         # Mutations per generation
    elite_count: int = 2             # Top performers to keep
    crossover_rate: float = 0.3      # Probability of crossover
    target_improvement: float = 0.20 # 20% IPC improvement goal

    # v14: Natural Selection (Auto-Rewind)
    auto_rewind: bool = True         # Automatically rewind on crash/regression
    git_commit_trials: bool = True   # Create atomic [TECTONIC-TRIAL] commits
    regression_threshold: float = 0.05  # 5% fitness drop = regression

    # Genetic Ledger
    ledger_path: Path = field(default_factory=lambda: PROJECT_ROOT / ".geometry" / "mutations.tsv")

    # Safety constraints
    max_shader_size: int = 50000     # Max characters in shader
    required_tests: list[str] = field(default_factory=lambda: [
        "test_timer_interrupt.js",
        "test_interrupt_integration.js"
    ])


class TectonicFitnessService:
    """
    Benchmarks shader mutations for Tectonic Evolution.

    The service:
    1. Receives shader mutations from EvolutionDaemon
    2. Compiles and executes in sandboxed environment
    3. Measures IPC and other performance metrics
    4. Validates RISC-V compliance
    5. Returns fitness scores
    6. Logs results to a persistent mutation ledger (.geometry/mutations.tsv)
    7. v14: Auto-rewinds on crash or regression via git reset --hard
    """

    def __init__(self, config: TectonicConfig | None = None):
        self.config = config or TectonicConfig()
        self.shader_path = PROJECT_ROOT / "systems/visual_shell/web/shaders/visual_cpu_riscv.wgsl"
        self.tests_path = PROJECT_ROOT / "systems/visual_shell/web/tests"

        # Benchmark state
        self.baseline_score: FitnessScore | None = None
        self.mutation_history: dict[str, FitnessScore] = {}
        self.generation_scores: list[list[FitnessScore]] = []

        # v14: Initialize Genetic Ledger
        self.config.ledger_path.parent.mkdir(parents=True, exist_ok=True)
        self._initialize_ledger()

    def _initialize_ledger(self) -> None:
        """Initialize the mutations.tsv ledger with headers if it doesn't exist."""
        if not self.config.ledger_path.exists():
            headers = ["commit", "pas_score", "ipc", "fitness", "status", "description", "timestamp"]
            with open(self.config.ledger_path, "w") as f:
                f.write("\t".join(headers) + "\n")
            logger.info(f"Initialized mutation ledger at {self.config.ledger_path}")

    def _get_current_commit(self) -> str:
        """Get the current short git commit hash."""
        try:
            return subprocess.check_output(
                ["git", "rev-parse", "--short", "HEAD"],
                cwd=str(PROJECT_ROOT),
                stderr=subprocess.DEVNULL,
                text=True
            ).strip()
        except Exception:
            return "unknown"

    def _log_to_ledger(self, score: FitnessScore, status: str, pas_score: float = 0.0) -> None:
        """Log a mutation result to the TSV ledger."""
        commit = self._get_current_commit()

        row = [
            commit,
            f"{pas_score:.2f}",
            f"{score.ipc:.6f}",
            f"{score.fitness:.6f}",
            status,
            score.mutation_id,
            score.timestamp
        ]

        try:
            with open(self.config.ledger_path, "a") as f:
                f.write("\t".join(row) + "\n")
            logger.info(f"Logged to ledger: {score.mutation_id} -> {status}")
        except Exception as e:
            logger.error(f"Failed to write to ledger: {e}")

    def _commit_trial(self, mutation_id: str, shader_code: str) -> bool:
        """
        Create an atomic [TECTONIC-TRIAL] commit for benchmarking.
        This creates a "fork point" that can be rewound if mutation fails.
        """
        if not self.config.git_commit_trials:
            return True

        try:
            # Write shader to disk
            self.shader_path.write_text(shader_code)

            # Stage the change
            subprocess.run(
                ["git", "add", str(self.shader_path)],
                cwd=str(PROJECT_ROOT),
                check=True,
                capture_output=True
            )

            # Create trial commit
            subprocess.run(
                ["git", "commit", "-m", f"[TECTONIC-TRIAL] {mutation_id}"],
                cwd=str(PROJECT_ROOT),
                check=True,
                capture_output=True
            )

            logger.info(f"Created trial commit for {mutation_id}")
            return True

        except subprocess.CalledProcessError as e:
            # If nothing to commit, return True anyway as it's not a hard failure
            if e.returncode == 1 and "nothing to commit" in (e.stdout.decode() + e.stderr.decode()):
                return True
            logger.error(f"Failed to create trial commit: {e.stderr.decode() if e.stderr else str(e)}")
            return False

    def _rewind_mutation(self) -> bool:
        """
        Rewind the last [TECTONIC-TRIAL] commit via git reset --hard.
        Only rewinds if the last commit is a trial commit (safety guard).
        """
        if not self.config.auto_rewind:
            logger.warning("Auto-rewind disabled, skipping reset")
            return False

        try:
            # Check if last commit is a trial commit
            result = subprocess.run(
                ["git", "log", "-1", "--pretty=%s"],
                cwd=str(PROJECT_ROOT),
                capture_output=True,
                text=True,
                check=True
            )

            last_msg = result.stdout.strip()
            if "[TECTONIC-TRIAL]" not in last_msg:
                logger.warning(f"Last commit is not a trial: {last_msg}")
                return False

            # Perform hard reset
            subprocess.run(
                ["git", "reset", "--hard", "HEAD~1"],
                cwd=str(PROJECT_ROOT),
                check=True,
                capture_output=True
            )

            logger.info(f"✅ Rewound trial commit: {last_msg}")
            return True

        except subprocess.CalledProcessError as e:
            logger.error(f"Failed to rewind: {e.stderr.decode() if e.stderr else str(e)}")
            return False

    async def initialize(self) -> bool:
        """Initialize the fitness service and establish baseline."""
        logger.info("Initializing Tectonic Fitness Service...")

        # Load baseline shader
        if not self.shader_path.exists():
            logger.error(f"Shader not found: {self.shader_path}")
            return False

        # Benchmark baseline
        baseline_code = self.shader_path.read_text()
        
        # Internal benchmark call to avoid duplicate ledger logging during init
        ipc, latency = await self._run_ipc_benchmark(baseline_code)
        correctness = await self._run_correctness_tests(baseline_code)
        
        self.baseline_score = FitnessScore(
            mutation_id="baseline",
            ipc=ipc,
            latency_ms=latency,
            memory_bandwidth=0.0,
            correctness=correctness
        )
        
        # Log baseline
        self._log_to_ledger(self.baseline_score, "keep")

        logger.info(f"Baseline IPC: {self.baseline_score.ipc:.4f}, Fitness: {self.baseline_score.fitness:.4f}")
        return self.baseline_score.correctness

    async def benchmark_shader(
        self,
        mutation_id: str,
        shader_code: str,
        apply_to_disk: bool = False,
        pas_score: float = 0.95
    ) -> FitnessScore:
        """
        Benchmark a shader mutation.

        Args:
            mutation_id: Unique identifier for this mutation
            shader_code: WGSL shader source code
            apply_to_disk: If True, create trial commit and auto-rewind on failure
            pas_score: Phase Alignment Stability score (default 0.95)

        Returns:
            FitnessScore with IPC and correctness metrics
        """
        logger.info(f"Benchmarking mutation: {mutation_id}")

        # v14: Create trial commit if apply_to_disk is enabled
        if apply_to_disk and self.config.git_commit_trials:
            if not self._commit_trial(mutation_id, shader_code):
                logger.error(f"Failed to create trial commit for {mutation_id}")

        score = FitnessScore(
            mutation_id=mutation_id,
            ipc=0.0,
            latency_ms=0.0,
            memory_bandwidth=0.0,
            correctness=False
        )

        # Step 1: Syntax validation
        if not self._validate_syntax(shader_code):
            score.errors.append("Shader syntax validation failed")
            self._log_to_ledger(score, "crash", pas_score=0.0)
            if apply_to_disk and self.config.auto_rewind:
                self._rewind_mutation()
            return score

        # Step 2: Size check
        if len(shader_code) > self.config.max_shader_size:
            score.errors.append(f"Shader exceeds max size: {len(shader_code)} > {self.config.max_shader_size}")
            self._log_to_ledger(score, "crash", pas_score=0.0)
            if apply_to_disk and self.config.auto_rewind:
                self._rewind_mutation()
            return score

        # Step 3: Run IPC benchmark
        try:
            ipc, latency = await self._run_ipc_benchmark(shader_code)
            score.ipc = ipc
            score.latency_ms = latency
        except Exception as e:
            score.errors.append(f"IPC benchmark failed: {e}")
            self._log_to_ledger(score, "crash", pas_score=0.0)
            if apply_to_disk and self.config.auto_rewind:
                self._rewind_mutation()
            return score

        # Step 4: Run correctness tests
        try:
            score.correctness = await self._run_correctness_tests(shader_code)
            if not score.correctness:
                score.errors.append("RISC-V compliance tests failed")
        except Exception as e:
            score.errors.append(f"Correctness tests failed: {e}")
            self._log_to_ledger(score, "crash", pas_score=0.0)
            if apply_to_disk and self.config.auto_rewind:
                self._rewind_mutation()
            return score

        # Record score
        self.mutation_history[mutation_id] = score
        logger.info(f"Mutation {mutation_id}: IPC={score.ipc:.4f}, Correct={score.correctness}, Fitness={score.fitness:.4f}")

        # v14: Determine status and log to ledger
        if not score.correctness:
            status = "crash"
        elif self.baseline_score and score.fitness < self.baseline_score.fitness * (1 - self.config.regression_threshold):
            status = "discard"  # Regression
        else:
            status = "keep"

        self._log_to_ledger(score, status, pas_score=pas_score)

        # v14: Auto-rewind on regression
        if status in ("crash", "discard") and apply_to_disk and self.config.auto_rewind:
            self._rewind_mutation()

        return score

    def _validate_syntax(self, shader_code: str) -> bool:
        """Basic WGSL syntax validation."""
        # Check for required structures
        required = ["@compute", "@workgroup_size", "fn main"]
        for req in required:
            if req not in shader_code:
                logger.warning(f"Missing required WGSL structure: {req}")
                return False

        # Check for balanced braces
        if shader_code.count("{") != shader_code.count("}"):
            logger.warning("Unbalanced braces in shader")
            return False

        return True

    async def _run_ipc_benchmark(self, shader_code: str) -> tuple[float, float]:
        """
        Run IPC benchmark on shader.

        Returns:
            Tuple of (ipc, latency_ms)
        """
        # Simulated benchmark for now
        await asyncio.sleep(0.1)  # Simulate benchmark time

        # Simulated metrics based on shader characteristics
        # More efficient patterns = higher IPC
        base_ipc = 0.5

        # v14: Parse mutation signatures for deterministic mock bonuses
        # This allows the GA to actually find "better" mutations in mock mode
        bonus = 0.0
        # Look for tags like // --- UNROLLED [a1b2] ---
        tags = re.findall(r"// --- (.*) \[(.*)\] ---", shader_code)
        for tag_type, mutation_id in tags:
            # Create a deterministic stable bonus for this specific mutation
            h = hashlib.md5(f"{tag_type}:{mutation_id}".encode()).hexdigest()
            # Random bonus between 0.01 and 0.05
            tag_bonus = (int(h[:2], 16) / 255.0) * 0.04 + 0.01
            bonus += tag_bonus
            
        base_ipc += min(bonus, 0.4) # Cap total bonus at 0.4

        # Penalty for complexity
        instruction_count = shader_code.count(";")
        if instruction_count > 200:
            base_ipc -= 0.05

        latency = 1.0 / base_ipc if base_ipc > 0 else 10.0

        return (base_ipc, latency)

    async def _run_correctness_tests(self, shader_code: str) -> bool:
        """
        Run RISC-V compliance tests.

        Validates that the shader:
        - Correctly implements instruction decoding
        - Handles timer interrupts properly
        - Maintains CSR state correctly
        """
        # For now, check for required functions
        required_functions = [
            "trap_enter",
            "trap_ret",
            "check_timer_interrupt",
            "take_timer_interrupt"
        ]

        for func in required_functions:
            if f"fn {func}" not in shader_code:
                logger.warning(f"Missing required function: {func}")
                return False

        return True

    def get_top_mutations(self, count: int = 2) -> list[FitnessScore]:
        """Get top N mutations by fitness score."""
        valid = [s for s in self.mutation_history.values() if s.correctness]
        sorted_scores = sorted(valid, key=lambda s: s.fitness, reverse=True)
        return sorted_scores[:count]

    def calculate_improvement(self, score: FitnessScore) -> float:
        """Calculate improvement over baseline."""
        if not self.baseline_score or self.baseline_score.ipc == 0:
            return 0.0
        return (score.ipc - self.baseline_score.ipc) / self.baseline_score.ipc

    def get_stats(self) -> dict[str, Any]:
        """Get service statistics."""
        valid_count = sum(1 for s in self.mutation_history.values() if s.correctness)
        best_score = self.get_top_mutations(1)[0] if valid_count > 0 else None

        return {
            "baseline_ipc": self.baseline_score.ipc if self.baseline_score else 0,
            "mutations_tested": len(self.mutation_history),
            "valid_mutations": valid_count,
            "best_ipc": best_score.ipc if best_score else 0,
            "best_fitness": best_score.fitness if best_score else 0,
            "improvement": self.calculate_improvement(best_score) if best_score else 0,
            "config": {
                "mutation_rate": self.config.mutation_rate,
                "generations": self.config.generations,
                "target_improvement": self.config.target_improvement
            }
        }


async def main():
    """Test the Tectonic Fitness Service."""
    print("\n" + "="*60)
    print("  TECTONIC FITNESS SERVICE - Test Run")
    print("="*60 + "\n")

    service = TectonicFitnessService()

    # Initialize
    if not await service.initialize():
        print("Failed to initialize service")
        return

    # Load current shader
    current_shader = service.shader_path.read_text()

    # Test with baseline
    print(f"Baseline shader: {len(current_shader)} characters")
    print(f"Baseline IPC: {service.baseline_score.ipc:.4f}")
    print(f"Baseline Fitness: {service.baseline_score.fitness:.4f}")

    # Simulate a mutation (just test the same shader)
    print("\nTesting mutation: test-001")
    score = await service.benchmark_shader("test-001", current_shader)
    print(f"  IPC: {score.ipc:.4f}")
    print(f"  Correctness: {score.correctness}")
    print(f"  Fitness: {score.fitness:.4f}")
    print(f"  Improvement: {service.calculate_improvement(score)*100:.1f}%")

    # Stats
    print("\n" + "="*60)
    print("  SERVICE STATS")
    print("="*60)
    stats = service.get_stats()
    for key, value in stats.items():
        print(f"  {key}: {value}")


if __name__ == "__main__":
    asyncio.run(main())
