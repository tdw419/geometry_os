"""
Semantic Anchors - Code tile anchors for memory drift.

Code anchors represent code tiles on the Infinite Map that memory entries
drift toward based on semantic similarity.
"""

import hashlib
from dataclasses import dataclass, field
from typing import Any, Dict, List, Optional, Tuple

import numpy as np


@dataclass
class CodeAnchor:
    """Represents a code tile anchor that attracts memory entries."""

    tile: Tuple[int, int]
    code_hash: str
    semantic_vector: np.ndarray
    keywords: List[str] = field(default_factory=list)
    metadata: Dict[str, Any] = field(default_factory=dict)

    def to_dict(self) -> Dict[str, Any]:
        """Convert anchor to dictionary for serialization."""
        return {
            "tile": self.tile,
            "code_hash": self.code_hash,
            "semantic_vector": self.semantic_vector.tolist(),
            "keywords": self.keywords,
            "metadata": self.metadata,
        }


class SemanticAnchors:
    """
    Manages code tile anchors for memory drift.

    Code anchors represent fixed points on the Infinite Map that memory
    entries are attracted to based on semantic similarity. Each anchor
    has a position (tile), semantic vector, and keywords extracted from
    the code content.
    """

    def __init__(self, vector_dim: int = 64):
        """
        Initialize the semantic anchors manager.

        Args:
            vector_dim: Dimension of semantic vectors (default 64)
        """
        self.vector_dim = vector_dim
        self._anchors: Dict[Tuple[int, int], CodeAnchor] = {}
        self._hash_to_tile: Dict[str, Tuple[int, int]] = {}

    def add_anchor(
        self,
        tile: Tuple[int, int],
        code_content: str,
        semantic_vector: Optional[np.ndarray] = None,
        metadata: Optional[Dict[str, Any]] = None,
    ) -> CodeAnchor:
        """
        Add a code anchor for a tile.

        If semantic_vector is not provided, it will be extracted from
        the code content using a simple hash-based embedding.

        Args:
            tile: (x, y) position of the code tile
            code_content: The source code content
            semantic_vector: Pre-computed semantic vector (optional)
            metadata: Additional metadata for the anchor

        Returns:
            The created CodeAnchor
        """
        # Generate code hash
        code_hash = self._hash_code(code_content)

        # Extract keywords from code
        keywords = self._extract_keywords(code_content)

        # Generate semantic vector if not provided
        if semantic_vector is None:
            semantic_vector = self._extract_semantic_vector(code_content)

        # Ensure vector is the correct dimension
        if len(semantic_vector) != self.vector_dim:
            semantic_vector = self._project_vector(semantic_vector)

        # Remove old anchor if exists
        if tile in self._anchors:
            old_anchor = self._anchors[tile]
            if old_anchor.code_hash in self._hash_to_tile:
                del self._hash_to_tile[old_anchor.code_hash]

        # Create and store anchor
        anchor = CodeAnchor(
            tile=tile,
            code_hash=code_hash,
            semantic_vector=semantic_vector,
            keywords=keywords,
            metadata=metadata or {},
        )

        self._anchors[tile] = anchor
        self._hash_to_tile[code_hash] = tile

        return anchor

    def get_anchor(self, tile: Tuple[int, int]) -> Optional[CodeAnchor]:
        """
        Get an anchor by tile position.

        Args:
            tile: (x, y) position

        Returns:
            CodeAnchor if found, None otherwise
        """
        return self._anchors.get(tile)

    def find_nearest_anchor(
        self, vector: np.ndarray, exclude_tiles: Optional[List[Tuple[int, int]]] = None
    ) -> Optional[CodeAnchor]:
        """
        Find the anchor with the highest semantic similarity to a vector.

        Args:
            vector: Query semantic vector
            exclude_tiles: List of tiles to exclude from search

        Returns:
            CodeAnchor with highest similarity, or None if no anchors
        """
        if not self._anchors:
            return None

        exclude_set = set(exclude_tiles or [])
        best_anchor = None
        best_similarity = -1.0

        for tile, anchor in self._anchors.items():
            if tile in exclude_set:
                continue

            similarity = self.compute_attraction(vector, anchor.semantic_vector)
            if similarity > best_similarity:
                best_similarity = similarity
                best_anchor = anchor

        return best_anchor

    def get_anchors_in_region(
        self, x1: int, y1: int, x2: int, y2: int
    ) -> List[CodeAnchor]:
        """
        Get all anchors within a rectangular region.

        Args:
            x1, y1: Top-left corner of region
            x2, y2: Bottom-right corner of region

        Returns:
            List of CodeAnchor objects in the region
        """
        results = []
        for (tx, ty), anchor in self._anchors.items():
            if x1 <= tx <= x2 and y1 <= ty <= y2:
                results.append(anchor)
        return results

    def compute_attraction(
        self, entry_vector: np.ndarray, anchor_vector: np.ndarray
    ) -> float:
        """
        Compute semantic attraction between an entry and anchor.

        This is the cosine similarity between the two vectors.

        Args:
            entry_vector: Semantic vector of the memory entry
            anchor_vector: Semantic vector of the code anchor

        Returns:
            Similarity score between -1 and 1
        """
        # Handle dimension mismatch
        min_dim = min(len(entry_vector), len(anchor_vector))
        a = entry_vector[:min_dim]
        b = anchor_vector[:min_dim]

        dot_product = np.dot(a, b)
        norm_a = np.linalg.norm(a)
        norm_b = np.linalg.norm(b)

        if norm_a == 0 or norm_b == 0:
            return 0.0

        return float(dot_product / (norm_a * norm_b))

    def remove_anchor(self, tile: Tuple[int, int]) -> bool:
        """
        Remove an anchor by tile position.

        Args:
            tile: (x, y) position

        Returns:
            True if anchor was removed, False if not found
        """
        if tile in self._anchors:
            anchor = self._anchors[tile]
            if anchor.code_hash in self._hash_to_tile:
                del self._hash_to_tile[anchor.code_hash]
            del self._anchors[tile]
            return True
        return False

    def get_anchors_by_keyword(self, keyword: str) -> List[CodeAnchor]:
        """
        Get all anchors containing a specific keyword.

        Args:
            keyword: Keyword to search for

        Returns:
            List of matching CodeAnchor objects
        """
        keyword_lower = keyword.lower()
        results = []
        for anchor in self._anchors.values():
            if keyword_lower in [k.lower() for k in anchor.keywords]:
                results.append(anchor)
        return results

    def clear(self) -> None:
        """Remove all anchors."""
        self._anchors.clear()
        self._hash_to_tile.clear()

    @property
    def anchors(self) -> Dict[Tuple[int, int], CodeAnchor]:
        """Get all anchors as a dictionary."""
        return self._anchors

    @property
    def count(self) -> int:
        """Get the number of anchors."""
        return len(self._anchors)

    def _hash_code(self, code_content: str) -> str:
        """Generate a hash for code content."""
        return hashlib.sha256(code_content.encode()).hexdigest()[:16]

    def _extract_keywords(self, code_content: str) -> List[str]:
        """Extract keywords from code content."""
        # Simple keyword extraction based on common patterns
        import re

        # Extract function and class names
        func_pattern = r"def\s+(\w+)"
        class_pattern = r"class\s+(\w+)"
        import_pattern = r"(?:from|import)\s+(\w+)"

        keywords = []
        keywords.extend(re.findall(func_pattern, code_content))
        keywords.extend(re.findall(class_pattern, code_content))
        keywords.extend(re.findall(import_pattern, code_content))

        # Remove duplicates and return
        return list(set(keywords))

    def _extract_semantic_vector(self, code_content: str) -> np.ndarray:
        """
        Extract a semantic vector from code content.

        This is a simple hash-based embedding. In production, this would
        use a proper code embedding model.
        """
        # Use hash of code content to generate pseudo-random vector
        hash_bytes = hashlib.sha256(code_content.encode()).digest()

        # Generate vector from hash bytes
        vector = np.zeros(self.vector_dim, dtype=np.float32)
        for i in range(self.vector_dim):
            byte_idx = (i * 4) % len(hash_bytes)
            # Use 4 bytes per dimension for more variation
            value = int.from_bytes(
                hash_bytes[byte_idx : byte_idx + 4], byteorder="big", signed=True
            )
            vector[i] = value / (2**31)  # Normalize to [-1, 1]

        return vector

    def _project_vector(self, vector: np.ndarray) -> np.ndarray:
        """Project vector to target dimension."""
        if len(vector) > self.vector_dim:
            # Truncate
            return vector[: self.vector_dim]
        else:
            # Pad with zeros
            padded = np.zeros(self.vector_dim, dtype=np.float32)
            padded[: len(vector)] = vector
            return padded

    def get_statistics(self) -> Dict[str, Any]:
        """
        Get statistics about the semantic anchors.

        Returns:
            Dict with anchor count, keyword frequency, etc.
        """
        keyword_freq: Dict[str, int] = {}
        for anchor in self._anchors.values():
            for keyword in anchor.keywords:
                keyword_lower = keyword.lower()
                keyword_freq[keyword_lower] = keyword_freq.get(keyword_lower, 0) + 1

        # Get top keywords
        top_keywords = sorted(
            keyword_freq.items(), key=lambda x: x[1], reverse=True
        )[:10]

        return {
            "anchor_count": len(self._anchors),
            "vector_dim": self.vector_dim,
            "top_keywords": top_keywords,
            "unique_keywords": len(keyword_freq),
        }
