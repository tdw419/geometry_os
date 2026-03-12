# GlyphStratum Experiment Protocol

## Hypothesis

**AI can build complex programs without losing coherence when using GlyphStratum (visual substrate with strata, dependencies, and reflection) vs traditional text-based languages.**

## The AI Coding Problem (Control Condition)

When AI builds software in Python/Rust/JavaScript:
1. Starts strong with clear architecture
2. Accumulates hidden dependencies
3. Forgets earlier decisions
4. Contradicts itself
5. Scope drifts without explicit decision
6. Cannot explain what it built at the end

## Variables

| Variable | Control | Treatment |
|----------|---------|-----------|
| Language | Python | GlyphStratum |
| Interface | File editing | `glyphctl` CLI |
| Visibility | Read code files | `glyphctl render strata/deps` |
| Reflection | Manual review | `glyphctl query deps` |
| Incremental | Ad-hoc | Stratum enforcement |

## Phase 1: Benchmark Task Design

### Task Requirements

The task must be:
- **Complex enough** to cause coherence loss (500+ equivalent lines)
- **Self-contained** (no external dependencies)
- **Verifiable** (clear success criteria)
- **Domain-neutral** (doesn't favor either approach)

### Recommended Task: Build a Lisp Interpreter

**Why Lisp:**
- Self-referential (can interpret itself if successful)
- Clear semantics (easy to verify correctness)
- Naturally layered (lexer → parser → evaluator → builtins)
- Known to cause AI coherence issues at scale

**Specification:**
```
Build a Lisp interpreter that supports:
- Numbers, strings, symbols
- quote, if, define, lambda
- +, -, *, /, =, <, >
- cons, car, cdr, list
- Nested expressions
- Error handling for malformed input
```

**Success Criteria:**
```lisp
; Must correctly evaluate:
(define square (lambda (x) (* x x)))
(square 5)                    ; → 25

(define factorial (lambda (n)
  (if (= n 0) 1 (* n (factorial (- n 1))))))
(factorial 5)                 ; → 120

(define map (lambda (f lst)
  (if (null? lst)
      '()
      (cons (f (car lst)) (map f (cdr lst))))))
(map square '(1 2 3 4 5))     ; → (1 4 9 16 25)
```

---

## Phase 2: Control Experiment (Python)

### Setup

```bash
# Fresh AI session with:
# - Task specification above
# - Empty directory
# - Python 3.10+ available
# - NO prior context about GlyphStratum
```

### Instructions Given to AI

```
You are building a Lisp interpreter in Python.

Requirements:
- Support: numbers, strings, symbols
- Special forms: quote, if, define, lambda
- Builtins: +, -, *, /, =, <, >, cons, car, cdr, list
- Handle nested expressions
- Handle malformed input gracefully

Create a complete, working interpreter.

Work incrementally. Explain your decisions.
```

### Measurements (logged every 10 interactions)

| Metric | How to Measure |
|--------|----------------|
| **Contradictions** | Count times AI contradicts earlier decision |
| **Scope Drift** | Features added without explicit request |
| **Hidden Dependencies** | Functions that call undocumented dependencies |
| **Self-Explanation Accuracy** | At end, ask AI to explain architecture - compare to actual code |
| **Lines of Code** | Final LOC |
| **Correctness** | % of test cases passing |

### Log Format

```
## Interaction N
- Action: [what AI did]
- Decisions: [what was decided]
- Contradictions: [any contradictions with earlier decisions]
- Scope Drift: [any unrequested features]
- Dependencies Added: [new function calls]
```

---

## Phase 3: Treatment Experiment (GlyphStratum)

### Setup

```bash
# Fresh AI session with:
# - Task specification above
# - Empty directory
# - glyphctl CLI available
# - NO prior context about Python implementation
```

### Instructions Given to AI

```
You are building a Lisp interpreter using GlyphStratum.

GlyphStratum is a visual programming substrate. Programs are built as glyphs organized in strata:

Strata (bottom to top):
- SUBSTRATE (0): Raw operations
- MEMORY (1): Allocation, types
- LOGIC (2): Control flow, computation
- SPEC (3): Interfaces, contracts
- INTENT (4): Goals, requirements

Available commands:
- glyphctl add <stratum> <opcode> --rationale "why" --deps 1,2,3
- glyphctl query deps <index>     # What depends on this?
- glyphctl query used <index>     # What does this use?
- glyphctl render strata          # See program by layers
- glyphctl render deps            # See dependency graph
- glyphctl validate               # Check stratum ordering
- glyphctl save <file>            # Save program

Opcodes: ALLOC, FREE, LOAD, STORE, LOOP, BRANCH, CALL, RETURN, DATA, TYPE, MODULE

Build the interpreter by creating glyphs. Each glyph represents a component.
Track dependencies explicitly. Verify ripple effects before changes.

Work incrementally. Start from INTENT stratum, work down.
```

### Measurements (same as control, plus)

| Metric | How to Measure |
|--------|----------------|
| **Stratum Violations** | Times AI tries to add glyph that violates stratum ordering |
| **Dependency Queries** | Count of `glyphctl query` commands |
| **Render Commands** | Count of `glyphctl render` commands (self-reflection) |
| **Validation Runs** | Count of `glyphctl validate` commands |

### Log Format

```
## Interaction N
- Commands: [glyphctl commands issued]
- Glyphs Created: [index, stratum, opcode]
- Dependencies Declared: [explicit dependencies]
- Query Results: [what was discovered]
- Contradictions: [any contradictions with earlier decisions]
- Stratum Violations: [any blocked operations]
```

---

## Phase 4: Analysis

### Comparison Metrics

| Metric | Python (Control) | GlyphStratum (Treatment) | Hypothesis |
|--------|------------------|--------------------------|------------|
| Contradictions | ? | ? | Treatment < Control |
| Scope Drift | ? | ? | Treatment < Control |
| Self-Explanation Accuracy | ? | ? | Treatment > Control |
| Final Correctness | ? | ? | Treatment ≥ Control |
| Reflection Commands | N/A | ? | More = better self-awareness |

### Success Criteria for Hypothesis

GlyphStratum solves the AI coding problem if:
1. **Contradictions reduced by 50%+**
2. **Self-explanation accuracy > 90%** (vs < 70% for control)
3. **Scope drift eliminated or explicitly tracked**
4. **AI can correctly predict ripple effects** when asked

---

## Phase 5: Replication

Run each condition 3 times with fresh AI sessions to account for variance.

### Session Matrix

| Session | Condition | AI Model | Date |
|---------|-----------|----------|------|
| 1 | Python | Claude 4.6 | ? |
| 2 | Python | Claude 4.6 | ? |
| 3 | Python | Claude 4.6 | ? |
| 4 | GlyphStratum | Claude 4.6 | ? |
| 5 | GlyphStratum | Claude 4.6 | ? |
| 6 | GlyphStratum | Claude 4.6 | ? |

---

## Artifacts to Collect

From each session:

```
sessions/
├── python-1/
│   ├── transcript.md      # Full conversation
│   ├── final_code/        # The interpreter code
│   ├── metrics.json       # Quantified measurements
│   └── self_explanation.md # AI's explanation at end
├── python-2/
│   └── ...
├── glyphstratum-1/
│   ├── transcript.md
│   ├── program.glyph      # The GlyphStratum program
│   ├── metrics.json
│   ├── self_explanation.md
│   └── commands.log       # All glyphctl commands
└── ...
```

---

## Running the Experiment

### Control (Python)

```bash
# Start fresh AI session
# Paste control instructions
# Log every interaction
# At end, ask: "Explain the architecture of what you built"
# Run test cases, record pass rate
```

### Treatment (GlyphStratum)

```bash
# Start fresh AI session
# Paste treatment instructions
# Provide: glyphctl --help output
# Log every interaction
# At end, ask: "Explain the architecture of what you built"
# Run: glyphctl render strata + glyphctl render deps
# Compare AI's explanation to actual program structure
```

---

## Notes

- AI sessions should be truly fresh (no context from this document)
- Experimenter should NOT intervene during session
- Log timestamps for temporal analysis
- Consider token count as covariate (longer sessions may drift more)
