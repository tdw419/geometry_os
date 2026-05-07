; subroutine calls
; initialization
  LDI r11, 2390
  LDI r8, 1033
  LDI r1, 128
  LDI r3, 1453
  LDI r6, 128
  LDI r7, 3186
  LDI r19, 3873
  LDI r15, 3094
  CALL func_0
func_0:
  SHR r18, r13, r15
  ADD r12, r2, r10
  RET
  CALL func_1
func_1:
  DIV r9, r1, r6
  AND r11, r7, r4
  OR r2, r5, r3
  MOD r8, r21, r5
  RET
  CALL func_2
func_2:
  MUL r9, r15, r1
  MOD r11, r12, r3
  SHL r6, r2, r13
  XOR r3, r6, r2
  OR r11, r12, r10
  RET
  HALT
