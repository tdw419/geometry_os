"""
Tests for TerminalTextureAnalyzer - Phase 20-25: Generative Evolution

Test coverage:
1. Analyzer initialization with grid dimensions
2. Loading .rts.png texture files
3. Extracting cell distribution (non_empty, space, colors, styles)
4. Calculating Shannon entropy of character channel
5. Calculating cell density
6. Full texture analysis returning TextureAnalysis dataclass
"""

import pytest
import numpy as np
from PIL import Image
from pathlib import Path
import tempfile

from systems.evolution_daemon.terminal_texture_analyzer import (
    TerminalTextureAnalyzer,
    TextureAnalysis
)


class TestTerminalTextureAnalyzer:
    """Test basic analyzer functionality."""

    def test_analyzer_initialization(self):
        """Analyzer should initialize with grid dimensions."""
        analyzer = TerminalTextureAnalyzer(cols=80, rows=24)
        assert analyzer.cols == 80
        assert analyzer.rows == 24
        assert analyzer.texture is None

    def test_analyzer_initialization_default(self):
        """Analyzer should have reasonable defaults."""
        analyzer = TerminalTextureAnalyzer()
        assert analyzer.cols > 0
        assert analyzer.rows > 0


class TestLoadTexture:
    """Test texture loading from files and buffers."""

    def test_load_texture(self, tmp_path):
        """Analyzer should load .rts.png texture."""
        # Create test texture
        img = Image.new('RGBA', (16, 16), (0, 0, 0, 0))
        test_path = tmp_path / "test.rts.png"
        img.save(test_path)

        analyzer = TerminalTextureAnalyzer(cols=8, rows=8)
        analyzer.load_texture(str(test_path))

        assert analyzer.texture is not None
        assert analyzer.texture.shape == (16, 16, 4)

    def test_load_from_buffer(self):
        """Analyzer should load from numpy array."""
        analyzer = TerminalTextureAnalyzer(cols=8, rows=8)

        # Create test buffer
        buffer = np.zeros((16, 16, 4), dtype=np.uint8)
        buffer[0, 0] = [65, 10, 0, 1]

        analyzer.load_from_buffer(buffer)

        assert analyzer.texture is not None
        assert analyzer.texture.shape == (16, 16, 4)
        assert analyzer.texture[0, 0, 0] == 65


class TestExtractCellDistribution:
    """Test cell distribution extraction."""

    def test_extract_cell_distribution(self):
        """Analyzer should extract cell value distribution."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        # Mock texture with known distribution
        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)
        analyzer.texture[0, 0] = [65, 10, 0, 1]  # 'A' bright green bold
        analyzer.texture[0, 1] = [66, 10, 0, 1]  # 'B'
        analyzer.texture[0, 2] = [32, 7, 0, 0]   # space

        distribution = analyzer.extract_cell_distribution()

        assert distribution['non_empty_cells'] == 2
        assert distribution['space_cells'] == 1
        assert 10 in distribution['fg_color_counts']
        assert distribution['fg_color_counts'][10] == 2
        assert 0 in distribution['bg_color_counts']
        assert 1 in distribution['style_flag_counts']

    def test_extract_empty_texture(self):
        """Empty texture should return all zeros."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)
        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)

        distribution = analyzer.extract_cell_distribution()

        assert distribution['non_empty_cells'] == 0
        assert distribution['space_cells'] == 0
        assert len(distribution['fg_color_counts']) == 0


class TestCalculateEntropy:
    """Test Shannon entropy calculation."""

    def test_calculate_entropy_uniform(self):
        """Uniform distribution has maximum entropy."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        # Create texture with uniform character distribution
        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)
        for i in range(8):
            analyzer.texture[i, 0] = [65 + i, 10, 0, 0]  # Different chars

        entropy = analyzer.calculate_entropy()

        # Should have high entropy (> 2 bits for 8 different chars)
        assert entropy > 2.0

    def test_calculate_entropy_single_char(self):
        """Single character has zero entropy."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)
        analyzer.texture[:, 0] = [65, 10, 0, 0]  # All 'A'

        entropy = analyzer.calculate_entropy()

        # Should have very low entropy
        assert entropy < 0.1

    def test_calculate_entropy_empty(self):
        """Empty texture should have zero entropy."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)
        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)

        entropy = analyzer.calculate_entropy()

        assert entropy == 0.0


class TestCalculateDensity:
    """Test cell density calculation."""

    def test_calculate_density_full(self):
        """Full texture has density 1.0."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        analyzer.texture = np.ones((8, 8, 4), dtype=np.uint8)
        analyzer.texture[:, :, 0] = 65  # All 'A'

        density = analyzer.calculate_density()

        assert density == 1.0

    def test_calculate_density_half(self):
        """Half-filled texture has density 0.5."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)
        analyzer.texture[:4, :] = [65, 10, 0, 0]  # Half filled

        density = analyzer.calculate_density()

        assert density == 0.5

    def test_calculate_density_empty(self):
        """Empty texture has density 0.0."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)
        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)

        density = analyzer.calculate_density()

        assert density == 0.0


class TestFullAnalysis:
    """Test complete texture analysis."""

    def test_analyze_returns_texture_analysis(self):
        """analyze() should return TextureAnalysis dataclass."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        analyzer.texture = np.zeros((8, 8, 4), dtype=np.uint8)
        analyzer.texture[0, 0] = [65, 10, 0, 1]
        analyzer.texture[0, 1] = [66, 10, 0, 1]
        analyzer.texture[0, 2] = [32, 7, 0, 0]

        result = analyzer.analyze()

        assert isinstance(result, TextureAnalysis)
        assert result.non_empty_cells == 2
        assert result.space_cells == 1
        assert result.entropy >= 0
        assert 0 <= result.density <= 1
        assert isinstance(result.fg_color_counts, dict)
        assert isinstance(result.bg_color_counts, dict)
        assert isinstance(result.style_flag_counts, dict)

    def test_analyze_without_texture(self):
        """analyze() without texture should return zeros."""
        analyzer = TerminalTextureAnalyzer(cols=4, rows=4)

        result = analyzer.analyze()

        assert result.non_empty_cells == 0
        assert result.space_cells == 0
        assert result.entropy == 0.0
        assert result.density == 0.0


if __name__ == "__main__":
    pytest.main([__file__, "-v"])
