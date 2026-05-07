; subroutine calls
; initialization
  LDI r9, 3757
  LDI r13, 707
  LDI r11, 4
  CALL func_0
func_0:
  DIV r4, r8, r14
  AND r1, r2, r6
  MOD r3, r7, r4
  ADD r2, r0, r8
  MUL r14, r2, r4
  SUB r3, r5, r15
  RET
  CALL func_1
func_1:
  OR r15, r14, r13
  SUB r12, r0, r5
  XOR r5, r10, r1
  SHR r7, r1, r28
  MOD r9, r6, r5
  SHL r5, r7, r10
  RET
  CALL func_2
func_2:
  MOD r9, r4, r1
  XOR r13, r5, r4
  AND r6, r0, r5
  RET
  HALT
