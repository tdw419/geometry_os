; subroutine calls
; initialization
  LDI r2, 1381
  LDI r10, 2698
  LDI r1, 1
  LDI r15, 4045
  LDI r14, 2327
  CALL func_0
func_0:
  MOD r8, r1, r9
  ADD r28, r3, r9
  DIV r3, r0, r12
  XOR r5, r8, r11
  RET
  CALL func_1
func_1:
  DIV r0, r10, r28
  OR r13, r5, r0
  DIV r2, r7, r13
  MOD r13, r12, r3
  SHR r0, r6, r10
  RET
  CALL func_2
func_2:
  MOD r11, r14, r1
  SHR r10, r8, r12
  RET
  CALL func_3
func_3:
  XOR r15, r13, r5
  SHL r7, r9, r8
  SHR r8, r11, r9
  DIV r9, r5, r14
  ADD r7, r5, r11
  RET
  HALT
