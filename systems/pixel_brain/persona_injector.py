"""
PersonaInjector - Bridges Agency Agents to the PixelBrain substrate.

Loads agent definitions from apps/agency-agents and injects them into
PixelBrain's cognitive context based on map sector or task type.
"""

import logging
from pathlib import Path

logger = logging.getLogger(__name__)

class PersonaInjector:
    """
    Injects specialized AI personas from the Agency into PixelBrain prompts.
    """

    def __init__(self, agency_root: str = "apps/agency-agents"):
        self.agency_root = Path(agency_root)
        self.persona_map = {
            # Engineering Division
            "ai_engineer": "engineering/engineering-ai-engineer.md",
            "security_engineer": "engineering/engineering-security-engineer.md",
            "rapid_prototyper": "engineering/engineering-rapid-prototyper.md",
            "senior_developer": "engineering/engineering-senior-developer.md",

            # Testing Division
            "reality_checker": "testing/testing-reality-checker.md",
            "evidence_collector": "testing/testing-evidence-collector.md",
            "performance_benchmarker": "testing/testing-performance-benchmarker.md",

            # Spatial Computing Division
            "metal_engineer": "spatial-computing/macos-spatial-metal-engineer.md",
            "xr_architect": "spatial-computing/xr-interface-architect.md",

            # Specialized
            "orchestrator": "specialized/agents-orchestrator.md"
        }

        # Sector to Persona mapping
        self.sector_map = {
            "security_sector": "security_engineer",
            "mutation_lab": "rapid_prototyper",
            "validation_zone": "reality_checker",
            "performance_core": "performance_benchmarker",
            "rendering_bridge": "metal_engineer",
            "cognitive_hub": "orchestrator"
        }

    def load_persona(self, persona_id: str) -> str | None:
        """Load the raw markdown definition of a persona."""
        rel_path = self.persona_map.get(persona_id)
        if not rel_path:
            logger.warning(f"Persona '{persona_id}' not found in map.")
            return None

        full_path = self.agency_root / rel_path
        if not full_path.exists():
            logger.error(f"Persona file not found at {full_path}")
            return None

        try:
            with open(full_path) as f:
                return f.read()
        except Exception as e:
            logger.error(f"Error reading persona file: {e}")
            return None

    def get_system_prompt(self, sector_type: str) -> str:
        """
        Generate a system prompt based on the persona assigned to a sector.
        """
        persona_id = self.sector_map.get(sector_type)
        if not persona_id:
            return "You are an intelligent spatial agent in Geometry OS."

        persona_md = self.load_persona(persona_id)
        if not persona_md:
            return "You are an intelligent spatial agent in Geometry OS."

        # Extract the core mission and rules from markdown
        # (A simple extraction logic for now)
        prompt = f"You are the {persona_id.replace('_', ' ').title()} inhabiting the {sector_type.replace('_', ' ').title()} of Geometry OS.\n\n"
        prompt += "Your operational parameters are defined by the following persona:\n"
        prompt += "--- PERSONA DEFINITION ---\n"
        prompt += persona_md
        prompt += "\n--- END PERSONA DEFINITION ---\n\n"
        prompt += "Apply these rules and mission to every decision you make within this sector."

        return prompt

    def inject_into_prompt(self, prompt: str, sector_type: str) -> str:
        """
        Inject persona context into a specific user prompt.
        """
        system_context = self.get_system_prompt(sector_type)
        return f"SYSTEM: {system_context}\n\nUSER REQUEST: {prompt}"
