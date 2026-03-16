;; Test WASM host functions
;; Compile: wat2wasm host_test.wat -o host_test.wasm

(module
  ;; Import host functions from Geometry OS
  (import "geos" "poke" (func $poke (param i32 i32)))
  (import "geos" "peek" (func $peek (param i32) (result i32)))
  (import "geos" "print" (func $print (param i32 i32)))

  ;; Memory
  (memory (export "memory") 1)

  ;; Data section - test string
  (data (i32.const 0x100) "Hello from WASM!")

  ;; Entry point
  (func (export "_start")
    (local $val i32)

    ;; Test 1: poke(0x1000, 42)
    i32.const 0x1000
    i32.const 42
    call $poke

    ;; Test 2: val = peek(0x1000)
    i32.const 0x1000
    call $peek
    local.set $val

    ;; Test 3: poke(0x1004, val) - should write 42
    i32.const 0x1004
    local.get $val
    call $poke

    ;; Test 4: print("Hello from WASM!")
    i32.const 0x100
    i32.const 16
    call $print
  )
)
