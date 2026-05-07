; subroutine calls
; initialization
  LDI r7, 2
  LDI r16, 16
  LDI r4, 128
  LDI r0, 0xA166E2
  CALL func_0
func_0:
  SHL r13, r15, r2
  SHL r14, r4, r7
  RET
  CALL func_1
func_1:
  XOR r11, r0, r10
  DIV r24, r3, r8
  RET
  HALT
