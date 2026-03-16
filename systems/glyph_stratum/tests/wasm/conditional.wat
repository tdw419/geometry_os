;; conditional.wat - Test if/else for WASM interpreter
;;
;; This program tests conditional execution with if/else.
;; It stores 1 at memory[0] if condition is true, 2 if false.
;;
;; Expected result: memory[0] = 1

(module
  (memory 1)

  (func (export "test")
    ;; Push condition (42 > 10 = true)
    i32.const 42
    i32.const 10
    i32.gt_s                ;; 42 > 10 = 1 (true)

    ;; Conditional: if true store 1, else store 2
    (if
      (then
        i32.const 0         ;; address
        i32.const 1         ;; value
        i32.store           ;; memory[0] = 1
      )
      (else
        i32.const 0         ;; address
        i32.const 2         ;; value
        i32.store           ;; memory[0] = 2
      )
    )
  )
)
