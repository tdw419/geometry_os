; subroutine calls
; initialization
  LDI r0, 0x3DDB01
  LDI r14, 32
  CALL func_0
func_0:
  SHL r12, r11, r10
  XOR r11, r15, r8
  ADD r12, r10, r22
  ADD r13, r15, r8
  SHR r1, r13, r10
  ADD r15, r12, r9
  RET
  CALL func_1
func_1:
  DIV r13, r0, r8
  AND r12, r3, r7
  SUB r10, r13, r2
  DIV r2, r16, r10
  OR r10, r13, r11
  RET
  HALT
