; subroutine calls
; initialization
  LDI r0, 16
  LDI r6, 0xA7EED9
  LDI r12, 1597
  LDI r15, 3427
  LDI r11, 10
  LDI r2, 3288
  LDI r5, 0xBAA26D
  CALL func_0
func_0:
  MOD r2, r4, r9
  XOR r11, r7, r10
  OR r6, r9, r4
  SHL r13, r10, r2
  MUL r0, r1, r15
  RET
  CALL func_1
func_1:
  MOD r11, r12, r15
  SUB r6, r4, r0
  SHL r14, r4, r30
  RET
  CALL func_2
func_2:
  ADD r11, r3, r14
  XOR r12, r4, r7
  ADD r15, r5, r13
  OR r8, r9, r11
  MOD r6, r12, r1
  XOR r4, r0, r11
  RET
  HALT
