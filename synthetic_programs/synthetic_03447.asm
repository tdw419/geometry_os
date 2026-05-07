; subroutine calls
; initialization
  LDI r1, 128
  LDI r10, 1619
  LDI r4, 611
  CALL func_0
func_0:
  SHR r4, r15, r1
  XOR r17, r2, r7
  MOD r6, r8, r14
  SUB r4, r13, r10
  MUL r5, r1, r3
  XOR r29, r25, r4
  RET
  CALL func_1
func_1:
  SHL r13, r15, r14
  SHR r10, r9, r4
  SHL r4, r15, r8
  RET
  CALL func_2
func_2:
  MOD r23, r6, r3
  SHL r4, r10, r17
  SHR r31, r7, r2
  OR r3, r5, r13
  RET
  HALT
