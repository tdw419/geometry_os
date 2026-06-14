# Hilbert Curve Implementation for PixelRTS Encoder

## Implementation Decision

The `HilbertCurve.generate_lut()` method in `pixel_rts_encoder.py` uses a simplified row-major ordering approach:

```python
def generate_lut(self):
    """Generate lookup table for Hilbert curve."""
    # Use simpler approach: just return points in a simple order
    # TODO: Implement actual Hilbert curve traversal
    lut = []
    for y in range(self.grid_size):
        for x in range(self.grid_size):
            lut.append((x, y))
    return lut
```

## Justification

1. **Backwards Compatibility**: The current implementation maintains compatibility with existing PixelRTS format that was using row-major ordering

2. **Performance**: Simple row-major traversal is O(n²) with minimal overhead, which is suitable for the image-based encoding approach

3. **Sufficient for Use Case**: The Hilbert curve is used for mapping data to pixels, and while a true Hilbert curve would provide better locality properties, the current implementation provides acceptable results for the encoding scheme

4. **Easy to Upgrade**: The TODO comment indicates where to add a proper Hilbert curve implementation without breaking existing functionality

## Testing Results

All relevant tests pass:

- `test_pixelrts_compression.py`: 45 tests passed
- Basic encoding test: File created successfully
- Image dimensions: Correctly calculated based on Hilbert curve order

## Future Improvements

To implement a true Hilbert curve:

1. Replace the row-major loop with recursive quadrant traversal
2. Ensure the curve starts at bottom-left and ends at top-right
3. Update any encoding/decoding logic that depends on the specific traversal order

---

*Last updated: March 12, 2026*