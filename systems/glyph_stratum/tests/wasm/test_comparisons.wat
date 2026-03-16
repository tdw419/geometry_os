;; test_comparisons.wat - Test i32 comparison operations
;;
;; This program tests various signed comparison operations:
;;   i32.lt_s, i32.gt_s, i32.le_s, i32.ge_s
;; It stores results at different memory locations.
;;
;; Expected results:
;;   memory[0] = 1  (5 < 10 is true)
;;   memory[1] = 0  (5 > 10 is false)
;;   memory[2] = 1  (5 <= 10 is true)
;;   memory[3] = 0  (5 >= 10 is false)
;;   memory[4] = 1  (5 >= 5 is true)
;;   memory[5] = 1  (5 <= 5 is true)
;;   memory[6] = 0  (-5 < -10 is false)
;;   memory[7] = 1  (-5 > -10 is true)

(module
  (memory 2)  ; 2 pages = 128KB
  
  (func (export "test")
    ;; Test 1: 5 < 10 (should be true)
    i32.const 5
    i32.const 10
    i32.lt_s
    i32.const 0
    i32.store
    
    ;; Test 2: 5 > 10 (should be false)
    i32.const 5
    i32.const 10
    i32.gt_s
    i32.const 4
    i32.store
    
    ;; Test 3: 5 <= 10 (should be true)
    i32.const 5
    i32.const 10
    i32.le_s
    i32.const 8
    i32.store
    
    ;; Test 4: 5 >= 10 (should be false)
    i32.const 5
    i32.const 10
    i32.ge_s
    i32.const 12
    i32.store
    
    ;; Test 5: 5 >= 5 (should be true)
    i32.const 5
    i32.const 5
    i32.ge_s
    i32.const 16
    i32.store
    
    ;; Test 6: 5 <= 5 (should be true)
    i32.const 5
    i32.const 5
    i32.le_s
    i32.const 20
    i32.store
    
    ;; Test 7: -5 < -10 (should be false)
    i32.const -5
    i32.const -10
    i32.lt_s
    i32.const 24
    i32.store
    
    ;; Test 8: -5 > -10 (should be true)
    i32.const -5
    i32.const -10
    i32.gt_s
    i32.const 28
    i32.store
  )
)