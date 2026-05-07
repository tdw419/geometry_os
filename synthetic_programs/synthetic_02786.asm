; subroutine calls
; initialization
  LDI r15, 255
  LDI r5, 0x36CE40
  LDI r14, 20
  LDI r10, 8
  LDI r1, 0
  CALL func_0
func_0:
  SHR r11, r31, r7
  SHR r14, r11, r0
  MOD r17, r2, r4
  ADD r16, r11, r0
  SHL r15, r4, r13
  SHL r2, r1, r15
  RET
  CALL func_1
func_1:
  ADD r11, r8, r7
  MOD r7, r10, r12
  XOR r6, r11, r9
  SHL r3, r6, r10
  DIV r9, r15, r3
  RET
  CALL func_2
func_2:
  MOD r10, r0, r6
  SHL r4, r9, r0
  ADD r6, r9, r3
  OR r8, r2, r28
  RET
  CALL func_3
func_3:
  MUL r8, r2, r3
  DIV r11, r0, r14
  OR r0, r8, r2
  RET
  HALT
