; subroutine calls
; initialization
  LDI r5, 255
  LDI r13, 2
  LDI r2, 256
  LDI r3, 4
  LDI r1, 255
  LDI r8, 128
  LDI r4, 2
  LDI r10, 0xFF74E8
  CALL func_0
func_0:
  XOR r4, r2, r5
  ADD r12, r14, r11
  XOR r8, r11, r5
  SHR r1, r13, r3
  SUB r4, r12, r15
  RET
  CALL func_1
func_1:
  MUL r2, r7, r4
  MOD r14, r20, r7
  RET
  CALL func_2
func_2:
  OR r0, r6, r3
  MUL r30, r27, r6
  DIV r24, r2, r7
  XOR r13, r1, r20
  RET
  HALT
