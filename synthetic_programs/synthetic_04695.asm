; subroutine calls
; initialization
  LDI r5, 380
  LDI r0, 8
  LDI r2, 0x94D012
  LDI r13, 32
  CALL func_0
func_0:
  ADD r0, r3, r27
  DIV r28, r11, r2
  ADD r10, r0, r2
  AND r7, r11, r4
  SHL r4, r15, r7
  OR r9, r10, r12
  RET
  CALL func_1
func_1:
  OR r9, r13, r6
  MOD r3, r10, r12
  DIV r6, r3, r12
  RET
  HALT
