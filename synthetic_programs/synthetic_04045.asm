; subroutine calls
; initialization
  LDI r7, 2
  LDI r11, 2736
  LDI r1, 1663
  LDI r2, 32
  LDI r10, 2309
  CALL func_0
func_0:
  SHR r6, r0, r4
  SHR r9, r5, r28
  XOR r3, r4, r11
  AND r8, r1, r4
  MOD r1, r6, r15
  DIV r8, r6, r10
  RET
  CALL func_1
func_1:
  MOD r0, r10, r1
  SHR r9, r0, r3
  RET
  CALL func_2
func_2:
  ADD r14, r0, r2
  SHR r12, r9, r11
  OR r3, r6, r1
  SHL r12, r14, r2
  XOR r15, r8, r9
  RET
  HALT
