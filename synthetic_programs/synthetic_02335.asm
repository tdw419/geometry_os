; subroutine calls
; initialization
  LDI r15, 0x7392A8
  LDI r6, 0xE53530
  LDI r18, 0xB17891
  LDI r3, 32
  CALL func_0
func_0:
  SHR r15, r4, r14
  XOR r1, r0, r11
  DIV r5, r18, r1
  RET
  CALL func_1
func_1:
  ADD r13, r0, r7
  OR r9, r4, r12
  DIV r1, r15, r4
  DIV r9, r5, r14
  RET
  CALL func_2
func_2:
  XOR r7, r4, r11
  DIV r8, r5, r29
  SHL r7, r5, r2
  RET
  HALT
