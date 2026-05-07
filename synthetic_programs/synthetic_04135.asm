; subroutine calls
; initialization
  LDI r3, 1418
  LDI r1, 1045
  LDI r9, 0xDBF4F4
  LDI r6, 1729
  LDI r13, 256
  CALL func_0
func_0:
  MOD r10, r5, r14
  AND r6, r7, r12
  SHL r1, r15, r6
  MUL r0, r2, r11
  ADD r2, r6, r15
  AND r11, r3, r10
  RET
  CALL func_1
func_1:
  SUB r11, r3, r8
  DIV r0, r6, r21
  SHR r7, r3, r11
  DIV r21, r14, r13
  SHL r2, r6, r5
  RET
  HALT
