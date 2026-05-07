; subroutine calls
; initialization
  LDI r0, 3902
  LDI r7, 16
  LDI r1, 32
  CALL func_0
func_0:
  DIV r0, r14, r10
  SHL r3, r6, r9
  DIV r15, r13, r3
  RET
  CALL func_1
func_1:
  OR r8, r4, r3
  ADD r10, r20, r5
  DIV r1, r10, r9
  SHR r1, r9, r2
  SUB r12, r5, r9
  ADD r2, r14, r3
  RET
  CALL func_2
func_2:
  SUB r4, r11, r19
  DIV r8, r4, r7
  MOD r8, r11, r3
  OR r12, r6, r8
  AND r30, r14, r8
  AND r6, r0, r4
  RET
  HALT
