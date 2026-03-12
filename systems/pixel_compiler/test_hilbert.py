#!/usr/bin/env python3

def hilbert_curve(order):
    """Generate Hilbert curve points starting at bottom-left and ending at top-right."""
    size = 2**order
    
    def generate_points(x, y, axis, level):
        """Recursively generate Hilbert curve points."""
        if level == 0:
            return [(x, y)]
        
        half = size // 2
        points = []
        
        if axis == 0:  # Horizontal
            # U-shape pattern: Right -> Up -> Left -> Down
            points.extend(generate_points(x + half, y, 1, level - 1))  # Right
            points.extend(generate_points(x + half, y + half, 1, level - 1))  # Up
            points.extend(generate_points(x, y + half, 0, level - 1))  # Left
            points.extend(generate_points(x, y, 0, level - 1))  # Down
        else:  # Vertical
            # U-shape pattern: Up -> Left -> Down -> Right
            points.extend(generate_points(x + half, y + half, 0, level - 1))  # Up
            points.extend(generate_points(x, y + half, 0, level - 1))  # Left
            points.extend(generate_points(x, y, 1, level - 1))  # Down
            points.extend(generate_points(x + half, y, 1, level - 1))  # Right
        
        return points
    
    # Start from bottom-left quadrant
    start_x = size // 2
    start_y = size // 2
    
    return generate_points(start_x, start_y, 0, order)

def test_hilbert():
    """Test Hilbert curve implementation."""
    # Test order 2
    lut = hilbert_curve(2)
    print(f'Hilbert curve order: 2')
    print(f'Grid size: {2**2}')
    print(f'Number of points: {len(lut)}')
    print(f'First point: {lut[0]}')
    print(f'Last point: {lut[-1]}')
    
    # Test order 3
    lut3 = hilbert_curve(3)
    print(f'\nHilbert curve order: 3')
    print(f'Grid size: {2**3}')
    print(f'First point: {lut3[0]}')
    print(f'Last point: {lut3[-1]}')
    
    # Verify correct orientation
    assert lut[0] == (0, 0), f'Expected (0, 0), got {lut[0]}'
    assert lut[-1] == (3, 3), f'Expected (3, 3), got {lut[-1]}'
    assert lut3[0] == (0, 0), f'Expected (0, 0), got {lut3[0]}'
    assert lut3[-1] == (7, 7), f'Expected (7, 7), got {lut3[-1]}'
    print('\n✅ All tests passed!')

if __name__ == "__main__":
    test_hilbert()
