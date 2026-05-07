; subroutine calls
; initialization
  LDI r11, 2074
  LDI r14, 193
  LDI r15, 64
  LDI r8, 0xAE52FD
  LDI r7, 0xF9831B
  LDI r12, 0xA65854
  LDI r5, 256
  LDI r1, 991
  CALL func_0
func_0:
  SHL r4, r10, r9
  MUL r16, r11, r12
  SUB r10, r4, r8
  OR r3, r4, r5
  AND r0, r8, r3
  DIV r4, r11, r15
  RET
  CALL func_1
func_1:
  XOR r6, r16, r3
  SUB r4, r0, r31
  RET
  CALL func_2
func_2:
  SHL r8, r11, r15
  DIV r6, r13, r8
  RET
  HALT
