; subroutine calls
; initialization
  LDI r10, 0xAFCF8E
  LDI r7, 0x9C81F2
  LDI r9, 0x5B2D35
  LDI r11, 483
  LDI r3, 0xEDB96D
  CALL func_0
func_0:
  XOR r1, r13, r0
  SUB r15, r2, r4
  XOR r3, r1, r7
  RET
  CALL func_1
func_1:
  DIV r14, r5, r7
  SHR r12, r5, r15
  AND r15, r11, r14
  RET
  CALL func_2
func_2:
  SHR r4, r8, r9
  XOR r3, r9, r22
  SHL r1, r14, r11
  MOD r4, r0, r14
  OR r15, r13, r10
  RET
  HALT
