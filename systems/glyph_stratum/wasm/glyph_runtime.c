/*
 * GlyphStratum WebAssembly Runtime
 *
 * Executes glyph programs in the browser.
 * Compile with: emcc glyph_runtime.c -o glyph_runtime.wasm -O1 -s WASM=1
 *   --no-entry -s EXPORTED_FUNCTIONS=malloc,free,glyph_execute,glyph_get_result
 */

#include <stdint.h>
#include <stdbool.h>
#include <string.h>

// Stratum definitions
#define STRATUM_SUBSTRATE 0
#define STRATUM_MEMORY    2
#define STRATUM_LOGIC     3
#define STRATUM_SPEC      4
#define STRATUM_INTENT    5

// Opcode definitions
#define OPCODE_DATA      1
#define OPCODE_LOAD      2
#define OPCODE_STORE     3
#define OPCODE_ALLOC     4
#define OPCODE_FREE      5
#define OPCODE_CALL      6
#define OPCODE_BRANCH    7
#define OPCODE_LOOP      8
#define OPCODE_RETURN    9
#define OPCODE_EXPORT    10
#define OPCODE_MODULE    11
#define OPCODE_NOP       12
#define OPCODE_HALT      13

// Value types
#define VALUE_NIL    0
#define VALUE_BOOL   2
#define VALUE_INT    3
#define VALUE_FLOAT  4
#define VALUE_STR    5
#define VALUE_ARRAY  6
#define VALUE_OBJECT 7

// Memory layout
#define MAX_GLYPHS 256
#define MAX_DEPS   16
#define MAX_VALUES 1024
#define MAX_STR    4096

// Glyph structure
typedef struct {
    uint8_t stratum;
    uint8_t opcode;
    uint16_t id;
    uint16_t dep_count;
    uint16_t deps[MAX_DEPS];
    uint16_t value_idx;
    uint8_t executed;
    uint8_t has_result;
} Glyph;

// Value structure (tagged union)
typedef struct {
    uint8_t type;
    union {
        int64_t int_val;
        double float_val;
        uint32_t str_offset;
        uint32_t array_offset;
    };
} Value;

// Runtime state
typedef struct {
    Glyph glyphs[MAX_GLYPHS];
    uint16_t glyph_count;

    Value values[MAX_VALUES];
    uint16_t value_count;

    char strings[MAX_STR];
    uint32_t str_offset;

    uint16_t execution_order[MAX_GLYPHS];
    uint16_t execution_pos;
    uint8_t halted;
    uint8_t error;

    // Result storage
    uint16_t result_glyph;
    Value result_value;
} Runtime;

// Global runtime instance
static Runtime rt = {0};

// Exported functions for JS interop
#ifdef __EMSCRIPTEN__
#include <emscripten.h>
#define EXPORT EMSCRIPTEN_KEEPALIVE
#else
#define EXPORT
#endif

// Memory management
EXPORT void* malloc(size_t size) {
    return 0; // JS handles memory
}

EXPORT void free(void* ptr) {
    // JS handles memory
}

// Initialize runtime
EXPORT void glyph_init(void) {
    memset(&rt, 0, sizeof(rt));
    rt.value_count = 1; // Reserve 0 for nil
    rt.str_offset = 1; // Reserve 0 for empty string
}

// Add a glyph
EXPORT int glyph_add(uint16_t id, uint8_t stratum, uint8_t opcode,
                     uint16_t value_idx) {
    if (rt.glyph_count >= MAX_GLYPHS) return -1;
    if (id >= MAX_GLYPHS) return -2;

    // Check if glyph already exists
    for (int i = 0; i < rt.glyph_count; i++) {
        if (rt.glyphs[i].id == id) return -3;
    }

    Glyph* g = &rt.glyphs[rt.glyph_count++];
    g->id = id;
    g->stratum = stratum;
    g->opcode = opcode;
    g->value_idx = value_idx;
    g->dep_count = 0;
    g->executed = 0;
    g->has_result = 0;

    return 0;
}

// Add dependency to last added glyph
EXPORT int glyph_add_dep(uint16_t dep_id) {
    if (rt.glyph_count == 0) return -1;

    Glyph* g = &rt.glyphs[rt.glyph_count - 1];
    if (g->dep_count >= MAX_DEPS) return -2;

    g->deps[g->dep_count++] = dep_id;
    return 0;
}

// Create an integer value
EXPORT uint16_t glyph_make_int(int64_t val) {
    if (rt.value_count >= MAX_VALUES) return 0;

    Value* v = &rt.values[rt.value_count];
    v->type = VALUE_INT;
    v->int_val = val;

    return rt.value_count++;
}

// Create a float value
EXPORT uint16_t glyph_make_float(double val) {
    if (rt.value_count >= MAX_VALUES) return 0;

    Value* v = &rt.values[rt.value_count];
    v->type = VALUE_FLOAT;
    v->float_val = val;

    return rt.value_count++;
}

// Create a boolean value
EXPORT uint16_t glyph_make_bool(int val) {
    if (rt.value_count >= MAX_VALUES) return 0;

    Value* v = &rt.values[rt.value_count];
    v->type = VALUE_BOOL;
    v->int_val = val ? 1 : 0;

    return rt.value_count++;
}

// Get integer value
EXPORT int64_t glyph_get_int(uint16_t idx) {
    if (idx >= rt.value_count) return 0;
    return rt.values[idx].int_val;
}

// Get float value
EXPORT double glyph_get_float(uint16_t idx) {
    if (idx >= rt.value_count) return 0;
    return rt.values[idx].float_val;
}

// Get value type
EXPORT uint8_t glyph_get_type(uint16_t idx) {
    if (idx >= rt.value_count) return VALUE_NIL;
    return rt.values[idx].type;
}

// Find glyph by ID
static Glyph* find_glyph(uint16_t id) {
    for (int i = 0; i < rt.glyph_count; i++) {
        if (rt.glyphs[i].id == id) return &rt.glyphs[i];
    }
    return 0;
}

// Check if all dependencies are executed
static bool deps_ready(Glyph* g) {
    for (int i = 0; i < g->dep_count; i++) {
        Glyph* dep = find_glyph(g->deps[i]);
        if (!dep || !dep->executed) return false;
    }
    return true;
}

// Topological sort for execution order
static void compute_execution_order(void) {
    rt.execution_pos = 0;

    int remaining[MAX_GLYPHS];
    for (int i = 0; i < rt.glyph_count; i++) {
        remaining[i] = 1;
    }

    int changed = 1;
    while (changed) {
        changed = 0;
        for (int i = 0; i < rt.glyph_count; i++) {
            if (!remaining[i]) continue;

            Glyph* g = &rt.glyphs[i];

            // Check if all deps are done
            int ready = 1;
            for (int j = 0; j < g->dep_count; j++) {
                int found = 0;
                for (int k = 0; k < rt.glyph_count; k++) {
                    if (rt.glyphs[k].id == g->deps[j] && remaining[k]) {
                        found = 1;
                        break;
                    }
                }
                if (found) {
                    ready = 0;
                    break;
                }
            }

            if (ready) {
                rt.execution_order[rt.execution_pos++] = i;
                remaining[i] = 0;
                changed = 1;
            }
        }
    }

    // Add any remaining (circular deps or orphans)
    for (int i = 0; i < rt.glyph_count; i++) {
        if (remaining[i]) {
            rt.execution_order[rt.execution_pos++] = i;
        }
    }
}

// Execute single glyph
static void execute_glyph(Glyph* g) {
    if (g->executed) return;

    g->executed = 1;
    g->has_result = 0;

    switch (g->opcode) {
        case OPCODE_DATA:
            // Data glyph just provides its value
            g->has_result = 1;
            rt.result_value = rt.values[g->value_idx];
            break;

        case OPCODE_LOAD:
            // Load from dependency
            if (g->dep_count > 0) {
                Glyph* src = find_glyph(g->deps[0]);
                if (src && src->has_result) {
                    g->has_result = 1;
                    rt.result_value = rt.values[src->value_idx];
                }
            }
            break;

        case OPCODE_STORE:
            // Store result from dependency
            g->has_result = 1;
            break;

        case OPCODE_CALL: {
            // Binary operation: get two deps and compute
            if (g->dep_count >= 2) {
                Glyph* a = find_glyph(g->deps[0]);
                Glyph* b = find_glyph(g->deps[1]);

                if (a && b && a->has_result && b->has_result) {
                    Value* va = &rt.values[a->value_idx];
                    Value* vb = &rt.values[b->value_idx];

                    // Simple arithmetic for demo
                    if (va->type == VALUE_INT && vb->type == VALUE_INT) {
                        uint16_t result_idx = glyph_make_int(va->int_val + vb->int_val);
                        g->value_idx = result_idx;
                        g->has_result = 1;
                    }
                }
            }
            break;
        }

        case OPCODE_BRANCH:
            // Conditional - result from first satisfied dep
            g->has_result = 1;
            break;

        case OPCODE_LOOP:
            // Iteration - just mark executed
            g->has_result = 1;
            break;

        case OPCODE_RETURN:
            // Return value
            if (g->dep_count > 0) {
                Glyph* src = find_glyph(g->deps[0]);
                if (src && src->has_result) {
                    g->has_result = 1;
                    g->value_idx = src->value_idx;
                    rt.result_value = rt.values[g->value_idx];
                }
            }
            break;

        case OPCODE_EXPORT:
            // Export - just mark executed
            g->has_result = 1;
            break;

        case OPCODE_MODULE:
            // Module entry - mark executed
            g->has_result = 1;
            break;

        case OPCODE_HALT:
            rt.halted = 1;
            break;

        case OPCODE_NOP:
        default:
            break;
    }

    rt.result_glyph = g->id;
}

// Execute all glyphs
EXPORT int glyph_execute(void) {
    rt.halted = 0;
    rt.error = 0;
    rt.execution_pos = 0;

    // Compute execution order
    compute_execution_order();

    // Execute in order
    for (int i = 0; i < rt.execution_pos; i++) {
        Glyph* g = &rt.glyphs[rt.execution_order[i]];
        execute_glyph(g);

        if (rt.halted) break;
    }

    return rt.error;
}

// Get execution result
EXPORT uint16_t glyph_get_result_glyph(void) {
    return rt.result_glyph;
}

EXPORT uint16_t glyph_get_result_value(void) {
    return rt.result_glyph < rt.glyph_count ?
           rt.glyphs[rt.result_glyph].value_idx : 0;
}

// Get glyph count
EXPORT uint16_t glyph_get_count(void) {
    return rt.glyph_count;
}

// Get glyph info
EXPORT uint16_t glyph_get_id(uint16_t idx) {
    return idx < rt.glyph_count ? rt.glyphs[idx].id : 0;
}

EXPORT uint8_t glyph_get_stratum(uint16_t idx) {
    return idx < rt.glyph_count ? rt.glyphs[idx].stratum : 0;
}

EXPORT uint8_t glyph_get_opcode(uint16_t idx) {
    return idx < rt.glyph_count ? rt.glyphs[idx].opcode : 0;
}

EXPORT uint8_t glyph_is_executed(uint16_t idx) {
    return idx < rt.glyph_count ? rt.glyphs[idx].executed : 0;
}

// Reset for new execution
EXPORT void glyph_reset(void) {
    for (int i = 0; i < rt.glyph_count; i++) {
        rt.glyphs[i].executed = 0;
        rt.glyphs[i].has_result = 0;
    }
    rt.halted = 0;
    rt.error = 0;
    rt.execution_pos = 0;
    rt.result_glyph = 0;
}

// Clear all glyphs
EXPORT void glyph_clear(void) {
    glyph_init();
}
