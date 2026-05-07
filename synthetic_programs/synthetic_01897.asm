; subroutine calls
; initialization
  LDI r8, 128
  LDI r7, 256
  LDI r10, 2160
  LDI r3, 0x4F2C9F
  CALL func_0
func_0:
  OR r10, r5, r12
  SHR r11, r0, r10
  MOD r3, r8, r9
  OR r1, r8, r4
  RET
  HALT
