; subroutine calls
; initialization
  LDI r13, 0x1277CE
  LDI r15, 128
  LDI r2, 255
  LDI r3, 1050
  LDI r9, 963
  CALL func_0
func_0:
  SUB r8, r0, r13
  MUL r6, r13, r3
  XOR r10, r13, r3
  OR r10, r0, r11
  MOD r14, r15, r11
  SHL r10, r6, r5
  RET
  CALL func_1
func_1:
  MOD r4, r0, r8
  SHL r3, r24, r14
  OR r8, r5, r15
  OR r10, r7, r14
  XOR r7, r8, r12
  RET
  HALT
