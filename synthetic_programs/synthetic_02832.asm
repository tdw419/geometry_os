; subroutine calls
; initialization
  LDI r2, 3872
  LDI r14, 4
  LDI r6, 0
  LDI r0, 0x01DA9D
  LDI r15, 1239
  CALL func_0
func_0:
  SHL r12, r7, r3
  SHL r10, r19, r9
  DIV r1, r14, r6
  XOR r2, r4, r5
  RET
  CALL func_1
func_1:
  SHR r3, r6, r4
  SHL r8, r1, r13
  SUB r12, r14, r3
  SHR r7, r15, r13
  SUB r3, r9, r7
  SUB r13, r6, r5
  RET
  CALL func_2
func_2:
  SHR r6, r8, r10
  SHL r10, r12, r8
  ADD r24, r15, r1
  XOR r14, r9, r2
  OR r6, r4, r9
  RET
  HALT
