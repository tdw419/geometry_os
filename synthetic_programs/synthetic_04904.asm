; subroutine calls
; initialization
  LDI r5, 724
  LDI r2, 2
  LDI r0, 128
  LDI r12, 32
  LDI r10, 16
  LDI r8, 255
  LDI r15, 0x5946F5
  CALL func_0
func_0:
  OR r0, r4, r10
  SHL r5, r15, r13
  AND r12, r14, r13
  RET
  CALL func_1
func_1:
  MOD r4, r6, r8
  XOR r20, r9, r3
  SHR r7, r11, r14
  RET
  HALT
