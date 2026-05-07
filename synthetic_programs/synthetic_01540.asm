; subroutine calls
; initialization
  LDI r28, 16
  LDI r9, 2134
  LDI r10, 0xDD4784
  LDI r4, 0x6B6F5E
  LDI r8, 0x1D9784
  LDI r0, 0x030423
  LDI r3, 454
  LDI r11, 255
  CALL func_0
func_0:
  MOD r13, r2, r15
  AND r6, r13, r12
  AND r9, r4, r11
  RET
  HALT
