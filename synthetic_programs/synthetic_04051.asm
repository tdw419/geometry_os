; subroutine calls
; initialization
  LDI r5, 2043
  LDI r12, 0xD0D347
  LDI r7, 0xCC5E99
  LDI r14, 0xFBC4C1
  LDI r11, 64
  LDI r4, 0x5D33D0
  LDI r15, 0
  CALL func_0
func_0:
  MOD r11, r10, r2
  MUL r14, r3, r13
  OR r10, r9, r13
  RET
  CALL func_1
func_1:
  SHL r6, r13, r5
  AND r10, r6, r3
  XOR r8, r2, r6
  MUL r1, r8, r0
  RET
  HALT
