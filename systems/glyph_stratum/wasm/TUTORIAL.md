# GlyphStratum Tutorial

A step-by-step guide to building programs with GlyphStratum.

## Part 1: Your First Glyph

Let's create a simple program that adds two numbers.

### Step 1: Create Data Glyphs

Data glyphs hold literal values. They live in the SUBSTRATE stratum.

```json
{
  "glyphs": {
    "1": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 5 }
    },
    "2": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 3 }
    }
  }
}
```

We have two glyphs with IDs 1 and 2, holding values 5 and 3.

### Step 2: Add an Operation

Operations live in the LOGIC stratum and depend on other glyphs.

```json
{
  "glyphs": {
    "1": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 5 }
    },
    "2": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 3 }
    },
    "3": {
      "stratum": "LOGIC",
      "opcode": "ADD",
      "dependencies": [1, 2]
    }
  }
}
```

Glyph 3 adds the values from glyphs 1 and 2. Result: 8

### Step 3: Run It

```javascript
const GlyphRuntime = require('./glyph_runtime_f_fallback.js');
const fs = require('fs');

const program = JSON.parse(fs.readFileSync('my_program.glyph', 'utf8'));
const runtime = new GlyphRuntime();
runtime.loadProgram(program);
runtime.execute();

console.log(runtime.getValue(3)); // { type: 'int', value: 8 }
```

## Part 2: Using Variables

Variables use the MEMORY stratum with LOAD and STORE opcodes.

### Storing Values

```json
{
  "glyphs": {
    "1": {
      "stratum": "SUBSTRATE",
      "opcode": "DATA",
      "invariants": { "value": 100 }
    },
    "2": {
      "stratum": "MEMORY",
      "opcode": "STORE",
      "dependencies": [1],
      "invariants": { "name": "score" }
    }
  }
}
```

This stores 100 in a variable named "score".

### Loading Values

```json
{
  "glyphs": {
    "3": {
      "stratum": "MEMORY",
      "opcode": "LOAD",
      "invariants": { "name": "score" }
    }
  }
}
```

This loads the value from "score".

### Complete Example

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 10 } },
    "2": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [1], "invariants": { "name": "x" } },
    "3": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 5 } },
    "4": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [3], "invariants": { "name": "y" } },
    "5": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "x" } },
    "6": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "y" } },
    "7": { "stratum": "LOGIC", "opcode": "MUL", "dependencies": [5, 6] }
  }
}
```

This calculates `x * y` where x=10 and y=5. Result: 50

## Part 3: Comparisons and Branching

### Comparison Opcodes

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 10 } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 5 } },
    "3": { "stratum": "LOGIC", "opcode": "GT", "dependencies": [1, 2] }
  }
}
```

This checks if 10 > 5. Result: `true`

Available comparisons: EQ, NE, LT, LE, GT, GE

### Branching

BRANCH selects between two values based on a condition:

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 7 } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 5 } },
    "3": { "stratum": "LOGIC", "opcode": "GT", "dependencies": [1, 2] },
    "4": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "bigger" } },
    "5": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "smaller" } },
    "6": { "stratum": "LOGIC", "opcode": "BRANCH", "dependencies": [3, 4, 5] }
  }
}
```

Since 7 > 5, glyph 6 returns "bigger".

## Part 4: Strings

### Concatenation

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "Hello" } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": " " } },
    "3": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "World" } },
    "4": { "stratum": "LOGIC", "opcode": "CONCAT", "dependencies": [1, 2] },
    "5": { "stratum": "LOGIC", "opcode": "CONCAT", "dependencies": [4, 3] }
  }
}
```

Result: "Hello World"

### String Length

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "Hello" } },
    "2": { "stratum": "LOGIC", "opcode": "LEN", "dependencies": [1] }
  }
}
```

Result: 5

### Substring

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": "Hello World" } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 0 } },
    "3": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 5 } },
    "4": { "stratum": "LOGIC", "opcode": "SUBSTR", "dependencies": [1, 2, 3] }
  }
}
```

Result: "Hello" (5 characters starting at index 0)

## Part 5: Arrays

### Creating Arrays

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": [] } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 1 } },
    "3": { "stratum": "LOGIC", "opcode": "PUSH", "dependencies": [1, 2] }
  }
}
```

Result: [1]

### Accessing Elements

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": [10, 20, 30] } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 1 } },
    "3": { "stratum": "LOGIC", "opcode": "GET", "dependencies": [1, 2] }
  }
}
```

Result: 20 (element at index 1)

### Modifying Elements

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": [10, 20, 30] } },
    "2": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 1 } },
    "3": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 99 } },
    "4": { "stratum": "LOGIC", "opcode": "SET", "dependencies": [1, 2, 3] }
  }
}
```

Result: [10, 99, 30]

## Part 6: Loops

GlyphStratum uses LOOP to repeat operations. The LOOP opcode takes two dependencies:
1. The update operation (what to repeat)
2. The condition to check

### Simple Counter

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 0 } },
    "2": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [1], "invariants": { "name": "count" } },
    "3": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 10 } },
    "4": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [3], "invariants": { "name": "limit" } },
    "5": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "count" } },
    "6": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "limit" } },
    "7": { "stratum": "LOGIC", "opcode": "LT", "dependencies": [5, 6] },
    "8": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "count" } },
    "9": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 1 } },
    "10": { "stratum": "LOGIC", "opcode": "ADD", "dependencies": [8, 9] },
    "11": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [10], "invariants": { "name": "count" } },
    "12": { "stratum": "LOGIC", "opcode": "LOOP", "dependencies": [11, 7] }
  }
}
```

This counts from 0 to 10. The LOOP repeats glyph 11 (increment) while glyph 7 (count < limit) is true.

## Part 7: Complete Program

Here's a complete factorial program:

```json
{
  "glyphs": {
    "1": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 5 } },
    "2": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [1], "invariants": { "name": "n" } },
    "3": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 1 } },
    "4": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [3], "invariants": { "name": "result" } },
    "5": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "n" } },
    "6": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 0 } },
    "7": { "stratum": "LOGIC", "opcode": "GT", "dependencies": [5, 6] },
    "8": { "stratum": "LOGIC", "opcode": "IFTRUE", "dependencies": [7] },
    "9": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "result" } },
    "10": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "n" } },
    "11": { "stratum": "LOGIC", "opcode": "MUL", "dependencies": [9, 10] },
    "12": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [11], "invariants": { "name": "result" } },
    "13": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "n" } },
    "14": { "stratum": "SUBSTRATE", "opcode": "DATA", "invariants": { "value": 1 } },
    "15": { "stratum": "LOGIC", "opcode": "SUB", "dependencies": [13, 14] },
    "16": { "stratum": "MEMORY", "opcode": "STORE", "dependencies": [15], "invariants": { "name": "n" } },
    "17": { "stratum": "LOGIC", "opcode": "LOOP", "dependencies": [16, 7] },
    "18": { "stratum": "MEMORY", "opcode": "LOAD", "invariants": { "name": "result" } }
  }
}
```

This calculates 5! = 120.

## Best Practices

### 1. Use Meaningful Variable Names

```json
"invariants": { "name": "user_score" }  // Good
"invariants": { "name": "x" }           // Less clear
```

### 2. Keep Glyphs Focused

Each glyph should do one thing well. Break complex operations into steps.

### 3. Check Coherence

Always run `checkCoherence()` after loading a program:

```javascript
runtime.loadProgram(program);
const errors = runtime.checkCoherence();
if (errors.length > 0) {
  console.error('Coherence errors:', errors);
}
```

### 4. Use Execution Traces for Debugging

```javascript
const trace = runtime.executeWithTrace();
trace.forEach(step => {
  console.log(`Glyph ${step.id}: ${step.opcode} -> ${JSON.stringify(step.result)}`);
});
```

### 5. Organize Glyph IDs Logically

Group related glyphs with consecutive IDs:
- 1-10: Input data
- 11-20: Variables
- 21-50: Operations
- 51+: Output

## Next Steps

- Read the [API Reference](./README.md#api-reference)
- Explore the [examples](./examples/)
- Try the VS Code extension for visual editing
