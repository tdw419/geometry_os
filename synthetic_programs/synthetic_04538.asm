; subroutine calls
; initialization
  LDI r0, 3343
  LDI r10, 128
  LDI r11, 16
  LDI r2, 1667
  LDI r13, 1483
  LDI r5, 1084
  CALL func_0
func_0:
  ADD r5, r2, r6
  MUL r14, r1, r11
  OR r5, r8, r4
  RET
  CALL func_1
func_1:
  SUB r13, r12, r2
  MOD r15, r10, r9
  DIV r15, r13, r9
  SHL r11, r9, r7
  OR r3, r10, r15
  SUB r26, r15, r8
  RET
  HALT
