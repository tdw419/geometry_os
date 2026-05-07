; subroutine calls
; initialization
  LDI r12, 32
  LDI r15, 0x47A998
  LDI r5, 0xC0ED05
  CALL func_0
func_0:
  OR r1, r15, r5
  SHL r12, r2, r0
  DIV r2, r7, r14
  AND r7, r27, r5
  SHL r7, r1, r14
  XOR r10, r13, r9
  RET
  CALL func_1
func_1:
  DIV r7, r31, r14
  SUB r7, r1, r4
  RET
  HALT
