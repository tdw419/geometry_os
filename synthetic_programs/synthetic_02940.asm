; subroutine calls
; initialization
  LDI r9, 128
  LDI r0, 0x0D4BD1
  LDI r10, 0x696D7F
  LDI r8, 156
  LDI r4, 32
  LDI r3, 0xF262DA
  LDI r1, 0xDD72AF
  LDI r14, 0x85CAA7
  CALL func_0
func_0:
  OR r15, r14, r11
  AND r2, r14, r1
  MUL r15, r3, r13
  MOD r10, r0, r12
  RET
  CALL func_1
func_1:
  SUB r9, r11, r8
  XOR r2, r15, r3
  SHL r11, r6, r14
  DIV r3, r5, r4
  RET
  HALT
