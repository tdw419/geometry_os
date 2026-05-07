; subroutine calls
; initialization
  LDI r2, 0xAAA479
  LDI r7, 0
  LDI r15, 8
  LDI r1, 0xF9077C
  LDI r12, 0x3ED814
  LDI r8, 256
  LDI r11, 3659
  CALL func_0
func_0:
  SUB r12, r9, r1
  AND r9, r5, r1
  OR r8, r14, r5
  RET
  HALT
