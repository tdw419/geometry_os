; subroutine calls
; initialization
  LDI r12, 8
  LDI r1, 0xC1D089
  LDI r2, 0x8DA473
  LDI r11, 2
  LDI r20, 1284
  LDI r13, 2
  LDI r14, 8
  CALL func_0
func_0:
  SUB r10, r9, r3
  XOR r6, r1, r9
  XOR r11, r2, r8
  RET
  CALL func_1
func_1:
  AND r11, r0, r3
  DIV r14, r24, r1
  MOD r6, r12, r9
  AND r7, r9, r3
  AND r11, r3, r8
  RET
  CALL func_2
func_2:
  XOR r31, r6, r11
  OR r15, r1, r6
  SUB r10, r1, r5
  MOD r30, r6, r28
  MOD r8, r1, r13
  SUB r15, r0, r8
  RET
  HALT
