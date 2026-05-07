; subroutine calls
; initialization
  LDI r0, 0
  LDI r11, 607
  CALL func_0
func_0:
  SUB r5, r0, r9
  SHR r30, r3, r12
  RET
  CALL func_1
func_1:
  OR r9, r10, r12
  XOR r0, r3, r13
  SHL r3, r0, r9
  RET
  CALL func_2
func_2:
  MOD r6, r15, r21
  ADD r2, r15, r6
  OR r10, r0, r2
  DIV r0, r3, r12
  RET
  CALL func_3
func_3:
  AND r24, r10, r13
  SUB r13, r14, r5
  DIV r15, r5, r1
  RET
  HALT
