"""
Phase 57: Predictive Simulation (The Dreaming Kernel) - Trauma Log

Records 'Genetic Trauma' - code patterns that caused fractures in dreams, 
preventing the system from repeating the same mistakes.
"""

import json
import logging
from dataclasses import asdict, dataclass
from pathlib import Path

logger = logging.getLogger("evolution_daemon.trauma_log")

@dataclass
class GeneticTrauma:
    """Record of a code pattern that caused a fracture in a dream."""
    proposal_id: str
    timestamp: float
    reflex_score: float
    target_files: list[str]
    diff_summary: str
    fracture_signal: str
    dream_frame_id: str | None = None

class TraumaLog:
    """
    Records Genetic Trauma to prevent future similar mutations.
    """

    TRAUMA_FILE = ".loop/genetic_trauma.jsonl"

    def __init__(self, project_root: Path | None = None):
        self.project_root = project_root or Path.cwd()
        self.log_path = self.project_root / self.TRAUMA_FILE
        self.log_path.parent.mkdir(parents=True, exist_ok=True)

    def record_trauma(self, trauma: GeneticTrauma):
        """Append a trauma record to the log."""
        try:
            with open(self.log_path, "a") as f:
                f.write(json.dumps(asdict(trauma)) + "\n")
            logger.info(f"🩸 Recorded Genetic Trauma for {trauma.proposal_id}")
        except Exception as e:
            logger.error(f"Failed to record genetic trauma: {e}")

    def get_recent_trauma(self, limit: int = 100) -> list[GeneticTrauma]:
        """Retrieve recent trauma records."""
        traumas = []
        if not self.log_path.exists():
            return []

        try:
            with open(self.log_path) as f:
                lines = f.readlines()
                for line in lines[-limit:]:
                    try:
                        data = json.loads(line)
                        traumas.append(GeneticTrauma(**data))
                    except Exception:
                        continue
        except Exception as e:
            logger.error(f"Failed to read genetic trauma: {e}")

        return traumas
