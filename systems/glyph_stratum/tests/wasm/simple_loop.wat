;; simple_loop.wat - Test block/loop/br for WASM interpreter
;;
;; This program counts from 0 to 10 and stores the counter at memory[0].
;; It exercises:
;;   - block/loop structured control flow
;;   - local.get/set for variables
;;   - br_if for conditional branch
;;   - i32 arithmetic (add, comparison)
;;
;; Expected result: memory[0] = 10

(module
  ;; 1 page of linear memory (64KB)
  (memory 1)

  ;; Main test function
  (func (export "test")
    (local $i i32)          ;; Counter variable

    ;; Initialize counter to 0
    i32.const 0
    local.set $i

    ;; Main loop block
    (block $exit
      (loop $continue
        ;; if i >= 10, exit loop
        local.get $i
        i32.const 10
        i32.ge_s             ;; i >= 10 ?
        br_if $exit          ;; If true, exit

        ;; Store i at memory[0]
        i32.const 0          ;; address = 0
        local.get $i         ;; value = i
        i32.store            ;; memory[0] = i

        ;; Increment counter: i = i + 1
        local.get $i
        i32.const 1
        i32.add
        local.set $i

        ;; Continue loop
        br $continue
      )
    )

    ;; Loop complete - memory[0] should be 9 (last stored before exit)
  )
)
