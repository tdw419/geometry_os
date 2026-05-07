; subroutine calls
; initialization
  LDI r8, 2999
  LDI r9, 33
  LDI r13, 0x89A4F9
  LDI r10, 2458
  LDI r28, 0x91788B
  CALL func_0
func_0:
  AND r0, r10, r9
  XOR r3, r9, r13
  SHL r5, r7, r8
  MOD r2, r13, r31
  RET
  CALL func_1
func_1:
  SHL r12, r1, r5
  AND r0, r5, r6
  SHR r2, r3, r8
  OR r1, r7, r3
  MUL r6, r12, r7
  RET
  CALL func_2
func_2:
  MOD r5, r12, r4
  SHL r7, r10, r5
  RET
  HALT
