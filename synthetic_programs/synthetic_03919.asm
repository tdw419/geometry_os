; subroutine calls
; initialization
  LDI r0, 1
  LDI r1, 3356
  LDI r14, 603
  LDI r10, 128
  CALL func_0
func_0:
  AND r2, r10, r13
  MUL r8, r11, r2
  XOR r1, r20, r3
  SUB r13, r8, r4
  SHL r15, r7, r9
  AND r14, r11, r15
  RET
  CALL func_1
func_1:
  MUL r14, r6, r4
  AND r10, r7, r14
  SHR r2, r3, r11
  RET
  CALL func_2
func_2:
  DIV r2, r0, r10
  MUL r4, r15, r13
  RET
  CALL func_3
func_3:
  MOD r7, r9, r5
  MUL r7, r19, r2
  SHR r9, r11, r2
  SHL r8, r5, r14
  SHL r15, r2, r7
  RET
  HALT
