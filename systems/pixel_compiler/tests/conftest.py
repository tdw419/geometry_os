"""
Test configuration for pixel_compiler tests.
"""
import sys
from pathlib import Path

# Add parent directory (pixel_compiler) to path for imports
# This allows tests to import modules like batch_processor, pattern_detector, etc.
parent_dir = Path(__file__).parent.parent
sys.path.insert(0, str(parent_dir))
