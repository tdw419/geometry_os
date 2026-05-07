; subroutine calls
; initialization
  LDI r13, 0x6F755A
  LDI r15, 16
  LDI r5, 1481
  LDI r26, 3650
  LDI r3, 0xED1487
  LDI r11, 3811
  LDI r12, 0x343A15
  CALL func_0
func_0:
  XOR r28, r11, r12
  OR r3, r10, r15
  AND r3, r0, r6
  MOD r10, r12, r4
  XOR r9, r11, r6
  RET
  HALT
