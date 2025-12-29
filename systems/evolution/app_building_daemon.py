
import os
import sys
import json
import time
import requests
from pathlib import Path
from typing import Tuple
import subprocess

# Add project root to path
sys.path.append(os.getcwd())

from systems.neural_cpu.tools.llvm_to_rts import LLVMToRTSConverter
from systems.neural_cpu.tools.rts_to_ggufx import convert_to_ggufx
from systems.evolution.ctrm_engine import CTRMEngine

LM_STUDIO_URL = "http://localhost:1234/v1/chat/completions"

class AppBuildingDaemon:
    """
    Sovereignty Daemon Extension: Focuses on building RTS-native apps.
    It conceptualizes app ideas, generates LLVM DNA, compiles them to GGUF-X,
    and deploys them to the /tmp/neural_apps directory.
    """
    
    def __init__(self, output_dir="/tmp/neural_apps"):
        self.output_dir = Path(output_dir)
        self.output_dir.mkdir(parents=True, exist_ok=True)
        self.converter = LLVMToRTSConverter()
        self.ctrm = CTRMEngine()  # CTRM: Intelligent learning system
        
    def generate_app_dna(self, app_intent):
        """Use LM Studio to generate a Typed Opcode Spec (JSON) for the app."""
        prompt = f"""You are a Neural CPU System Architect.
Define a Capability Module (JSON) for this intent: {app_intent}

Use this STRICT JSON SCHEMA:
{{
  "name": "string",
  "ops": [
    {{ "opcode": "string", "args": {{ "key": "value" }} }}
  ]
}}

SUPPORTED_OPS:
1. MEM.ALLOC {{ "id": "var_name", "size": int }} -> Allocates stack memory.
2. MEM.FILL {{ "target": "var_name", "pattern": int, "size": int }} -> Fills memory byte.
3. MATH.ADD {{ "id": "var_name", "a": int, "b": int }} -> id = a + b
4. MATH.MUL {{ "id": "var_name", "a": int, "b": int }} -> id = a * b
5. MATH.DIV {{ "id": "var_name", "a": int, "b": int }} -> id = a / b
6. LOGIC.AND {{ "id": "var_name", "a": int, "b": int }} -> id = a & b
7. LOGIC.OR {{ "id": "var_name", "a": int, "b": int }} -> id = a | b
8. VAL.CHECK {{ "val": "var_name", "expected": int }} -> If val != expected, SYS.EXIT(1).
9. SYS.LOG {{ "msg": "string" }} -> Writes "PASS" (or other msg) to stdout.
10. SYS.EXIT {{ "code": int }} -> Exits program.
11. LOOP.START {{ "id": "loop_name", "counter": "var_name", "max": int }} -> Begin loop (counter from 0 to max-1). NOTE: LOOP.START automatically allocates the counter variable, do NOT use MEM.ALLOC for it.
12. LOOP.END {{ "id": "loop_name" }} -> End loop and increment counter.
13. VAR.INC {{ "id": "var_name" }} -> Increment variable by 1.

LEVEL 6 OPS (Advanced Data Structures):
14. STRUCT.DEFINE {{ "name": "StructName", "fields": [{{"name": "field1", "type": "int", "size": 4}}, {{"name": "field2", "type": "int", "size": 4}}] }} -> Define struct type with fields
15. STRUCT.INIT {{ "id": "var_name", "struct_type": "StructName" }} -> Create struct instance (allocates memory for all fields)
16. STRUCT.FIELD {{ "id": "result_var", "struct_var": "var_name", "field": "field_name" }} -> Access struct field value
17. HEAP.ALLOC {{ "id": "var_name", "size": int }} -> Allocate heap memory (returns pointer)
18. HEAP.FREE {{ "id": "var_name" }} -> Free heap memory
19. PTR.CREATE {{ "id": "ptr_name", "target": "var_name" }} -> Create pointer to variable
20. PTR.DEREF {{ "id": "result_var", "ptr": "ptr_name" }} -> Dereference pointer to get value
21. PTR.ADD {{ "id": "result_ptr", "ptr": "ptr_name", "offset": int }} -> Pointer arithmetic (add offset)
22. PTR.COMPARE {{ "id": "result_var", "ptr1": "ptr_name1", "ptr2": "ptr_name2" }} -> Compare two pointers
23. STR.ALLOC {{ "id": "var_name", "size": int }} -> Allocate dynamic string memory
24. STR.CONCAT {{ "id": "result_var", "str1": "var_name1", "str2": "var_name2" }} -> Concatenate two strings
25. ARRAY.ALLOC {{ "id": "var_name", "element_size": int, "count": int }} -> Allocate dynamic typed array
26. ARRAY.RESIZE {{ "id": "var_name", "new_count": int }} -> Resize dynamic array

NOTE: Loops can be nested. Inner loop IDs must be different from outer loop IDs.
NOTE: STRUCT.DEFINE must be called before STRUCT.INIT. Each field in STRUCT.DEFINE must have name, type, and size.
NOTE: HEAP.ALLOC must be called before HEAP.FREE. Each allocation must have a matching free.
NOTE: PTR.CREATE must be called before PTR.DEREF. Pointer arithmetic must stay within bounds.

Return ONLY the valid JSON object. No markdown, no explanations.
"""
        payload = {
            "messages": [{"role": "user", "content": prompt}],
            "temperature": 0.1,
            "max_tokens": 1024
        }
        
        try:
            response = requests.post(LM_STUDIO_URL, json=payload, timeout=60)
            content = response.json()['choices'][0]['message']['content']
            
            # Clean content (handled markdown wrapping)
            if "```json" in content:
                content = content.split("```json")[1].split("```")[0].strip()
            elif "```" in content:
                content = content.split("```")[1].split("```")[0].strip()
            
            return json.loads(content)
        except Exception as e:
            print(f"❌ LLM Generation/Parsing failed: {e}")
            return None

    def compile_spec_to_llvm(self, spec):
        """Deterministic Compiler: JSON Spec -> Canonical LLVM IR."""
        header = """
        @pass_msg = constant [5 x i8] c"PASS\\0A"
        @fail_msg = constant [5 x i8] c"FAIL\\0A"
        declare void @sys_write(i32, i8*, i32)
        declare void @sys_exit(i32)
        declare i8* @malloc(i32)
        declare void @free(i8*)
        
        define void @_start() {
        entry:
        """
        footer = """
  ret void
}
"""
        body = []
        allocated_vars = set()
        loop_stack = []  # Track active loops for proper nesting

        def ensure_alloc(var_name):
            if var_name in allocated_vars:
                return False
            allocated_vars.add(var_name)
            body.append(f"  %{var_name} = alloca i32, align 4")
            return True

        # Opcode Compiler
        for op in spec.get('ops', []):
            opcode = op.get('opcode')
            args = op.get('args', {})
            
            if opcode == "MEM.ALLOC":
                size = args['size']
                var = args['id']
                # Simplified to alloca i32 for scalar tests
                ensure_alloc(var)
                
            elif opcode == "MEM.FILL":
                target = args['target']
                pattern = args['pattern']
                body.append(f"  ; MEM.FILL {target} {pattern}")
                body.append(f"  store i32 {pattern}, i32* %{target}")
                
            elif opcode.startswith("MATH."):
                var = args['id']
                a, b = args['a'], args['b']
                op_map = {"ADD": "add", "SUB": "sub", "MUL": "mul", "DIV": "sdiv"}
                llvm_op = op_map[opcode.split(".")[1]]
                body.append(f"  %{var}_raw = {llvm_op} i32 {a}, {b}")
                ensure_alloc(var)
                body.append(f"  store i32 %{var}_raw, i32* %{var}")

            elif opcode.startswith("LOGIC."):
                var = args['id']
                a, b = args['a'], args['b']
                op_map = {"AND": "and", "OR": "or", "XOR": "xor"}
                llvm_op = op_map[opcode.split(".")[1]]
                body.append(f"  %{var}_raw = {llvm_op} i32 {a}, {b}")
                ensure_alloc(var)
                body.append(f"  store i32 %{var}_raw, i32* %{var}")

            elif opcode == "VAL.CHECK":
                val_var = args['val']
                expected = args['expected']
                chk_id = int(time.time()) % 1000
                body.append(f"  %val_{chk_id} = load i32, i32* %{val_var}")
                body.append(f"  %cmp_{chk_id} = icmp eq i32 %val_{chk_id}, {expected}")
                body.append(f"  br i1 %cmp_{chk_id}, label %ok_{chk_id}, label %fail_{chk_id}")
                body.append(f"fail_{chk_id}:")
                body.append(f"  call void @sys_exit(i32 1)")
                body.append(f"  ret void")
                body.append(f"ok_{chk_id}:")

            elif opcode == "SYS.LOG":
                msg = args['msg']
                if "PASS" in msg:
                    body.append("  %msg_pass = getelementptr [5 x i8], [5 x i8]* @pass_msg, i32 0, i32 0")
                    body.append("  call void @sys_write(i32 1, i8* %msg_pass, i32 5)")
                else:
                    body.append("  %msg_fail = getelementptr [5 x i8], [5 x i8]* @fail_msg, i32 0, i32 0")
                    body.append("  call void @sys_write(i32 1, i8* %msg_fail, i32 5)")

            elif opcode == "SYS.EXIT":
                code = args['code']
                body.append(f"  call void @sys_exit(i32 {code})")

            elif opcode == "LOOP.START":
                loop_id = args['id']
                counter_var = args['counter']
                max_val = args['max']

                # Allocate and initialize counter
                ensure_alloc(counter_var)
                body.append(f"  store i32 0, i32* %{counter_var}")
                body.append(f"  br label %loop_check_{loop_id}")

                # Loop check label
                body.append(f"loop_check_{loop_id}:")
                body.append(f"  %{counter_var}_val_{loop_id} = load i32, i32* %{counter_var}")
                body.append(f"  %cmp_{loop_id} = icmp slt i32 %{counter_var}_val_{loop_id}, {max_val}")
                body.append(f"  br i1 %cmp_{loop_id}, label %loop_body_{loop_id}, label %loop_exit_{loop_id}")

                # Loop body label
                body.append(f"loop_body_{loop_id}:")

                # Track this loop
                loop_stack.append({'id': loop_id, 'counter': counter_var})

            elif opcode == "LOOP.END":
                loop_id = args['id']

                # Find matching loop
                loop_info = None
                for i in range(len(loop_stack) - 1, -1, -1):
                    if loop_stack[i]['id'] == loop_id:
                        loop_info = loop_stack.pop(i)
                        break

                if not loop_info:
                    raise ValueError(f"LOOP.END without matching LOOP.START: {loop_id}")

                counter_var = loop_info['counter']

                # Increment counter
                body.append(f"  %{counter_var}_inc_{loop_id} = load i32, i32* %{counter_var}")
                body.append(f"  %{counter_var}_next_{loop_id} = add i32 %{counter_var}_inc_{loop_id}, 1")
                body.append(f"  store i32 %{counter_var}_next_{loop_id}, i32* %{counter_var}")
                body.append(f"  br label %loop_check_{loop_id}")

                # Loop exit label
                body.append(f"loop_exit_{loop_id}:")

            elif opcode == "VAR.INC":
                var = args['id']
                inc_id = int(time.time()) % 1000
                body.append(f"  %{var}_load_{inc_id} = load i32, i32* %{var}")
                body.append(f"  %{var}_inc_{inc_id} = add i32 %{var}_load_{inc_id}, 1")
                body.append(f"  store i32 %{var}_inc_{inc_id}, i32* %{var}")

            # LEVEL 6: Struct Operations
            elif opcode == "STRUCT.DEFINE":
                # For now, struct definitions are metadata only
                # We'll track field offsets for STRUCT.FIELD access
                struct_name = args['name']
                fields = args['fields']
                # Store struct metadata for later use
                if not hasattr(self, 'struct_definitions'):
                    self.struct_definitions = {}
                self.struct_definitions[struct_name] = {
                    'fields': fields,
                    'total_size': sum(f['size'] for f in fields)
                }

            elif opcode == "STRUCT.INIT":
                # Allocate memory for struct instance
                var = args['id']
                struct_type = args['struct_type']
                if not hasattr(self, 'struct_definitions') or struct_type not in self.struct_definitions:
                    raise ValueError(f"Struct type '{struct_type}' not defined")

                struct_def = self.struct_definitions[struct_type]
                total_size = struct_def['total_size']

                # Allocate stack space for entire struct
                ensure_alloc(var)

                # Initialize each field to 0
                offset = 0
                for field in struct_def['fields']:
                    field_id = f"{var}_{field['name']}"
                    ensure_alloc(field_id)
                    body.append(f"  store i32 0, i32* %{field_id}")
                    offset += field['size']

            elif opcode == "STRUCT.FIELD":
                # Access a field from a struct
                result_var = args['id']
                struct_var = args['struct_var']
                field_name = args['field']

                # Construct the field variable name
                field_var = f"{struct_var}_{field_name}"

                ensure_alloc(result_var)
                # Load field value into result variable
                body.append(f"  %{result_var}_temp = load i32, i32* %{field_var}")
                body.append(f"  store i32 %{result_var}_temp, i32* %{result_var}")

            # LEVEL 6: Heap Operations
            elif opcode == "HEAP.ALLOC":
                var = args['id']
                size = args['size']

                # Allocate heap memory using malloc
                # Note: We cast i8* to i32 to store in our i32* stack variables
                ensure_alloc(var)
                body.append(f"  %{var}_ptr = call i8* @malloc(i32 {size})")
                body.append(f"  %{var}_ptr_int = ptrtoint i8* %{var}_ptr to i32")
                body.append(f"  store i32 %{var}_ptr_int, i32* %{var}")

            elif opcode == "HEAP.FREE":
                var = args['id']

                # Free heap memory using free
                # Note: We cast i32 back to i8* for free
                body.append(f"  %{var}_ptr_int = load i32, i32* %{var}")
                body.append(f"  %{var}_ptr_free = inttoptr i32 %{var}_ptr_int to i8*")
                body.append(f"  call void @free(i8* %{var}_ptr_free)")

            # LEVEL 6: Pointer Operations
            elif opcode == "PTR.CREATE":
                ptr_name = args['id']
                target_var = args['target']
                
                # Create pointer to variable (store address as integer)
                ensure_alloc(ptr_name)
                body.append(f"  %{ptr_name}_ptr_addr = ptrtoint i32* %{target_var} to i32")
                body.append(f"  store i32 %{ptr_name}_ptr_addr, i32* %{ptr_name}")
                
            elif opcode == "PTR.DEREF":
                result_var = args['id']
                ptr_name = args['ptr']
                
                # Dereference pointer to get value
                ensure_alloc(result_var)
                body.append(f"  %{ptr_name}_load_addr = load i32, i32* %{ptr_name}")
                body.append(f"  %{ptr_name}_int_ptr = inttoptr i32 %{ptr_name}_load_addr to i32*")
                body.append(f"  %{result_var}_derefed = load i32, i32* %{ptr_name}_int_ptr")
                body.append(f"  store i32 %{result_var}_derefed, i32* %{result_var}")
                
            elif opcode == "PTR.ADD":
                result_ptr = args['id']
                ptr_name = args['ptr']
                offset = args['offset']
                
                # Pointer arithmetic (add offset * 4 bytes for i32)
                ensure_alloc(result_ptr)
                body.append(f"  %{ptr_name}_base_addr = load i32, i32* %{ptr_name}")
                body.append(f"  %{result_ptr}_new_addr = add i32 %{ptr_name}_base_addr, {offset * 4}")
                body.append(f"  store i32 %{result_ptr}_new_addr, i32* %{result_ptr}")
                
            elif opcode == "PTR.COMPARE":
                result_var = args['id']
                ptr1_name = args['ptr1']
                ptr2_name = args['ptr2']
                
                # Compare two pointers
                ensure_alloc(result_var)
                body.append(f"  %{ptr1_name}_cmp_addr = load i32, i32* %{ptr1_name}")
                body.append(f"  %{ptr2_name}_cmp_addr = load i32, i32* %{ptr2_name}")
                body.append(f"  %{result_var}_cmp = icmp eq i32 %{ptr1_name}_cmp_addr, %{ptr2_name}_cmp_addr")
                body.append(f"  %{result_var}_int = zext i1 %{result_var}_cmp to i32")
                body.append(f"  store i32 %{result_var}_int, i32* %{result_var}")

            # LEVEL 6: Phase 2 - Strings and Arrays
            elif opcode == "STR.ALLOC":
                var = args['id']
                size = args['size']
                ensure_alloc(var)
                body.append(f"  %{var}_ptr = call i8* @malloc(i32 {size})")
                body.append(f"  %{var}_ptr_int = ptrtoint i8* %{var}_ptr to i32")
                body.append(f"  store i32 %{var}_ptr_int, i32* %{var}")

            elif opcode == "STR.CONCAT":
                res = args['id']
                s1 = args['str1']
                s2 = args['str2']
                ensure_alloc(res)
                # Note: We use the engine's STR_CONCAT primitive via direct indexing or library
                # For LLVM daemon, we'll simulate it via syscall/library in later phases
                # Today we map it to our internal STR_CONCAT primitive in llvm_to_rts
                body.append(f"  ; STR.CONCAT {s1} {s2}")
                # We'll emit a marker that llvm_to_rts will pick up as a STR_CONCAT primitive
                body.append(f"  %{res}_s1 = load i32, i32* %{s1}")
                body.append(f"  %{res}_s2 = load i32, i32* %{s2}")
                body.append(f"  ; MAPPED_OP: STR_CONCAT")
                body.append(f"  store i32 0, i32* %{res}") # Placeholder for now

            elif opcode == "ARRAY.ALLOC":
                var = args['id']
                esize = args['element_size']
                count = args['count']
                ensure_alloc(var)
                total = esize * count
                body.append(f"  %{var}_ptr = call i8* @malloc(i32 {total})")
                body.append(f"  %{var}_ptr_int = ptrtoint i8* %{var}_ptr to i32")
                body.append(f"  store i32 %{var}_ptr_int, i32* %{var}")

            elif opcode == "ARRAY.RESIZE":
                var = args['id']
                new_count = args['new_count']
                # Realloc simulation
                body.append(f"  %{var}_old_ptr_int = load i32, i32* %{var}")
                body.append(f"  %{var}_old_ptr = inttoptr i32 %{var}_old_ptr_int to i8*")
                body.append(f"  ; MAPPED_OP: ARRAY_RESIZE")
                # realloc(ptr, size)
                # For now just re-malloc for simplicity in daemon's LLVM
                body.append(f"  %{var}_new_ptr = call i8* @malloc(i32 {new_count * 4})")
                body.append(f"  %{var}_new_ptr_int = ptrtoint i8* %{var}_new_ptr to i32")
                body.append(f"  store i32 %{var}_new_ptr_int, i32* %{var}")

        return header + "\n".join(body) + footer

    def build_app(self, app_name, app_spec):
        """Compile App Spec to GGUF-X."""
        # 1. Lower Spec to LLVM IR
        llvm_ir = self.compile_spec_to_llvm(app_spec)
        
        app_path = self.output_dir / app_name
        ll_path = app_path.with_suffix(".ll")
        rts_path = app_path.with_suffix(".rts")
        ggufx_path = app_path.with_suffix(".ggufx")
        
        with open(ll_path, "w") as f:
            f.write(llvm_ir)
            
        print(f"🔨 Compiling spec for {app_name}...")
        
        try:
            # 2. LLVM IR -> RTS
            from systems.neural_cpu.tools.llvm_to_rts import LLVMToRTSConverter
            converter = LLVMToRTSConverter()
            converter.parse_file(str(ll_path))
            converter.save_rts(str(rts_path))
            
            # 3. RTS -> GGUF-X
            convert_to_ggufx(str(rts_path), str(ggufx_path), dna_path=str(ll_path))
            
            print(f"✅ App created: {ggufx_path}")
            return ggufx_path
        except Exception as e:
            print(f"❌ Build failed for {app_name}: {e}")
            return None

    def _run_and_verify(self, ggufx_path) -> Tuple[bool, str]:
        """Execute the GGUF-X app and verify it prints 'PASS' and exits 0."""
        print(f"🏃 Running {ggufx_path}...")
        try:
            # Run using the same Python interpreter
            cmd = [sys.executable, "systems/neural_cpu/run_rts.py", str(ggufx_path)]
            result = subprocess.run(cmd, capture_output=True, text=True, timeout=10)
            
            output = result.stdout + result.stderr
            print(f"DEBUG: result.stdout='{result.stdout}'")
            if result.returncode == 0 and ("PASS" in output.upper() or "SUCCESS" in output.upper()):
                print("✅ Runtime Verification: PASS")
                return True, output
            
            print(f"❌ Runtime Verification FAILED. Exit: {result.returncode}")
            return False, output
            
        except subprocess.TimeoutExpired:
            return False, "TIMEOUT"
        except Exception as e:
            return False, str(e)

    def _run_direct_spec(self, app_name, app_spec) -> bool:
        """Build and run a deterministic spec without LLM involvement."""
        ggufx_path = self.build_app(app_name, app_spec)
        if not ggufx_path:
            return False
        passed, _ = self._run_and_verify(ggufx_path)
        return passed

    def run_conformance_suite(self):
        """Run the Neural CPU Conformance Test Suite (Level 1-4)."""
        deterministic_tests = [
            {
                "name": "L4_00_DeterministicLoop",
                "ops": [
                    {"opcode": "LOOP.START", "args": {"id": "loop0", "counter": "i", "max": 5}},
                    {"opcode": "LOOP.END", "args": {"id": "loop0"}},
                    {"opcode": "VAL.CHECK", "args": {"val": "i", "expected": 5}},
                    {"opcode": "SYS.LOG", "args": {"msg": "PASS"}},
                    {"opcode": "SYS.EXIT", "args": {"code": 0}},
                ],
            },
            {
                "name": "L4_01_NestedLoop",
                "ops": [
                    {"opcode": "MEM.ALLOC", "args": {"id": "total", "size": 4}},
                    {"opcode": "MEM.FILL", "args": {"target": "total", "pattern": 0, "size": 4}},
                    {"opcode": "LOOP.START", "args": {"id": "outer", "counter": "i", "max": 3}},
                    {"opcode": "LOOP.START", "args": {"id": "inner", "counter": "j", "max": 4}},
                    {"opcode": "VAR.INC", "args": {"id": "total"}},
                    {"opcode": "LOOP.END", "args": {"id": "inner"}},
                    {"opcode": "LOOP.END", "args": {"id": "outer"}},
                    {"opcode": "VAL.CHECK", "args": {"val": "total", "expected": 12}},
                    {"opcode": "SYS.LOG", "args": {"msg": "PASS"}},
                    {"opcode": "SYS.EXIT", "args": {"code": 0}},
                ],
            },
        ]

        tests = [
            # Level 1: Memory + IO
            {"name": "L1_01_BasicMem", "intent": "malloc 4 bytes; store 170; verify value is 170; if correct print PASS; exit 0"},
            {"name": "L1_05_Stdout", "intent": "print 'PASS' to stdout; exit 0"},

            # Level 2: Arithmetic
            {"name": "L2_06_Math", "intent": "add 42 and 58; if result is 100 print PASS; exit 0"},
            {"name": "L2_07_Bitwise", "intent": "bitwise logic: (240 & 15 == 0); if correct print PASS; exit 0"},

            # Level 3: Control Flow
            {"name": "L3_09_Branch", "intent": "if (1 == 1) print PASS; exit 0"},

            # Level 4: Loops
            {"name": "L4_10_SimpleLoop", "intent": "create a loop that runs exactly 5 times using LOOP.START and LOOP.END; after loop verify counter is 5; if correct print PASS; exit 0"},
            {"name": "L4_11_NestedLoop", "intent": "create nested loops: outer loop runs 3 times, inner loop runs 4 times per outer iteration; count total iterations in a variable; verify total is 12; if correct print PASS; exit 0"},
        ]

        results = {}

        print("\n[SUITE] STARTING CONFORMANCE SUITE")

        # Run deterministic tests
        for det_spec in deterministic_tests:
            print(f"\n[TEST] {det_spec['name']}")
            print("[INTENT] deterministic spec (no LLM)")
            det_success = self._run_direct_spec(det_spec["name"], det_spec)
            results[det_spec["name"]] = "PASS" if det_success else "FAIL"
        
        for test in tests:
            name = test["name"]
            intent = test["intent"]
            
            print(f"\n[TEST] {name}")
            print(f"[INTENT] {intent}")
            
            success = self._run_ralph_loop(name, intent)
            results[name] = "PASS" if success else "FAIL"
            
        print("\n📊 SUITE RESULTS 📊")
        print(json.dumps(results, indent=2))

    def _run_ralph_loop(self, app_name_base, intent) -> bool:
        """Execute Ralph Loop with CTRM intelligent learning."""
        max_attempts = 5
        feedback = None

        # 🧠 CTRM: Analyze intent for known patterns
        ctrm_analysis = self.ctrm.analyze_intent(intent)

        if ctrm_analysis['confidence'] > 0.75:
            # High confidence - try proven pattern first
            print(f"  🧠 CTRM: Found proven pattern (confidence: {ctrm_analysis['confidence']:.2f})")
            print(f"     Success rate: {ctrm_analysis['meta_analysis']['best_match_success_rate']*100:.0f}%")
            print(f"     Historical iterations: {ctrm_analysis['meta_analysis']['avg_iterations_historical']:.1f}")

            spec = ctrm_analysis['recommended_spec']
            ggufx_path = self.build_app(f"{app_name_base}_ctrm", spec)

            if ggufx_path:
                passed, output = self._run_and_verify(ggufx_path)
                if passed:
                    print(f"  ✨ CTRM pattern succeeded on first try!")
                    self.ctrm.record_success(intent, spec, iterations=1)
                    return True
                else:
                    print(f"  ⚠️ CTRM pattern failed, falling back to exploration")
                    failure_reason = self._analyze_failure(output)
                    self.ctrm.record_failure(intent, spec, failure_reason)
        elif ctrm_analysis['confidence'] > 0.0:
            print(f"  🧠 CTRM: Found similar pattern (confidence: {ctrm_analysis['confidence']:.2f})")
            print(f"     Uncertainty: {', '.join(ctrm_analysis['uncertainty_sources'][:2])}")
        else:
            print(f"  🧠 CTRM: Novel problem, using exploratory approach")

        # Standard Ralph Loop with CTRM learning
        for attempt in range(max_attempts):
            print(f"  [LOOP] Iteration {attempt + 1}/{max_attempts}")

            # 1. Generate Spec
            prompt_extras = ""
            if feedback:
                print(f"  [FEEDBACK] {feedback}")
                prompt_extras = f"\n\nPREVIOUS ERROR (Fix this): {feedback}"

            app_spec = self.generate_app_dna(intent + prompt_extras)
            if not app_spec:
                continue

            # 2. Build App
            ggufx_path = self.build_app(f"{app_name_base}_v{attempt}", app_spec)
            if not ggufx_path:
                self.ctrm.record_failure(intent, app_spec, "compile_error")
                feedback = "Build/Compilation failed. Ensure strict JSON and valid Ops."
                continue

            # 3. Run & Verify
            passed, output = self._run_and_verify(ggufx_path)
            if passed:
                print(f"  🎉 Test {app_name_base} PASSED!")
                # 🧠 CTRM: Learn from success
                self.ctrm.record_success(intent, app_spec, iterations=attempt + 1)
                return True
            else:
                output_snippet = output if len(output) < 2000 else "... " + output[-2000:]
                print(f"  ⚠️ Feedback: Runtime Verification Failed. Output:\n{output_snippet}")

                # 🧠 CTRM: Learn from failure
                failure_reason = self._analyze_failure(output)
                self.ctrm.record_failure(intent, app_spec, failure_reason)

                feedback = f"Runtime Verification Failed. Output:\n{output_snippet}\nExpected: 'PASS' and Exit 0."

        print(f"  💀 Test {app_name_base} FAILED after {max_attempts} attempts.")
        return False

    def _analyze_failure(self, output: str) -> str:
        """Extract structured failure reason from output for CTRM learning."""
        output_lower = output.lower()

        # Basic failures
        if "timeout" in output_lower or "max cycles reached" in output_lower:
            return "timeout"
        elif "exit code 1" in output_lower or "exited with code 1" in output_lower:
            return "assertion_failed"
        elif "double increment" in output_lower:
            return "logic_error:double_increment"
        elif "compilation failed" in output_lower or "compile error" in output_lower:
            return "compile_error"
        elif "not found" in output_lower:
            return "missing_dependency"

        # Level 6 specific failures
        elif "null pointer" in output_lower or "nullptr" in output_lower:
            return "level6:null_pointer_error"
        elif "memory leak" in output_lower:
            return "level6:memory_leak"
        elif "heap corruption" in output_lower or "heap overflow" in output_lower:
            return "level6:heap_corruption"
        elif "type mismatch" in output_lower or "type error" in output_lower:
            return "level6:type_error"
        elif "invalid cast" in output_lower or "bad cast" in output_lower:
            return "level6:cast_error"
        elif "access violation" in output_lower or "segmentation fault" in output_lower:
            return "level6:access_violation"
        elif "alignment error" in output_lower:
            return "level6:alignment_error"
        elif "vtable" in output_lower:
            return "level6:vtable_error"

        else:
            return "unknown_error"

    def run_cycle(self):
        """Entry point."""
        self.run_conformance_suite()

if __name__ == "__main__":
    daemon = AppBuildingDaemon()
    print("[START] App Building Daemon Online. Target: RTS Native Apps.")
    while True:
        daemon.run_cycle()
        time.sleep(30)
