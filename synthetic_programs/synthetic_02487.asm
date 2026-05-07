; subroutine calls
; initialization
  LDI r11, 0xC05D47
  LDI r1, 4
  CALL func_0
func_0:
  SHL r15, r12, r13
  SHL r10, r9, r2
  RET
  CALL func_1
func_1:
  SHR r6, r3, r11
  XOR r10, r11, r4
  MUL r8, r0, r4
  SHL r8, r15, r5
  XOR r11, r3, r13
  OR r0, r1, r8
  RET
  CALL func_2
func_2:
  DIV r7, r5, r12
  DIV r10, r8, r0
  SHL r25, r1, r14
  ADD r9, r13, r15
  MOD r15, r3, r10
  XOR r15, r13, r12
  RET
  HALT
