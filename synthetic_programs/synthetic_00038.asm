; subroutine calls
; initialization
  LDI r7, 3116
  LDI r12, 315
  LDI r14, 2012
  LDI r17, 403
  CALL func_0
func_0:
  AND r9, r13, r1
  OR r14, r3, r4
  SHR r14, r6, r2
  MOD r5, r3, r14
  RET
  CALL func_1
func_1:
  SUB r12, r5, r4
  MUL r5, r1, r9
  AND r5, r4, r16
  XOR r0, r15, r14
  RET
  HALT
