; subroutine calls
; initialization
  LDI r9, 0x946807
  LDI r0, 0
  LDI r15, 0xD103F0
  LDI r10, 4
  LDI r13, 2
  LDI r20, 110
  CALL func_0
func_0:
  DIV r6, r5, r4
  DIV r14, r1, r13
  OR r7, r13, r6
  ADD r11, r15, r1
  XOR r6, r4, r7
  RET
  HALT
