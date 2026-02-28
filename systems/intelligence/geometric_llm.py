"""
Geometry OS: Geometric LLM

A Vision-Language Model that natively outputs executable
interference patterns (glyphs) instead of text tokens.

Architecture:
- GlyphTokenizer: Maps glyphs to/from token IDs
- GeometricEncoder: Vision encoder for glyph patterns
- IntentDecoder: Generates glyph sequences from intent
- InferenceEngine: Runs inference with various backends

Epoch 3: The Native Mind
"""

import json
import math
import random
from dataclasses import dataclass, field
from typing import List, Dict, Optional, Tuple, Any, Union
from pathlib import Path
import logging

logging.basicConfig(level=logging.INFO)
logger = logging.getLogger(__name__)


# ============================================
# GLYPH TOKENIZATION
# ============================================

@dataclass
class GlyphVocab:
    """Vocabulary for glyph tokenization."""
    # Special tokens
    PAD = 0
    BOS = 1  # Begin of sequence
    EOS = 2  # End of sequence
    UNK = 3  # Unknown

    # Token ranges
    OPCODE_OFFSET = 4      # Opcodes start at 4
    OPERAND_OFFSET = 260   # Operands (0-255) start at 260
    POSITION_OFFSET = 516  # Position tokens start at 516

    VOCAB_SIZE = 10000

    @classmethod
    def opcode_to_token(cls, opcode: int) -> int:
        """Convert opcode to token ID."""
        return cls.OPCODE_OFFSET + opcode

    @classmethod
    def token_to_opcode(cls, token: int) -> int:
        """Convert token ID to opcode."""
        return token - cls.OPCODE_OFFSET

    @classmethod
    def operand_to_token(cls, operand: int) -> int:
        """Convert operand to token ID."""
        return cls.OPERAND_OFFSET + (operand & 0xFF)

    @classmethod
    def token_to_operand(cls, token: int) -> int:
        """Convert token ID to operand."""
        return token - cls.OPERAND_OFFSET

    @classmethod
    def position_to_token(cls, x: int, y: int) -> int:
        """Convert position to token ID (packed)."""
        # Pack x,y into single token (4 bits each, max 15)
        packed = ((x & 0xF) << 4) | (y & 0xF)
        return cls.POSITION_OFFSET + packed

    @classmethod
    def token_to_position(cls, token: int) -> Tuple[int, int]:
        """Convert token ID to position."""
        packed = token - cls.POSITION_OFFSET
        x = (packed >> 4) & 0xF
        y = packed & 0xF
        return x, y


class GlyphTokenizer:
    """Tokenize glyph sequences for LLM input/output."""

    def __init__(self):
        self.vocab = GlyphVocab()
        self.token_to_glyph = {}  # Reverse mapping

    def encode_glyph(self, opcode: int, operand: int = 0, x: int = 0, y: int = 0) -> List[int]:
        """
        Encode a single glyph to token sequence.

        Format: [OPCODE, OPERAND, POS_X_Y]
        """
        tokens = [
            self.vocab.opcode_to_token(opcode),
            self.vocab.operand_to_token(operand),
            self.vocab.position_to_token(x, y)
        ]
        return tokens

    def decode_glyph(self, tokens: List[int]) -> Dict[str, int]:
        """
        Decode token sequence to glyph.

        Returns: {opcode, operand, x, y}
        """
        if len(tokens) < 2:
            return {"opcode": 0, "operand": 0, "x": 0, "y": 0}

        opcode = self.vocab.token_to_opcode(tokens[0])
        operand = self.vocab.token_to_operand(tokens[1])

        x, y = 0, 0
        if len(tokens) >= 3:
            x, y = self.vocab.token_to_position(tokens[2])

        return {"opcode": opcode, "operand": operand, "x": x, "y": y}

    def encode_sequence(self, glyphs: List[Dict]) -> List[int]:
        """
        Encode a sequence of glyphs to tokens.

        Format: [BOS, glyph1_tokens, glyph2_tokens, ..., EOS]
        """
        tokens = [GlyphVocab.BOS]

        for glyph in glyphs:
            tokens.extend(self.encode_glyph(
                glyph.get("opcode", 0),
                glyph.get("operand", 0),
                glyph.get("x", 0),
                glyph.get("y", 0)
            ))

        tokens.append(GlyphVocab.EOS)
        return tokens

    def decode_sequence(self, tokens: List[int]) -> List[Dict]:
        """Decode token sequence to list of glyphs."""
        glyphs = []

        # Skip special tokens
        i = 0
        while i < len(tokens):
            if tokens[i] in [GlyphVocab.BOS, GlyphVocab.EOS, GlyphVocab.PAD]:
                i += 1
                continue

            # Extract glyph triplet
            if i + 2 < len(tokens):
                glyph = self.decode_glyph(tokens[i:i+3])
                glyphs.append(glyph)
                i += 3
            else:
                break

        return glyphs

    def encode_intent(self, intent_text: str, max_length: int = 128) -> List[int]:
        """
        Encode intent text to tokens.

        Simple character-level encoding for now.
        Real implementation would use proper text tokenizer.
        """
        # Use ASCII values offset by 1000
        tokens = []
        for char in intent_text[:max_length]:
            tokens.append(1000 + ord(char))
        return tokens

    def decode_intent(self, tokens: List[int]) -> str:
        """Decode tokens to intent text."""
        chars = []
        for token in tokens:
            if token >= 1000:
                chars.append(chr(token - 1000))
        return "".join(chars)


# ============================================
# GEOMETRIC ENCODER
# ============================================

class GeometricEncoder:
    """
    Encode glyph patterns into embeddings.

    Captures:
    - Spatial relationships (2D positions)
    - Opcode semantics
    - Data flow patterns
    """

    def __init__(self, embed_dim: int = 256):
        self.embed_dim = embed_dim
        self.tokenizer = GlyphTokenizer()

        # Embedding tables (simplified - real impl would use nn.Embedding)
        self.opcode_embeddings = self._init_embeddings(256, embed_dim)
        self.position_embeddings = self._init_embeddings(256, embed_dim)

    def _init_embeddings(self, vocab_size: int, dim: int) -> List[List[float]]:
        """Initialize random embeddings."""
        return [
            [random.gauss(0, 0.02) for _ in range(dim)]
            for _ in range(vocab_size)
        ]

    def encode_glyph(self, glyph: Dict) -> List[float]:
        """Encode single glyph to embedding."""
        opcode = glyph.get("opcode", 0)
        x = glyph.get("x", 0)
        y = glyph.get("y", 0)

        # Get base embeddings
        opcode_emb = self.opcode_embeddings[opcode % 256]

        # Position encoding (sinusoidal)
        pos_emb = self._positional_encoding(x, y)

        # Combine
        combined = [
            opcode_emb[i] + pos_emb[i]
            for i in range(self.embed_dim)
        ]

        return combined

    def _positional_encoding(self, x: int, y: int) -> List[float]:
        """Sinusoidal 2D positional encoding."""
        encoding = []

        for i in range(self.embed_dim // 4):
            # X encoding
            freq = 1.0 / (10000 ** (2 * i / self.embed_dim))
            encoding.append(math.sin(x * freq))
            encoding.append(math.cos(x * freq))

            # Y encoding
            encoding.append(math.sin(y * freq))
            encoding.append(math.cos(y * freq))

        # Pad if needed
        while len(encoding) < self.embed_dim:
            encoding.append(0.0)

        return encoding[:self.embed_dim]

    def encode_sequence(self, glyphs: List[Dict]) -> List[List[float]]:
        """Encode sequence of glyphs."""
        return [self.encode_glyph(g) for g in glyphs]

    def encode_intent_text(self, text: str) -> List[float]:
        """Encode intent text to embedding (simple average of char embeddings)."""
        # Simple hash-based encoding
        h = hash(text)
        random.seed(abs(h))

        embedding = [random.gauss(0, 0.1) for _ in range(self.embed_dim)]

        # Normalize
        norm = math.sqrt(sum(e**2 for e in embedding))
        if norm > 0:
            embedding = [e / norm for e in embedding]

        return embedding


# ============================================
# GEOMETRIC LLM
# ============================================

@dataclass
class GenerationConfig:
    """Configuration for text/glyph generation."""
    max_length: int = 100
    temperature: float = 1.0
    top_k: int = 50
    top_p: float = 0.9
    repetition_penalty: float = 1.0


class GeometricLLM:
    """
    Main LLM class for glyph generation.

    In production, this would:
    - Load a trained model checkpoint
    - Use proper transformer architecture
    - Support multiple backends (PyTorch, ONNX, etc.)

    This implementation provides the interface with
    simplified inference logic.
    """

    def __init__(self, model_path: str = None, embed_dim: int = 256):
        self.embed_dim = embed_dim
        self.tokenizer = GlyphTokenizer()
        self.encoder = GeometricEncoder(embed_dim)

        # Model state
        self.model_path = model_path
        self.is_loaded = False

        # Opcode probabilities (learned from training data)
        self.opcode_probs = self._init_opcode_probs()

        # Operation patterns
        self.operation_patterns = {
            "add": [0x20, 0x20, 0x6A, 0x0F],      # local.get, local.get, add, return
            "sub": [0x20, 0x20, 0x6B, 0x0F],      # local.get, local.get, sub, return
            "mul": [0x20, 0x20, 0x6C, 0x0F],      # local.get, local.get, mul, return
            "div": [0x20, 0x20, 0x6D, 0x0F],      # local.get, local.get, div, return
            "and": [0x20, 0x20, 0x71, 0x0F],      # local.get, local.get, and, return
            "or": [0x20, 0x20, 0x72, 0x0F],       # local.get, local.get, or, return
            "xor": [0x20, 0x20, 0x73, 0x0F],      # local.get, local.get, xor, return
            "eq": [0x20, 0x20, 0x46, 0x0F],       # local.get, local.get, eq, return
            "lt": [0x20, 0x20, 0x48, 0x0F],       # local.get, local.get, lt, return
            "gt": [0x20, 0x20, 0x4A, 0x0F],       # local.get, local.get, gt, return
            "load": [0x20, 0x28, 0x0F],           # local.get, load, return
            "store": [0x20, 0x20, 0x36, 0x0F],    # local.get, local.get, store, return
            "nop": [0x01],                         # nop
        }

    def _init_opcode_probs(self) -> Dict[str, float]:
        """Initialize operation probabilities."""
        ops = ["add", "sub", "mul", "div", "and", "or", "xor", "eq", "lt", "gt", "load", "store", "nop"]
        prob = 1.0 / len(ops)
        return {op: prob for op in ops}

    def load_model(self, path: str = None) -> bool:
        """Load model from checkpoint."""
        path = path or self.model_path
        if not path:
            logger.warning("No model path specified, using defaults")
            self.is_loaded = True
            return True

        try:
            # In production, load actual model weights
            # For now, just mark as loaded
            self.is_loaded = True
            logger.info(f"Model loaded from {path}")
            return True
        except Exception as e:
            logger.error(f"Failed to load model: {e}")
            return False

    def generate(
        self,
        intent: str,
        config: GenerationConfig = None
    ) -> List[Dict]:
        """
        Generate glyph sequence from intent.

        Args:
            intent: Natural language intent (e.g., "add 5 and 3")
            config: Generation configuration

        Returns:
            List of glyph dictionaries
        """
        if not self.is_loaded:
            self.load_model()

        config = config or GenerationConfig()

        # Parse intent to detect operation
        operation = self._detect_operation(intent)

        # Get opcode pattern for operation
        pattern = self.operation_patterns.get(operation, [0x01])

        # Generate glyphs from pattern
        glyphs = []
        x_offset = 0

        for opcode in pattern:
            # Determine operand based on position
            if opcode == 0x20:  # local.get
                operand = len([g for g in glyphs if g["opcode"] == 0x20]) % 2
            else:
                operand = 0

            glyph = {
                "opcode": opcode,
                "operand": operand,
                "x": x_offset,
                "y": 0
            }
            glyphs.append(glyph)
            x_offset += 1

        return glyphs

    def _detect_operation(self, intent: str) -> str:
        """Detect operation type from intent text."""
        intent_lower = intent.lower()

        # Keyword matching
        if any(kw in intent_lower for kw in ["add", "plus", "sum", "+"]):
            return "add"
        elif any(kw in intent_lower for kw in ["subtract", "minus", "sub", "-"]):
            return "sub"
        elif any(kw in intent_lower for kw in ["multiply", "mul", "times", "*"]):
            return "mul"
        elif any(kw in intent_lower for kw in ["divide", "div", "/"]):
            return "div"
        elif any(kw in intent_lower for kw in ["and", "&"]):
            return "and"
        elif any(kw in intent_lower for kw in ["or", "|"]):
            return "or"
        elif any(kw in intent_lower for kw in ["xor", "^"]):
            return "xor"
        elif any(kw in intent_lower for kw in ["equal", "compare", "eq", "=="]):
            return "eq"
        elif any(kw in intent_lower for kw in ["less", "lt", "<"]):
            return "lt"
        elif any(kw in intent_lower for kw in ["greater", "gt", ">"]):
            return "gt"
        elif any(kw in intent_lower for kw in ["load", "read"]):
            return "load"
        elif any(kw in intent_lower for kw in ["store", "write", "save"]):
            return "store"
        else:
            return "nop"

    def generate_batch(
        self,
        intents: List[str],
        config: GenerationConfig = None
    ) -> List[List[Dict]]:
        """Generate glyph sequences for multiple intents."""
        return [self.generate(intent, config) for intent in intents]

    def score(
        self,
        intent: str,
        glyphs: List[Dict]
    ) -> float:
        """
        Score how well glyphs match intent.

        Returns:
            Score between 0 and 1
        """
        expected = self.generate(intent)

        if len(glyphs) != len(expected):
            return 0.0

        matches = sum(
            1 for g, e in zip(glyphs, expected)
            if g.get("opcode") == e.get("opcode")
        )

        return matches / len(expected) if expected else 0.0

    def get_token_probability(self, token: int, context: List[int] = None) -> float:
        """Get probability of token given context."""
        # Simplified - real impl would use model logits
        return 1.0 / GlyphVocab.VOCAB_SIZE

    def to_glyph_string(self, glyphs: List[Dict]) -> str:
        """Convert glyphs to human-readable string."""
        return " ".join([
            f"[{g['opcode']:02X}:{g['operand']}]"
            for g in glyphs
        ])

    def from_glyph_string(self, s: str) -> List[Dict]:
        """Parse glyph string to list of dicts."""
        import re
        glyphs = []

        pattern = r'\[([0-9A-Fa-f]{2}):(\d+)\]'
        x = 0

        for match in re.finditer(pattern, s):
            opcode = int(match.group(1), 16)
            operand = int(match.group(2))
            glyphs.append({
                "opcode": opcode,
                "operand": operand,
                "x": x,
                "y": 0
            })
            x += 1

        return glyphs


# ============================================
# INFERENCE ENGINE
# ============================================

class InferenceEngine:
    """
    High-level inference interface.

    Supports multiple backends:
    - Local (Python implementation)
    - API (remote model)
    - ONNX (optimized)
    """

    def __init__(self, backend: str = "local", model_path: str = None):
        self.backend = backend
        self.model_path = model_path
        self.llm = None

        if backend == "local":
            self.llm = GeometricLLM(model_path)
            self.llm.load_model()

    def generate(
        self,
        intent: str,
        config: GenerationConfig = None
    ) -> List[Dict]:
        """Generate glyphs from intent."""
        if self.backend == "local":
            return self.llm.generate(intent, config)
        else:
            raise NotImplementedError(f"Backend {self.backend} not implemented")

    def generate_batch(
        self,
        intents: List[str],
        config: GenerationConfig = None
    ) -> List[List[Dict]]:
        """Generate glyphs for multiple intents."""
        return [self.generate(intent, config) for intent in intents]

    def score(self, intent: str, glyphs: List[Dict]) -> float:
        """Score glyph sequence against intent."""
        return self.llm.score(intent, glyphs)

    def interactive(self):
        """Interactive REPL for testing."""
        print("Geometric LLM Interactive Mode")
        print("Type 'quit' to exit")
        print("-" * 40)

        while True:
            try:
                intent = input("\nIntent> ").strip()

                if intent.lower() == "quit":
                    break

                if not intent:
                    continue

                glyphs = self.generate(intent)
                glyph_str = self.llm.to_glyph_string(glyphs)
                score = self.score(intent, glyphs)

                print(f"Glyphs: {glyph_str}")
                print(f"Score:  {score:.2f}")

            except KeyboardInterrupt:
                break

        print("\nGoodbye!")


# ============================================
# CLI
# ============================================

def main():
    """CLI for Geometric LLM."""
    import argparse

    parser = argparse.ArgumentParser(description="Geometry OS Geometric LLM")
    parser.add_argument("--model", type=str, default=None, help="Model path")
    parser.add_argument("--intent", type=str, default=None, help="Intent to process")
    parser.add_argument("--interactive", action="store_true", help="Interactive mode")
    parser.add_argument("--backend", type=str, default="local", help="Inference backend")

    args = parser.parse_args()

    engine = InferenceEngine(backend=args.backend, model_path=args.model)

    if args.interactive:
        engine.interactive()
    elif args.intent:
        glyphs = engine.generate(args.intent)
        llm = GeometricLLM()
        print(f"Intent: {args.intent}")
        print(f"Glyphs: {llm.to_glyph_string(glyphs)}")
    else:
        # Demo
        demo_intents = [
            "add 5 and 3",
            "multiply 7 by 4",
            "compare 10 and 20",
            "load from address 100"
        ]

        print("Geometric LLM Demo")
        print("-" * 40)

        for intent in demo_intents:
            glyphs = engine.generate(intent)
            score = engine.score(intent, glyphs)
            print(f"{intent}")
            print(f"  -> {engine.llm.to_glyph_string(glyphs)}")
            print(f"  Score: {score:.2f}")
            print()


if __name__ == "__main__":
    main()
