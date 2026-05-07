; subroutine calls
; initialization
  LDI r15, 255
  LDI r3, 0xD6244A
  CALL func_0
func_0:
  XOR r15, r9, r5
  XOR r0, r7, r4
  RET
  CALL func_1
func_1:
  OR r6, r8, r1
  SUB r15, r13, r7
  XOR r1, r10, r11
  SUB r12, r5, r10
  MOD r5, r0, r4
  RET
  CALL func_2
func_2:
  DIV r3, r14, r4
  ADD r10, r11, r3
  MUL r0, r5, r1
  ADD r7, r27, r4
  ADD r5, r1, r11
  RET
  CALL func_3
func_3:
  OR r9, r12, r2
  AND r6, r2, r10
  MUL r1, r6, r11
  MOD r15, r6, r1
  DIV r1, r7, r11
  RET
  HALT
