; subroutine calls
; initialization
  LDI r12, 3889
  LDI r0, 1
  CALL func_0
func_0:
  ADD r6, r7, r4
  MOD r7, r0, r3
  OR r12, r9, r2
  RET
  CALL func_1
func_1:
  SHL r24, r11, r13
  ADD r6, r11, r15
  XOR r14, r3, r10
  DIV r3, r14, r24
  OR r13, r20, r1
  RET
  CALL func_2
func_2:
  SHL r4, r3, r14
  MUL r7, r2, r12
  MOD r4, r7, r5
  OR r3, r31, r5
  RET
  CALL func_3
func_3:
  DIV r17, r6, r3
  ADD r0, r5, r12
  AND r3, r0, r15
  SHR r2, r6, r7
  OR r10, r2, r1
  AND r4, r9, r10
  RET
  HALT
