; subroutine calls
; initialization
  LDI r19, 526
  LDI r13, 0x5ACDA5
  LDI r14, 10
  LDI r21, 658
  LDI r12, 299
  LDI r15, 0xF6E60F
  LDI r7, 0xDB984D
  LDI r11, 0x3AFFC1
  CALL func_0
func_0:
  DIV r5, r3, r8
  SHL r4, r15, r1
  SHL r3, r13, r6
  ADD r15, r14, r25
  MUL r2, r14, r13
  RET
  CALL func_1
func_1:
  MUL r17, r8, r14
  MUL r8, r9, r15
  SHL r1, r12, r5
  SHL r1, r8, r7
  ADD r10, r2, r15
  RET
  CALL func_2
func_2:
  AND r8, r3, r27
  MOD r12, r0, r2
  MOD r15, r12, r3
  SHR r11, r7, r13
  RET
  HALT
