#!/usr/bin/env python3
"""
pixelrts_trace - Visual Debugger CLI for PixelRTS Programs

Entry point that allows: python -m pixel_compiler.pixelrts_trace_cli
"""

if __name__ == '__main__':
    import sys
    import os
    # Add parent directory to path
    sys.path.insert(0, os.path.dirname(os.path.abspath(__file__)))
    from pixelrts_trace import main
    sys.exit(main())
