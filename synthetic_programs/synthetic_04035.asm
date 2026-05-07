; subroutine calls
; initialization
  LDI r2, 4
  LDI r15, 1781
  LDI r8, 0x1786B6
  CALL func_0
func_0:
  MUL r11, r10, r29
  SUB r9, r14, r15
  DIV r0, r18, r14
  DIV r10, r14, r5
  SUB r6, r10, r1
  SHL r7, r2, r3
  RET
  CALL func_1
func_1:
  ADD r3, r15, r14
  AND r28, r13, r10
  MOD r0, r15, r12
  MUL r2, r12, r1
  RET
  CALL func_2
func_2:
  SHR r2, r4, r13
  ADD r2, r11, r5
  SHR r7, r9, r3
  SUB r6, r12, r11
  XOR r14, r1, r13
  MUL r5, r14, r12
  RET
  CALL func_3
func_3:
  MUL r1, r12, r13
  SUB r6, r1, r0
  AND r25, r12, r7
  SHL r4, r10, r6
  SHL r2, r12, r15
  OR r17, r12, r7
  RET
  HALT
