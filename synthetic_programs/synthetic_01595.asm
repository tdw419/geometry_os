; subroutine calls
; initialization
  LDI r3, 0xF601DD
  LDI r14, 0xD42B3F
  CALL func_0
func_0:
  MUL r13, r10, r5
  MUL r8, r13, r5
  XOR r6, r7, r8
  RET
  HALT
