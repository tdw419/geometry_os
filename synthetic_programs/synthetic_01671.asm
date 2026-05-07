; subroutine calls
; initialization
  LDI r0, 256
  LDI r7, 3945
  CALL func_0
func_0:
  DIV r4, r0, r2
  DIV r10, r4, r14
  SHR r11, r2, r9
  MOD r5, r13, r0
  ADD r2, r13, r12
  MUL r5, r9, r8
  RET
  CALL func_1
func_1:
  DIV r12, r15, r7
  ADD r22, r29, r15
  AND r7, r26, r0
  RET
  CALL func_2
func_2:
  ADD r17, r1, r9
  OR r2, r6, r16
  MUL r13, r8, r10
  ADD r3, r2, r13
  OR r7, r0, r6
  SUB r31, r13, r14
  RET
  HALT
