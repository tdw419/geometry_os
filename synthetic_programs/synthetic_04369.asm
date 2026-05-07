; subroutine calls
; initialization
  LDI r9, 794
  LDI r10, 0xA0F734
  LDI r15, 0x8D47B9
  LDI r2, 0x553554
  CALL func_0
func_0:
  MUL r8, r15, r7
  SHR r11, r3, r10
  MOD r12, r13, r1
  ADD r3, r13, r8
  AND r7, r5, r13
  AND r4, r15, r14
  RET
  CALL func_1
func_1:
  OR r15, r14, r7
  AND r1, r10, r12
  DIV r9, r8, r12
  SHL r9, r4, r3
  RET
  CALL func_2
func_2:
  MOD r25, r3, r4
  AND r13, r3, r9
  DIV r0, r12, r29
  RET
  HALT
