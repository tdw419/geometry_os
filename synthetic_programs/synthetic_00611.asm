; subroutine calls
; initialization
  LDI r3, 4
  LDI r15, 0x19A5AA
  LDI r1, 680
  LDI r7, 0
  LDI r8, 3199
  CALL func_0
func_0:
  SUB r12, r0, r3
  SHR r12, r2, r11
  DIV r13, r14, r7
  RET
  CALL func_1
func_1:
  XOR r4, r6, r16
  DIV r2, r10, r9
  RET
  HALT
