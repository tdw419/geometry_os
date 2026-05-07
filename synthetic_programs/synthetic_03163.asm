; subroutine calls
; initialization
  LDI r1, 0xE1C51D
  LDI r13, 255
  LDI r0, 2263
  LDI r12, 1484
  LDI r19, 10
  LDI r3, 1971
  LDI r11, 2
  LDI r4, 0xFBC3C3
  CALL func_0
func_0:
  DIV r10, r8, r2
  DIV r0, r10, r15
  SUB r12, r7, r4
  MUL r5, r9, r13
  RET
  CALL func_1
func_1:
  AND r9, r4, r7
  MUL r15, r9, r4
  SHL r4, r11, r8
  RET
  CALL func_2
func_2:
  OR r5, r13, r15
  AND r4, r3, r13
  OR r8, r9, r1
  MUL r8, r13, r1
  RET
  CALL func_3
func_3:
  OR r1, r0, r4
  MUL r0, r27, r1
  MUL r0, r14, r28
  SUB r9, r5, r15
  MOD r12, r8, r1
  RET
  HALT
