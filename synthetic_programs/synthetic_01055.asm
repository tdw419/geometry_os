; subroutine calls
; initialization
  LDI r5, 0xFBDA36
  LDI r7, 0x0948EF
  CALL func_0
func_0:
  SHR r0, r9, r14
  SHR r0, r5, r1
  SUB r9, r2, r0
  RET
  CALL func_1
func_1:
  MUL r14, r10, r13
  AND r12, r4, r3
  SHL r2, r12, r8
  RET
  CALL func_2
func_2:
  SHR r4, r6, r2
  MOD r10, r12, r9
  MUL r7, r5, r0
  AND r2, r0, r1
  RET
  CALL func_3
func_3:
  DIV r21, r10, r3
  MOD r6, r13, r7
  RET
  HALT
