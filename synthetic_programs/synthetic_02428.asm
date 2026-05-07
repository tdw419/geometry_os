; subroutine calls
; initialization
  LDI r15, 4081
  LDI r3, 4
  LDI r1, 0x226D07
  LDI r4, 10
  CALL func_0
func_0:
  OR r0, r5, r10
  AND r20, r1, r5
  MOD r6, r1, r4
  SHL r14, r11, r9
  RET
  CALL func_1
func_1:
  AND r1, r12, r7
  MUL r5, r3, r13
  XOR r2, r7, r13
  ADD r3, r12, r2
  RET
  CALL func_2
func_2:
  DIV r2, r0, r1
  SUB r5, r14, r1
  OR r11, r14, r9
  SUB r19, r9, r14
  OR r2, r4, r6
  RET
  HALT
