"""
Language Evolution - Phase 49

Citizens develop shared symbols and communication protocols.
Language emerges from repeated patterns, traded concepts, and social learning.

The city speaks. The city understands.
"""

import time
import random
import math
from typing import Dict, List, Optional, Tuple, Set
from dataclasses import dataclass, field
from enum import Enum
from collections import defaultdict


class SymbolType(Enum):
    """Types of symbols in the emergent language."""
    GLYPH = "glyph"           # Visual pattern
    SOUND = "sound"           # Auditory pattern (conceptual)
    GESTURE = "gesture"       # Movement pattern
    CONCEPT = "concept"       # Abstract idea
    EMOTION = "emotion"       # Feeling state


@dataclass
class Symbol:
    """A symbol in the emergent language."""
    id: str
    symbol_type: SymbolType
    pattern: str              # The actual symbol (glyph, code, etc.)
    meaning: str              # Semantic meaning
    creator_id: str           # Citizen who created/first used it
    frequency: int = 1        # How often it's used
    spread_count: int = 0     # How many citizens know it
    variants: List[str] = field(default_factory=list)
    birth_time: float = field(default_factory=time.time)
    last_used: float = field(default_factory=time.time)


@dataclass
class Utterance:
    """A communication utterance between citizens."""
    speaker_id: str
    listener_id: str
    symbols: List[str]        # Symbol IDs
    context: Dict             # Situation context
    success: bool = False     # Was it understood?
    timestamp: float = field(default_factory=time.time)


@dataclass
class CitizenVocabulary:
    """A citizen's personal vocabulary."""
    citizen_id: str
    known_symbols: Dict[str, float] = field(default_factory=dict)  # symbol_id -> proficiency
    creation_count: int = 0
    learning_rate: float = 0.1
    forgetting_rate: float = 0.01


class LanguageEvolution:
    """
    Manages the emergence and evolution of language among citizens.

    Language emerges through:
    1. Symbol creation - citizens create symbols for concepts
    2. Symbol spreading - symbols spread through communication
    3. Meaning drift - meanings evolve over time
    4. Dialect formation - regional variations emerge
    5. Creolization - simplified contact languages form
    """

    def __init__(self, city):
        """
        Initialize the language evolution system.

        Args:
            city: NeuralCity instance
        """
        self.city = city

        # Symbol registry
        self.symbols: Dict[str, Symbol] = {}
        self.symbol_by_pattern: Dict[str, str] = {}  # pattern -> symbol_id

        # Citizen vocabularies
        self.vocabularies: Dict[str, CitizenVocabulary] = {}

        # Communication log
        self.utterances: List[Utterance] = []
        self.max_utterances = 1000

        # Language statistics
        self.stats = {
            'total_symbols': 0,
            'total_utterances': 0,
            'successful_comms': 0,
            'failed_comms': 0,
            'avg_vocabulary_size': 0.0,
            'most_common_symbol': None,
            'language_complexity': 0.0
        }

        # Dialect regions
        self.dialects: Dict[str, Set[str]] = {}  # region_id -> set of symbol_ids
        self.region_symbols: Dict[str, str] = {}  # symbol_id -> primary_region

        # Core concept primitives
        self._initialize_primitives()

    def _initialize_primitives(self):
        """Initialize basic concept primitives."""
        primitives = [
            ('HIGH', '▲', 'elevation, up, increase'),
            ('LOW', '▼', 'decrease, down, reduce'),
            ('NEAR', '◆', 'proximity, close, here'),
            ('FAR', '◇', 'distance, away, there'),
            ('STRONG', '●', 'intensity, power, important'),
            ('WEAK', '○', 'diminished, less, minor'),
            ('TOGETHER', '⬡', 'combine, join, group'),
            ('APART', '⬢', 'separate, divide, split'),
            ('FLOW', '~', 'movement, transfer, change'),
            ('STILL', '=', 'static, stable, same'),
        ]

        for name, glyph, meaning in primitives:
            symbol = Symbol(
                id=f"prim_{name.lower()}",
                symbol_type=SymbolType.GLYPH,
                pattern=glyph,
                meaning=meaning,
                creator_id='system'
            )
            self.symbols[symbol.id] = symbol
            self.symbol_by_pattern[glyph] = symbol.id
            self.stats['total_symbols'] += 1

    def get_or_create_vocabulary(self, citizen_id: str) -> CitizenVocabulary:
        """Get or create a vocabulary for a citizen."""
        if citizen_id not in self.vocabularies:
            # Initialize with some primitive knowledge
            vocab = CitizenVocabulary(citizen_id=citizen_id)

            # Give new citizens some basic symbols
            primitive_ids = [s for s in self.symbols if s.startswith('prim_')]
            for sym_id in random.sample(primitive_ids, min(3, len(primitive_ids))):
                vocab.known_symbols[sym_id] = random.uniform(0.3, 0.7)

            self.vocabularies[citizen_id] = vocab

        return self.vocabularies[citizen_id]

    def create_symbol(
        self,
        creator_id: str,
        symbol_type: SymbolType,
        concept: str,
        guild: str = None
    ) -> Symbol:
        """
        Create a new symbol for a concept.

        Args:
            creator_id: Citizen creating the symbol
            symbol_type: Type of symbol
            concept: The concept to symbolize
            guild: Optional guild context

        Returns:
            The created symbol
        """
        # Generate unique pattern
        pattern = self._generate_pattern(symbol_type, guild, concept)

        # Ensure uniqueness
        while pattern in self.symbol_by_pattern:
            pattern = self._mutate_pattern(pattern)

        symbol = Symbol(
            id=f"sym_{len(self.symbols):04d}",
            symbol_type=symbol_type,
            pattern=pattern,
            meaning=concept,
            creator_id=creator_id
        )

        self.symbols[symbol.id] = symbol
        self.symbol_by_pattern[pattern] = symbol.id
        self.stats['total_symbols'] += 1

        # Creator learns their own symbol
        vocab = self.get_or_create_vocabulary(creator_id)
        vocab.known_symbols[symbol.id] = 1.0
        vocab.creation_count += 1

        return symbol

    def _generate_pattern(self, symbol_type: SymbolType, guild: str, concept: str) -> str:
        """Generate a unique pattern for a symbol."""
        if symbol_type == SymbolType.GLYPH:
            # Unicode geometric shapes and symbols
            bases = '■□▪▫●○◆◇▲▼△▽◁▷♠♣♥♦⬡⬢⯃⯂'
            modifiers = '̣̤̥̼͖̗͇͈͍͎́̈̄̇̽̾̿̀́͂̓͆'

            base = random.choice(bases)
            if random.random() < 0.3:
                base += random.choice(modifiers)

            return base

        elif symbol_type == SymbolType.SOUND:
            # Phonetic-like patterns
            consonants = 'ptkbdgmnlrsʃʒθð'
            vowels = 'aeiouəɔɛɪʊæ'
            pattern = random.choice(consonants) + random.choice(vowels)
            if random.random() < 0.5:
                pattern += random.choice(consonants)
            return pattern

        elif symbol_type == SymbolType.GESTURE:
            # Movement descriptors
            directions = ['↑', '↓', '←', '→', '↔', '↕', '○', '◊']
            return ''.join(random.sample(directions, random.randint(1, 3)))

        elif symbol_type == SymbolType.CONCEPT:
            # Abstract concept codes
            return f"[{hash(concept) % 1000:03d}]"

        else:  # EMOTION
            emotions = '♡♥❤❥❣❦❧✦✧★☆'
            return random.choice(emotions)

    def _mutate_pattern(self, pattern: str) -> str:
        """Mutate a pattern to create a variant."""
        if len(pattern) == 1:
            return pattern + random.choice('̃̈̄')
        else:
            idx = random.randint(0, len(pattern) - 1)
            return pattern[:idx] + random.choice('̃̈̄̇') + pattern[idx+1:]

    def communicate(
        self,
        speaker_id: str,
        listener_id: str,
        concept: str,
        context: Dict = None
    ) -> Utterance:
        """
        Execute a communication between two citizens.

        Args:
            speaker_id: The speaking citizen
            listener_id: The listening citizen
            concept: What to communicate
            context: Situational context

        Returns:
            The utterance record
        """
        speaker_vocab = self.get_or_create_vocabulary(speaker_id)
        listener_vocab = self.get_or_create_vocabulary(listener_id)

        # Find symbols for concept
        relevant_symbols = self._find_symbols_for_concept(concept, speaker_vocab)

        # If no symbols, create one
        if not relevant_symbols:
            new_symbol = self.create_symbol(
                speaker_id,
                SymbolType.GLYPH,
                concept
            )
            relevant_symbols = [new_symbol.id]

        # Select symbols to use
        selected = self._select_symbols_for_utterance(relevant_symbols, speaker_vocab)

        # Check if listener understands
        understood = self._check_understanding(selected, listener_vocab)

        # Record utterance
        utterance = Utterance(
            speaker_id=speaker_id,
            listener_id=listener_id,
            symbols=selected,
            context=context or {},
            success=understood
        )
        self.utterances.append(utterance)
        self.stats['total_utterances'] += 1

        if understood:
            self.stats['successful_comms'] += 1
            # Strengthen symbols for both parties
            for sym_id in selected:
                speaker_vocab.known_symbols[sym_id] = min(1.0, speaker_vocab.known_symbols.get(sym_id, 0) + 0.1)
                listener_vocab.known_symbols[sym_id] = min(1.0, listener_vocab.known_symbols.get(sym_id, 0) + 0.1)
                self.symbols[sym_id].frequency += 1
                self.symbols[sym_id].last_used = time.time()
        else:
            self.stats['failed_comms'] += 1
            # Listener may learn from context
            self._learn_from_context(selected, listener_vocab, context)

        # Trim utterance history
        if len(self.utterances) > self.max_utterances:
            self.utterances = self.utterances[-self.max_utterances:]

        return utterance

    def _find_symbols_for_concept(self, concept: str, vocab: CitizenVocabulary) -> List[str]:
        """Find symbols that match a concept."""
        matches = []

        for sym_id, symbol in self.symbols.items():
            # Check if concept relates to symbol meaning
            if self._concepts_related(concept, symbol.meaning):
                if sym_id in vocab.known_symbols:
                    matches.append(sym_id)

        return matches

    def _concepts_related(self, concept1: str, concept2: str) -> bool:
        """Check if two concepts are semantically related."""
        # Simple check - share any word
        words1 = set(concept1.lower().split())
        words2 = set(concept2.lower().split())
        return bool(words1 & words2) or concept1 == concept2

    def _select_symbols_for_utterance(self, symbols: List[str], vocab: CitizenVocabulary) -> List[str]:
        """Select which symbols to use in an utterance."""
        # Prefer well-known symbols
        weighted = []
        for sym_id in symbols:
            proficiency = vocab.known_symbols.get(sym_id, 0)
            freq = self.symbols[sym_id].frequency if sym_id in self.symbols else 1
            weight = proficiency * (1 + 0.1 * math.log(freq + 1))
            weighted.append((sym_id, weight))

        weighted.sort(key=lambda x: x[1], reverse=True)

        # Select 1-3 symbols
        count = min(len(weighted), random.randint(1, 3))
        return [w[0] for w in weighted[:count]]

    def _check_understanding(self, symbols: List[str], listener_vocab: CitizenVocabulary) -> bool:
        """Check if listener understands the symbols."""
        if not symbols:
            return False

        # Calculate understanding score
        understood = 0
        for sym_id in symbols:
            proficiency = listener_vocab.known_symbols.get(sym_id, 0)
            if proficiency > 0.3:  # Threshold for understanding
                understood += 1

        # Need to understand majority
        return understood >= len(symbols) * 0.5

    def _learn_from_context(self, symbols: List[str], vocab: CitizenVocabulary, context: Dict):
        """Learn unknown symbols from context."""
        for sym_id in symbols:
            if sym_id not in vocab.known_symbols:
                # Initial learning with low proficiency
                vocab.known_symbols[sym_id] = 0.1

                # Track spread
                if sym_id in self.symbols:
                    self.symbols[sym_id].spread_count += 1

    def tick(self) -> Dict:
        """
        Process one language evolution tick.

        Returns activity summary.
        """
        result = {
            'communications': 0,
            'new_symbols': 0,
            'successful': 0,
            'failed': 0,
            'avg_vocab': 0.0
        }

        if not self.city or not self.city.spawner.citizens:
            return result

        citizens = list(self.city.spawner.citizens.values())

        # Process communications
        for citizen in citizens:
            if citizen.state.value != 'active':
                continue

            # Find communication partner
            neighbors = [c for c in citizens
                        if c.id != citizen.id
                        and citizen.is_neighbor(c)
                        and c.state.value == 'active']

            if not neighbors:
                continue

            # Random chance to communicate
            if random.random() > 0.2:
                continue

            partner = random.choice(neighbors)

            # Determine concept to communicate
            concept = self._determine_concept(citizen, partner)

            # Communicate
            utterance = self.communicate(
                citizen.id,
                partner.id,
                concept,
                context={
                    'speaker_guild': citizen.guild.value,
                    'listener_guild': partner.guild.value,
                    'location': (citizen.x, citizen.y)
                }
            )

            result['communications'] += 1
            if utterance.success:
                result['successful'] += 1
            else:
                result['failed'] += 1

        # Occasional symbol creation
        if random.random() < 0.1 and citizens:
            creator = random.choice(citizens)
            concept = self._generate_new_concept(creator)
            self.create_symbol(
                creator.id,
                random.choice(list(SymbolType)),
                concept,
                guild=creator.guild.value
            )
            result['new_symbols'] = 1

        # Apply forgetting
        self._apply_forgetting()

        # Update statistics
        self._update_stats()

        result['avg_vocab'] = self.stats['avg_vocabulary_size']

        return result

    def _determine_concept(self, speaker, listener) -> str:
        """Determine what concept to communicate."""
        # Based on speaker's state and context
        concepts = []

        # Energy-based concepts
        if speaker.energy > 0.8:
            concepts.append('STRONG good important')
        elif speaker.energy < 0.3:
            concepts.append('WEAK need help')

        # Guild-based concepts
        guild = speaker.guild.value
        guild_concepts = {
            'attention': 'focus look see',
            'memory': 'remember recall store',
            'logic': 'compute think analyze',
            'substrate': 'build create foundation',
            'intent': 'goal purpose direction'
        }
        if guild in guild_concepts:
            concepts.append(guild_concepts[guild])

        # Relationship-based
        if listener.id in speaker.trade_partners:
            concepts.append('TOGETHER trade partner')

        return random.choice(concepts) if concepts else 'exist here'

    def _generate_new_concept(self, citizen) -> str:
        """Generate a new concept for symbol creation."""
        prefixes = ['meta', 'sub', 'proto', 'hyper', 'para', 'trans']
        roots = ['flux', 'nexus', 'void', 'spark', 'wave', 'form', 'pulse']
        suffixes = ['ness', 'ity', 'tion', 'ence', 'ure']

        concept = ''
        if random.random() < 0.3:
            concept += random.choice(prefixes) + ' '
        concept += random.choice(roots)
        if random.random() < 0.3:
            concept += random.choice(suffixes)

        return concept

    def _apply_forgetting(self):
        """Apply forgetting to all vocabularies."""
        for vocab in self.vocabularies.values():
            to_forget = []
            for sym_id, proficiency in vocab.known_symbols.items():
                # Decrease proficiency
                new_prof = proficiency - vocab.forgetting_rate
                if new_prof < 0.05:
                    to_forget.append(sym_id)
                else:
                    vocab.known_symbols[sym_id] = new_prof

            # Remove forgotten symbols
            for sym_id in to_forget:
                del vocab.known_symbols[sym_id]

    def _update_stats(self):
        """Update language statistics."""
        if self.vocabularies:
            total_vocab = sum(len(v.known_symbols) for v in self.vocabularies.values())
            self.stats['avg_vocabulary_size'] = total_vocab / len(self.vocabularies)

        if self.symbols:
            most_common = max(self.symbols.values(), key=lambda s: s.frequency)
            self.stats['most_common_symbol'] = most_common.id

            # Calculate complexity (unique symbols / total uses)
            total_uses = sum(s.frequency for s in self.symbols.values())
            if total_uses > 0:
                self.stats['language_complexity'] = len(self.symbols) / total_uses

    def get_language_report(self) -> Dict:
        """Get a comprehensive language report."""
        return {
            'total_symbols': len(self.symbols),
            'total_speakers': len(self.vocabularies),
            'total_utterances': len(self.utterances),
            'stats': self.stats,
            'top_symbols': [
                {
                    'id': s.id,
                    'pattern': s.pattern,
                    'meaning': s.meaning,
                    'frequency': s.frequency,
                    'spread': s.spread_count
                }
                for s in sorted(self.symbols.values(),
                               key=lambda x: x.frequency,
                               reverse=True)[:10]
            ],
            'dialect_count': len(self.dialects)
        }

    def get_citizen_vocabulary(self, citizen_id: str) -> Dict:
        """Get a citizen's vocabulary details."""
        vocab = self.vocabularies.get(citizen_id)
        if not vocab:
            return {'known': [], 'count': 0}

        known = []
        for sym_id, proficiency in vocab.known_symbols.items():
            if sym_id in self.symbols:
                symbol = self.symbols[sym_id]
                known.append({
                    'pattern': symbol.pattern,
                    'meaning': symbol.meaning,
                    'proficiency': proficiency
                })

        return {
            'citizen_id': citizen_id,
            'known': sorted(known, key=lambda x: x['proficiency'], reverse=True),
            'count': len(known),
            'created': vocab.creation_count
        }
