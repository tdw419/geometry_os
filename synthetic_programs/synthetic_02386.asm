; subroutine calls
; initialization
  LDI r13, 0xD8258F
  LDI r6, 2635
  LDI r12, 2
  LDI r15, 2734
  CALL func_0
func_0:
  MUL r12, r15, r13
  AND r24, r2, r9
  SHL r6, r2, r8
  SUB r14, r4, r12
  RET
  CALL func_1
func_1:
  MUL r10, r1, r6
  SHR r25, r13, r7
  ADD r2, r0, r7
  MOD r7, r0, r1
  DIV r12, r8, r4
  RET
  HALT
