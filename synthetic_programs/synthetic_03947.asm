; subroutine calls
; initialization
  LDI r2, 1987
  LDI r9, 128
  LDI r14, 345
  LDI r8, 0x621A0F
  CALL func_0
func_0:
  ADD r9, r2, r4
  SHR r0, r1, r8
  MOD r11, r13, r3
  SHL r5, r8, r15
  SHL r8, r10, r15
  RET
  CALL func_1
func_1:
  OR r2, r9, r6
  SHR r29, r13, r5
  SHR r12, r3, r27
  ADD r15, r11, r1
  ADD r3, r4, r9
  DIV r7, r12, r2
  RET
  HALT
