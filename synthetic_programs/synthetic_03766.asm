; subroutine calls
; initialization
  LDI r9, 0x1D8122
  LDI r4, 255
  LDI r6, 1
  CALL func_0
func_0:
  XOR r3, r13, r7
  ADD r4, r12, r10
  SHL r11, r0, r9
  SHL r0, r3, r7
  RET
  HALT
