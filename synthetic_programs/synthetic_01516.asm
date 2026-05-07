; subroutine calls
; initialization
  LDI r6, 0xCDE176
  LDI r2, 10
  LDI r11, 1
  CALL func_0
func_0:
  AND r14, r5, r13
  SHR r15, r29, r22
  SHL r15, r6, r2
  MOD r0, r9, r15
  SHR r0, r14, r2
  MOD r9, r10, r1
  RET
  CALL func_1
func_1:
  SUB r8, r5, r12
  MOD r5, r31, r24
  SHR r7, r4, r13
  DIV r7, r2, r14
  MOD r8, r12, r3
  RET
  HALT
