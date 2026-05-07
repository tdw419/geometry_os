; subroutine calls
; initialization
  LDI r3, 0xE1EBA9
  LDI r8, 3488
  LDI r14, 256
  CALL func_0
func_0:
  XOR r11, r14, r8
  SHR r4, r6, r5
  XOR r14, r4, r5
  RET
  HALT
