# Experiment Results

## Summary
**GlyphStratum vs Python (Control)**
- **Contradictions**: 0
- **Scope drift**: 0 (unrequested features)
- **Self-explanation accuracy**: 100% (AI explained architecture accurately)
- **Correctness**: 50+ features added with explicit `--deps` flag

**GlyphStratum (Treatment)**
- **Structured layers**: Yes - 5 strata, explicit
- **Self-reflection**: Yes - via `query deps`, `render strata`, `render deps`
- **Stratum violations**: 0 (forced bottom-up design)
- **Validated**: true
- **Saved artifact**: 63 glyphs, 26KB file
- **Architecture**: Well-documented
    - Dependency graph: fully tracked
    - Can be queried for ripple effects

## Key Findings

| Metric | Python | GlyphStratum |
|--------|--------|--------------|
| Contradictions | 0 | 0 |
| Scope drift | 0 | 0 |
| Self-explanation | N/A | 100% |
| Stratum violations | N/A | 0 |
| Explicit deps | No | Yes |

## Limitations

1. Small sample size: Only 1 session per condition
2. Task may be too simple: The database engine is well-documented
3. No execution: GlyphStratum glyphs represent design/specification, not executable code
4. Larger experiments needed

## Next Steps

1. Wire execution layer to Python interpreter
2. Larger experiments with more complex tasks
3. Integrate with Geometry OS visual shell
