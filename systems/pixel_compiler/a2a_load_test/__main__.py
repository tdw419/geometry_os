"""
Allow running as a module: python -m systems.pixel_compiler.a2a_load_test
"""

from .cli import main
import sys

if __name__ == "__main__":
    sys.exit(main())
