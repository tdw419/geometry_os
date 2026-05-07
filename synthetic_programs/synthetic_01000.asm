; subroutine calls
; initialization
  LDI r9, 0xA13717
  LDI r15, 64
  LDI r11, 2685
  CALL func_0
func_0:
  SHR r11, r7, r15
  MOD r11, r13, r5
  XOR r0, r8, r6
  RET
  HALT
