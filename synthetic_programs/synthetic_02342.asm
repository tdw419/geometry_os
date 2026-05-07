; subroutine calls
; initialization
  LDI r4, 0x9108C8
  LDI r14, 256
  LDI r15, 0x154755
  LDI r11, 195
  CALL func_0
func_0:
  XOR r13, r9, r3
  XOR r7, r10, r11
  MOD r0, r2, r3
  SHL r11, r9, r13
  RET
  CALL func_1
func_1:
  OR r30, r12, r14
  OR r12, r14, r5
  RET
  HALT
