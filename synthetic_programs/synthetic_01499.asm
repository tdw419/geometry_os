; subroutine calls
; initialization
  LDI r13, 128
  LDI r5, 0x6D47EB
  CALL func_0
func_0:
  DIV r13, r14, r4
  SHL r24, r13, r5
  AND r19, r16, r13
  MUL r13, r2, r12
  SUB r7, r12, r2
  RET
  CALL func_1
func_1:
  SHL r2, r3, r9
  XOR r8, r1, r9
  MOD r4, r3, r5
  RET
  CALL func_2
func_2:
  SUB r1, r0, r3
  DIV r0, r5, r6
  RET
  HALT
