; subroutine calls
; initialization
  LDI r14, 32
  LDI r6, 0x16266C
  LDI r13, 1013
  LDI r11, 0x1FB775
  CALL func_0
func_0:
  XOR r15, r3, r6
  AND r1, r7, r15
  AND r2, r15, r12
  XOR r2, r13, r11
  DIV r14, r6, r30
  RET
  CALL func_1
func_1:
  XOR r0, r5, r11
  AND r14, r7, r12
  RET
  CALL func_2
func_2:
  ADD r0, r11, r2
  XOR r2, r0, r7
  SHR r6, r12, r9
  ADD r9, r14, r12
  XOR r2, r12, r14
  MOD r4, r10, r11
  RET
  CALL func_3
func_3:
  ADD r4, r5, r7
  SHR r13, r1, r10
  RET
  HALT
