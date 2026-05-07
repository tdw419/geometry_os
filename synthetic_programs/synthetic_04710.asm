; subroutine calls
; initialization
  LDI r15, 2569
  LDI r18, 16
  CALL func_0
func_0:
  DIV r1, r14, r15
  MOD r3, r9, r6
  SHL r1, r7, r10
  RET
  CALL func_1
func_1:
  AND r13, r2, r4
  SUB r0, r12, r14
  RET
  CALL func_2
func_2:
  ADD r12, r1, r20
  XOR r7, r6, r8
  DIV r14, r10, r11
  DIV r9, r1, r7
  MOD r1, r2, r26
  SUB r12, r15, r11
  RET
  HALT
