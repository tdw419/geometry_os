; subroutine calls
; initialization
  LDI r22, 394
  LDI r12, 10
  LDI r8, 4
  LDI r10, 74
  LDI r11, 2
  LDI r1, 4
  LDI r13, 1
  LDI r4, 3427
  CALL func_0
func_0:
  DIV r7, r13, r14
  AND r13, r2, r6
  MUL r13, r10, r8
  RET
  CALL func_1
func_1:
  AND r0, r4, r1
  ADD r7, r12, r9
  ADD r3, r11, r10
  RET
  CALL func_2
func_2:
  MOD r7, r13, r14
  SHL r3, r8, r7
  DIV r4, r13, r14
  SUB r6, r21, r1
  AND r4, r2, r10
  RET
  CALL func_3
func_3:
  AND r2, r11, r3
  OR r6, r2, r9
  MOD r26, r15, r12
  XOR r12, r6, r3
  RET
  HALT
