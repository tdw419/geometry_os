; subroutine calls
; initialization
  LDI r8, 256
  LDI r12, 128
  LDI r0, 2419
  LDI r14, 10
  LDI r9, 2082
  LDI r5, 1
  LDI r2, 1
  CALL func_0
func_0:
  AND r14, r0, r4
  OR r8, r20, r12
  MOD r7, r1, r13
  SHR r14, r0, r4
  RET
  CALL func_1
func_1:
  ADD r1, r12, r5
  SHR r0, r25, r8
  MUL r9, r14, r21
  MUL r12, r6, r8
  AND r12, r7, r14
  OR r14, r9, r6
  RET
  CALL func_2
func_2:
  SHR r8, r5, r3
  MUL r13, r15, r2
  SHR r3, r2, r11
  AND r3, r1, r4
  SHL r2, r0, r15
  DIV r8, r7, r1
  RET
  HALT
