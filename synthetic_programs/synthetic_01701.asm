; subroutine calls
; initialization
  LDI r5, 3318
  LDI r9, 1135
  CALL func_0
func_0:
  DIV r6, r2, r15
  OR r19, r9, r7
  XOR r17, r12, r10
  SUB r15, r8, r13
  OR r7, r17, r15
  RET
  CALL func_1
func_1:
  SHL r12, r6, r10
  OR r9, r28, r10
  MUL r14, r2, r28
  MUL r13, r12, r15
  ADD r12, r2, r4
  AND r8, r5, r6
  RET
  CALL func_2
func_2:
  SUB r2, r7, r3
  SHR r2, r10, r11
  SUB r4, r6, r12
  SHR r3, r0, r6
  RET
  CALL func_3
func_3:
  MUL r8, r9, r4
  XOR r8, r12, r0
  MOD r5, r11, r7
  RET
  HALT
