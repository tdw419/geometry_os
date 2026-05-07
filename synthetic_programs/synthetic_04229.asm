; subroutine calls
; initialization
  LDI r11, 0x49F27D
  LDI r28, 0x5C4C05
  LDI r7, 848
  LDI r1, 10
  LDI r13, 1614
  LDI r5, 2535
  LDI r15, 1
  CALL func_0
func_0:
  DIV r7, r11, r6
  MOD r2, r9, r10
  ADD r0, r3, r12
  XOR r15, r0, r1
  RET
  CALL func_1
func_1:
  XOR r8, r12, r7
  AND r4, r1, r12
  SHR r10, r30, r9
  SHR r7, r2, r15
  OR r10, r9, r6
  RET
  CALL func_2
func_2:
  MUL r11, r4, r2
  SUB r3, r0, r10
  AND r10, r6, r4
  RET
  HALT
