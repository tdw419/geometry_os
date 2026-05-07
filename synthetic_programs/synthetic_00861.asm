; subroutine calls
; initialization
  LDI r7, 256
  LDI r6, 2
  LDI r13, 506
  LDI r15, 4
  CALL func_0
func_0:
  AND r8, r11, r9
  SHL r3, r15, r6
  ADD r8, r11, r6
  RET
  HALT
