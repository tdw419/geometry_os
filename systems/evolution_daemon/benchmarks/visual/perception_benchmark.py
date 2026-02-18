"""
Visual Perception Benchmarks

A collection of static and dynamic scenes used to verify the AI's 
visual perception capabilities before and after self-evolution.
"""

SCENES = {
    "basic_ui": {
        "description": "Standard window with buttons and text",
        "elements": [
            {"type": "window", "x": 100, "y": 100, "width": 400, "height": 300},
            {"type": "button", "x": 120, "y": 120, "width": 80, "height": 30, "text": "Click Me"},
            {"type": "text", "x": 120, "y": 160, "text": "System Status: Online"}
        ]
    },
    "complex_overlap": {
        "description": "Multiple overlapping tiles testing depth perception",
        "elements": [
            {"type": "tile", "x": 50, "y": 50, "width": 200, "height": 200, "z": 0},
            {"type": "tile", "x": 100, "y": 100, "width": 200, "height": 200, "z": 1},
            {"type": "tile", "x": 150, "y": 150, "width": 200, "height": 200, "z": 2}
        ]
    }
}
