; subroutine calls
; initialization
  LDI r4, 621
  LDI r5, 16
  LDI r0, 2092
  LDI r6, 64
  LDI r15, 3361
  CALL func_0
func_0:
  ADD r2, r0, r25
  SUB r8, r4, r3
  MUL r1, r2, r4
  SHR r9, r10, r24
  OR r8, r12, r1
  ADD r7, r13, r9
  RET
  CALL func_1
func_1:
  XOR r9, r10, r4
  SHR r6, r8, r15
  ADD r8, r0, r2
  AND r5, r2, r9
  MUL r8, r4, r14
  RET
  HALT
