; subroutine calls
; initialization
  LDI r15, 1537
  LDI r2, 1704
  LDI r8, 0x96E82F
  LDI r3, 3764
  LDI r11, 16
  CALL func_0
func_0:
  SUB r19, r6, r9
  SUB r4, r7, r16
  DIV r2, r11, r3
  MOD r12, r10, r15
  AND r0, r15, r4
  RET
  CALL func_1
func_1:
  SHR r2, r12, r5
  SUB r14, r4, r13
  ADD r20, r8, r14
  SUB r0, r12, r25
  OR r14, r2, r4
  RET
  CALL func_2
func_2:
  XOR r21, r0, r10
  ADD r4, r6, r3
  MOD r0, r2, r3
  SUB r13, r11, r3
  DIV r11, r14, r6
  OR r0, r5, r9
  RET
  HALT
