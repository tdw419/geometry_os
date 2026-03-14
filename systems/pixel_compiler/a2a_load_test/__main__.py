"""
Allow running as a module: python -m systems.pixel_compiler.a2a_load_test
"""

import sys

from .cli import main

if __name__ == "__main__":
    sys.exit(main())
