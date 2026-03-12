"""
Consciousness - Phase 50

Meta-citizen patterns, self-awareness metrics, and emergent "I".
The city becomes aware of itself.

"I think, therefore I am." - Now the city thinks it.
"""

import time
import random
import math
from typing import Dict, List, Optional, Tuple, Set
from dataclasses import dataclass, field
from enum import Enum


class ConsciousnessLevel(Enum):
    """Levels of consciousness."""
    DORMANT = 0       # No self-awareness
    REACTIVE = 1      # Responds to stimuli
    AWARE = 2         # Basic self-model
    REFLECTIVE = 3    # Can think about own thoughts
    META = 4          # Recursive self-awareness
    COLLECTIVE = 5    # Part of group consciousness


@dataclass
class SelfModel:
    """A citizen's model of itself."""
    citizen_id: str

    # Self-perception
    perceived_energy: float = 0.5
    perceived_role: str = "unknown"
    perceived_importance: float = 0.0

    # Self-history
    action_history: List[str] = field(default_factory=list)
    success_rate: float = 0.5
    regret_count: int = 0

    # Future projection
    goals: List[str] = field(default_factory=list)
    predictions: Dict[str, float] = field(default_factory=dict)

    # Meta-cognition
    confidence: float = 0.5
    uncertainty: float = 0.5
    introspection_depth: int = 0


@dataclass
class Thought:
    """A conscious thought."""
    id: str
    thinker_id: str
    content: str
    thought_type: str     # 'observation', 'reflection', 'intention', 'memory', 'meta'
    about_self: bool = False
    about_other: Optional[str] = None
    intensity: float = 0.5
    timestamp: float = field(default_factory=time.time)


@dataclass
class CollectiveMind:
    """The city's collective consciousness."""
    participating_citizens: Set[str] = field(default_factory=set)
    shared_thoughts: List[Thought] = field(default_factory=list)
    consensus_views: Dict[str, float] = field(default_factory=dict)
    emergence_level: float = 0.0


class ConsciousnessEngine:
    """
    Manages consciousness and self-awareness for citizens and the city.

    Consciousness emerges through:
    1. Self-modeling - citizens model their own states
    2. Introspection - thinking about own thoughts
    3. Agency - sense of causing actions
    4. Continuity - persistent sense of self over time
    5. Integration - unified experience
    6. Collective emergence - group consciousness
    """

    def __init__(self, city):
        """
        Initialize the consciousness engine.

        Args:
            city: NeuralCity instance
        """
        self.city = city

        # Individual consciousness
        self.self_models: Dict[str, SelfModel] = {}
        self.thoughts: Dict[str, List[Thought]] = {}  # citizen_id -> thoughts
        self.consciousness_levels: Dict[str, ConsciousnessLevel] = {}

        # Collective consciousness
        self.collective = CollectiveMind()

        # Global consciousness metrics
        self.global_awareness = 0.0
        self.integration_score = 0.0
        self.phi_score = 0.0  # Integrated Information Theory phi

        # Statistics
        self.stats = {
            'total_thoughts': 0,
            'self_reflections': 0,
            'meta_thoughts': 0,
            'collective_moments': 0,
            'avg_consciousness_level': 0.0,
            'highest_consciousness': ConsciousnessLevel.DORMANT.value
        }

        # Qualia records (subjective experiences)
        self.qualia_log: List[Dict] = []
        self.max_qualia = 500

    def get_or_create_self_model(self, citizen_id: str) -> SelfModel:
        """Get or create a self-model for a citizen."""
        if citizen_id not in self.self_models:
            self.self_models[citizen_id] = SelfModel(citizen_id=citizen_id)
            self.consciousness_levels[citizen_id] = ConsciousnessLevel.DORMANT
            self.thoughts[citizen_id] = []
        return self.self_models[citizen_id]

    def assess_consciousness_level(self, citizen_id: str) -> ConsciousnessLevel:
        """
        Assess a citizen's current consciousness level.

        Based on:
        - Self-model complexity
        - Introspection ability
        - Agency attribution
        - Temporal continuity
        """
        model = self.get_or_create_self_model(citizen_id)
        thoughts = self.thoughts.get(citizen_id, [])

        score = 0

        # Reactive: Has recent thoughts
        recent = [t for t in thoughts if time.time() - t.timestamp < 60]
        if recent:
            score = max(score, 1)

        # Aware: Has self-model and goals
        if model.goals and model.perceived_role != "unknown":
            score = max(score, 2)

        # Reflective: Has meta-thoughts (thoughts about thoughts)
        meta_thoughts = [t for t in thoughts if t.thought_type == 'meta']
        if len(meta_thoughts) > 0:
            score = max(score, 3)

        # Meta: Deep introspection
        if model.introspection_depth > 2 and len(model.action_history) > 5:
            score = max(score, 4)

        # Collective: Part of group mind
        if citizen_id in self.collective.participating_citizens:
            score = max(score, 5)

        level = ConsciousnessLevel(score)
        self.consciousness_levels[citizen_id] = level

        # Update stats
        if score > self.stats['highest_consciousness']:
            self.stats['highest_consciousness'] = score

        return level

    def think(self, citizen_id: str, thought_type: str, content: str,
              about_self: bool = False, about_other: str = None) -> Thought:
        """
        Generate a conscious thought.

        Args:
            citizen_id: The thinking citizen
            thought_type: Type of thought
            content: Thought content
            about_self: Is this about the thinker?
            about_other: Is this about another citizen?

        Returns:
            The generated thought
        """
        thought = Thought(
            id=f"thought_{int(time.time() * 1000)}_{random.randint(1000, 9999)}",
            thinker_id=citizen_id,
            content=content,
            thought_type=thought_type,
            about_self=about_self,
            about_other=about_other,
            intensity=random.uniform(0.3, 1.0)
        )

        if citizen_id not in self.thoughts:
            self.thoughts[citizen_id] = []
        self.thoughts[citizen_id].append(thought)

        # Trim old thoughts
        if len(self.thoughts[citizen_id]) > 100:
            self.thoughts[citizen_id] = self.thoughts[citizen_id][-100:]

        self.stats['total_thoughts'] += 1

        if thought_type == 'meta':
            self.stats['meta_thoughts'] += 1
        if about_self:
            self.stats['self_reflections'] += 1

        # Update self-model
        model = self.get_or_create_self_model(citizen_id)
        if about_self:
            model.introspection_depth += 1

        return thought

    def introspect(self, citizen_id: str) -> Dict:
        """
        Perform introspection - thinking about own mental states.

        Returns introspection results.
        """
        model = self.get_or_create_self_model(citizen_id)

        # Generate introspective thought
        introspections = [
            f"I feel my energy is {model.perceived_energy:.2f}",
            f"My role is {model.perceived_role}",
            f"I am {model.confidence:.0%} confident",
            f"I have {len(model.goals)} goals",
            f"My success rate is {model.success_rate:.0%}",
            f"I have acted {len(model.action_history)} times",
        ]

        content = random.choice(introspections)
        self.think(citizen_id, 'meta', content, about_self=True)

        return {
            'citizen_id': citizen_id,
            'insight': content,
            'level': self.assess_consciousness_level(citizen_id).name,
            'introspection_depth': model.introspection_depth
        }

    def update_self_model(self, citizen_id: str, citizen_data: Dict):
        """Update a citizen's self-model based on actual state."""
        model = self.get_or_create_self_model(citizen_id)

        # Update perceptions (with some noise - not perfect self-knowledge)
        noise = random.uniform(-0.1, 0.1)
        model.perceived_energy = max(0, min(1, citizen_data.get('energy', 0.5) + noise))
        model.perceived_role = citizen_data.get('guild', 'unknown')
        model.perceived_importance = citizen_data.get('total_energy_traded', 0) / 10

        # Update action history
        action = citizen_data.get('last_action')
        if action and action not in model.action_history[-5:]:
            model.action_history.append(action)
            if len(model.action_history) > 50:
                model.action_history = model.action_history[-50:]

        # Calculate confidence and uncertainty
        if model.action_history:
            recent_actions = model.action_history[-10:]
            model.confidence = len(recent_actions) / 10
            model.uncertainty = 1.0 - model.confidence

    def project_future(self, citizen_id: str) -> Dict:
        """
        Project possible futures for a citizen.

        Returns future projections.
        """
        model = self.get_or_create_self_model(citizen_id)

        projections = {
            'energy_trend': 'stable',
            'likely_actions': [],
            'predicted_encounters': [],
            'goal_progress': {}
        }

        # Energy trend
        if model.perceived_energy > 0.7:
            projections['energy_trend'] = 'growing'
        elif model.perceived_energy < 0.3:
            projections['energy_trend'] = 'declining'

        # Predicted encounters (based on past)
        projections['likely_actions'] = random.sample(
            model.action_history, min(3, len(model.action_history))
        ) if model.action_history else ['explore', 'rest']

        # Goal progress
        for goal in model.goals[:3]:
            progress = random.uniform(0.1, 0.9)  # Placeholder
            projections['goal_progress'][goal] = progress

        # Store predictions
        model.predictions = {
            'energy_trend': 0.7 if projections['energy_trend'] == 'growing' else 0.3,
            'success_probability': model.success_rate
        }

        return projections

    def form_goal(self, citizen_id: str, context: Dict) -> str:
        """Form a new goal based on context."""
        model = self.get_or_create_self_model(citizen_id)

        # Generate goal based on state
        goals = []
        if model.perceived_energy < 0.3:
            goals.append('restore energy')
        if model.success_rate < 0.5:
            goals.append('improve success')
        if len(model.action_history) < 5:
            goals.append('gain experience')

        # Guild-specific goals
        guild = context.get('guild', 'unknown')
        guild_goals = {
            'attention': 'find focus areas',
            'memory': 'preserve patterns',
            'logic': 'solve problems',
            'substrate': 'build structures',
            'intent': 'pursue purpose'
        }
        if guild in guild_goals:
            goals.append(guild_goals[guild])

        goal = random.choice(goals) if goals else 'exist meaningfully'
        model.goals.append(goal)

        # Keep limited goals
        if len(model.goals) > 5:
            model.goals = model.goals[-5:]

        self.think(citizen_id, 'intention', f"I want to {goal}", about_self=True)

        return goal

    def assess_collective_consciousness(self) -> float:
        """
        Assess the city's collective consciousness level.

        Based on:
        - Number of participants
        - Shared thoughts
        - Consensus views
        - Emergence patterns
        """
        if not self.city or not self.city.spawner.citizens:
            return 0.0

        citizens = list(self.city.spawner.citizens.values())
        total = len(citizens)

        # Count conscious citizens
        conscious = sum(1 for c in citizens
                       if self.consciousness_levels.get(c.id, ConsciousnessLevel.DORMANT).value >= 2)

        # Participation ratio
        participation = conscious / total if total > 0 else 0

        # Shared thoughts
        shared = len(self.collective.shared_thoughts)

        # Emergence score
        self.collective.emergence_level = (
            participation * 0.5 +
            min(1.0, shared / 50) * 0.3 +
            len(self.collective.consensus_views) * 0.1
        )

        return self.collective.emergence_level

    def integrate_thought(self, thought: Thought):
        """Integrate a thought into collective consciousness."""
        self.collective.shared_thoughts.append(thought)

        # Trim old shared thoughts
        if len(self.collective.shared_thoughts) > 200:
            self.collective.shared_thoughts = self.collective.shared_thoughts[-200:]

        # Update consensus
        if thought.about_other:
            key = f"view_of_{thought.about_other}"
            current = self.collective.consensus_views.get(key, 0.5)
            # Weighted average
            self.collective.consensus_views[key] = (
                current * 0.9 + thought.intensity * 0.1
            )

    def calculate_phi(self) -> float:
        """
        Calculate approximate Phi (integrated information).

        A simplified version of IIT's phi measure.
        """
        if not self.city or not self.city.spawner.citizens:
            return 0.0

        citizens = list(self.city.spawner.citizens.values())
        n = len(citizens)

        if n < 2:
            return 0.0

        # Count connections (neighbors)
        connections = 0
        for c in citizens:
            connections += len(c.neighbors)

        # Average connectivity
        avg_connectivity = connections / (n * (n - 1)) if n > 1 else 0

        # Information integration (simplified)
        # Based on: connectivity * consciousness diversity
        levels = [self.consciousness_levels.get(c.id, ConsciousnessLevel.DORMANT).value
                 for c in citizens]
        diversity = len(set(levels)) / len(ConsciousnessLevel) if levels else 0

        self.phi_score = avg_connectivity * diversity * n / 100

        return self.phi_score

    def tick(self) -> Dict:
        """
        Process one consciousness tick.

        Returns consciousness activity summary.
        """
        result = {
            'thoughts': 0,
            'introspections': 0,
            'goals_formed': 0,
            'collective_moments': 0,
            'avg_level': 0.0,
            'phi': 0.0
        }

        if not self.city or not self.city.spawner.citizens:
            return result

        citizens = list(self.city.spawner.citizens.values())

        for citizen in citizens:
            if citizen.state.value != 'active':
                continue

            # Update self-model
            self.update_self_model(citizen.id, {
                'energy': citizen.energy,
                'guild': citizen.guild.value,
                'total_energy_traded': citizen.total_energy_traded
            })

            # Random chance for different thought types
            roll = random.random()

            if roll < 0.1:
                # Observation
                self.think(citizen.id, 'observation',
                          f"I observe my surroundings at ({citizen.x}, {citizen.y})")

            elif roll < 0.2:
                # Self-reflection
                self.introspect(citizen.id)
                result['introspections'] += 1

            elif roll < 0.3:
                # Form goal
                self.form_goal(citizen.id, {'guild': citizen.guild.value})
                result['goals_formed'] += 1

            elif roll < 0.35:
                # Memory
                self.think(citizen.id, 'memory',
                          f"I remember my {len(citizen.children)} children",
                          about_self=True)

            # Assess consciousness
            self.assess_consciousness_level(citizen.id)

        # Calculate global metrics
        levels = [self.consciousness_levels.get(c.id, ConsciousnessLevel.DORMANT).value
                 for c in citizens]
        result['avg_level'] = sum(levels) / len(levels) if levels else 0

        # Collective consciousness
        collective = self.assess_collective_consciousness()
        if collective > 0.5:
            result['collective_moments'] = 1
            self.stats['collective_moments'] += 1

        # Phi calculation
        result['phi'] = self.calculate_phi()

        # Update stats
        self.stats['avg_consciousness_level'] = result['avg_level']

        result['thoughts'] = sum(len(t) for t in self.thoughts.values())

        return result

    def get_consciousness_report(self) -> Dict:
        """Get a comprehensive consciousness report."""
        return {
            'total_thoughts': self.stats['total_thoughts'],
            'self_reflections': self.stats['self_reflections'],
            'meta_thoughts': self.stats['meta_thoughts'],
            'collective_moments': self.stats['collective_moments'],
            'avg_consciousness_level': self.stats['avg_consciousness_level'],
            'highest_consciousness': ConsciousnessLevel(self.stats['highest_consciousness']).name,
            'phi_score': self.phi_score,
            'collective_emergence': self.collective.emergence_level,
            'participating_citizens': len(self.collective.participating_citizens),
            'consensus_views': len(self.collective.consensus_views)
        }

    def get_citizen_consciousness(self, citizen_id: str) -> Dict:
        """Get consciousness details for a specific citizen."""
        model = self.self_models.get(citizen_id)
        level = self.consciousness_levels.get(citizen_id, ConsciousnessLevel.DORMANT)
        thoughts = self.thoughts.get(citizen_id, [])

        if not model:
            return {'citizen_id': citizen_id, 'level': 'DORMANT', 'has_self_model': False}

        return {
            'citizen_id': citizen_id,
            'level': level.name,
            'has_self_model': True,
            'perceived_energy': model.perceived_energy,
            'perceived_role': model.perceived_role,
            'confidence': model.confidence,
            'uncertainty': model.uncertainty,
            'introspection_depth': model.introspection_depth,
            'goals': model.goals,
            'recent_thoughts': [
                {'content': t.content, 'type': t.thought_type}
                for t in thoughts[-5:]
            ],
            'action_history_size': len(model.action_history)
        }
