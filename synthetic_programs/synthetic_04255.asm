; subroutine calls
; initialization
  LDI r4, 3020
  LDI r3, 2508
  LDI r24, 0x818E0A
  CALL func_0
func_0:
  SHR r5, r9, r3
  MOD r10, r12, r5
  SHL r12, r1, r13
  XOR r8, r15, r13
  OR r1, r6, r8
  AND r14, r6, r12
  RET
  HALT
