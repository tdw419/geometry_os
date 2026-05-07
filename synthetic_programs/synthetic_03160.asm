; subroutine calls
; initialization
  LDI r6, 0x17EC26
  LDI r5, 3531
  LDI r2, 0x4FA43F
  CALL func_0
func_0:
  AND r0, r1, r2
  MOD r0, r15, r7
  SHR r8, r1, r7
  AND r15, r22, r13
  AND r5, r8, r1
  SHR r6, r2, r15
  RET
  CALL func_1
func_1:
  OR r7, r3, r12
  MUL r6, r14, r1
  SHL r14, r15, r11
  RET
  HALT
