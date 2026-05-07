; subroutine calls
; initialization
  LDI r13, 32
  LDI r2, 16
  CALL func_0
func_0:
  MOD r15, r6, r13
  SHR r7, r13, r1
  SHL r10, r14, r9
  OR r13, r2, r6
  RET
  CALL func_1
func_1:
  OR r4, r3, r15
  SHR r10, r9, r0
  DIV r9, r12, r14
  RET
  CALL func_2
func_2:
  MUL r14, r2, r1
  AND r12, r9, r15
  MUL r12, r13, r15
  RET
  HALT
