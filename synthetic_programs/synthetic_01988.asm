; subroutine calls
; initialization
  LDI r13, 0xEF4FA8
  LDI r9, 1
  LDI r8, 0xB5F334
  LDI r3, 16
  CALL func_0
func_0:
  MOD r14, r1, r11
  ADD r0, r9, r12
  XOR r2, r10, r0
  RET
  CALL func_1
func_1:
  SHL r9, r21, r5
  SHR r2, r12, r1
  AND r30, r6, r11
  SHR r6, r10, r13
  RET
  CALL func_2
func_2:
  ADD r10, r15, r14
  SUB r8, r10, r26
  SUB r5, r3, r23
  DIV r12, r10, r1
  SUB r4, r11, r21
  RET
  HALT
