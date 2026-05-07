; subroutine calls
; initialization
  LDI r3, 0x69B2E3
  LDI r5, 1351
  CALL func_0
func_0:
  ADD r6, r13, r10
  SHL r4, r2, r6
  SHR r7, r5, r13
  SHR r10, r9, r6
  SUB r12, r7, r0
  AND r14, r9, r12
  RET
  CALL func_1
func_1:
  XOR r6, r5, r14
  SHR r15, r9, r26
  SUB r0, r15, r1
  SUB r0, r8, r15
  DIV r10, r2, r9
  SHR r7, r1, r12
  RET
  HALT
