; subroutine calls
; initialization
  LDI r3, 4
  LDI r26, 4
  CALL func_0
func_0:
  ADD r10, r4, r13
  DIV r1, r14, r10
  SHL r8, r6, r9
  DIV r3, r2, r9
  RET
  CALL func_1
func_1:
  XOR r12, r4, r11
  AND r9, r11, r15
  RET
  CALL func_2
func_2:
  ADD r8, r13, r7
  ADD r30, r15, r0
  XOR r11, r3, r9
  ADD r7, r13, r1
  MOD r2, r4, r6
  RET
  HALT
