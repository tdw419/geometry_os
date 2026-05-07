; subroutine calls
; initialization
  LDI r13, 0x8CD109
  LDI r4, 0xDF557E
  LDI r8, 1534
  CALL func_0
func_0:
  ADD r24, r11, r10
  DIV r6, r3, r15
  OR r5, r8, r11
  OR r12, r4, r15
  DIV r1, r6, r14
  RET
  CALL func_1
func_1:
  SUB r8, r12, r4
  ADD r12, r6, r1
  OR r11, r0, r3
  RET
  CALL func_2
func_2:
  SHR r14, r3, r11
  MUL r3, r6, r9
  RET
  HALT
