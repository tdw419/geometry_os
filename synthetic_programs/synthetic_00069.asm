; subroutine calls
; initialization
  LDI r2, 0xC4AF5D
  LDI r12, 2
  LDI r6, 64
  LDI r8, 256
  LDI r3, 0x175A84
  LDI r9, 0x4BD8EF
  CALL func_0
func_0:
  MOD r1, r7, r22
  OR r11, r8, r13
  XOR r1, r0, r7
  RET
  CALL func_1
func_1:
  MUL r0, r3, r12
  MOD r6, r7, r12
  MUL r13, r15, r5
  AND r5, r15, r0
  RET
  CALL func_2
func_2:
  MUL r12, r6, r2
  SHR r12, r4, r0
  XOR r12, r0, r1
  MUL r2, r0, r19
  RET
  HALT
