; subroutine calls
; initialization
  LDI r14, 947
  LDI r4, 4005
  CALL func_0
func_0:
  SHL r7, r29, r2
  SUB r4, r13, r10
  SUB r3, r15, r10
  RET
  CALL func_1
func_1:
  OR r13, r2, r6
  MOD r10, r6, r0
  AND r13, r14, r9
  MOD r10, r8, r3
  RET
  CALL func_2
func_2:
  AND r5, r4, r10
  OR r15, r24, r11
  ADD r2, r6, r12
  SHL r13, r7, r8
  MOD r15, r9, r10
  DIV r7, r2, r11
  RET
  CALL func_3
func_3:
  MUL r14, r12, r5
  ADD r15, r7, r12
  AND r15, r9, r1
  OR r15, r3, r1
  ADD r8, r7, r5
  RET
  HALT
