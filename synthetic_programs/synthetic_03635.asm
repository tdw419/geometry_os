; subroutine calls
; initialization
  LDI r13, 16
  LDI r6, 1
  LDI r12, 1121
  LDI r2, 0x5F0E6E
  LDI r8, 4
  LDI r7, 255
  LDI r29, 0x143A2B
  CALL func_0
func_0:
  MOD r2, r24, r1
  SHR r0, r13, r15
  ADD r4, r11, r0
  DIV r7, r10, r13
  RET
  CALL func_1
func_1:
  OR r2, r13, r11
  OR r8, r5, r11
  MUL r1, r11, r7
  SHR r13, r10, r15
  RET
  CALL func_2
func_2:
  MUL r1, r9, r2
  AND r9, r0, r13
  ADD r8, r9, r14
  RET
  CALL func_3
func_3:
  DIV r11, r9, r0
  ADD r0, r9, r13
  SUB r3, r13, r12
  SUB r16, r5, r14
  SHL r8, r13, r6
  RET
  HALT
