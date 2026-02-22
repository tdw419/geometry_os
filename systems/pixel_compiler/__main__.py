"""
Main entry point for pixel_compiler module.

Allows running with: python -m pixel_compiler
"""

from .pixelrts_trace import main

if __name__ == '__main__':
    import sys
    sys.exit(main())
