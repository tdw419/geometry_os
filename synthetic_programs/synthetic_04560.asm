; mixed program
; initialization
  LDI r3, 0x573949
  LDI r15, 3787
  LDI r5, 4066
  LDI r30, 255
  LDI r25, 3700
  LDI r0, 16
  LDI r27, 1768
  LDI r6, 4
  CALL func_0
func_0:
  ADD r7, r14, r24
  ADD r9, r7, r14
  DIV r9, r11, r12
  SHR r1, r27, r0
  ADD r13, r2, r7
  RET
  IKEY r0
  CMPI r0, 0x616A25
  JNZ r0, key_1
  CALL func_2
func_2:
  XOR r15, r12, r7
  SHL r8, r6, r13
  SHL r11, r14, r2
  RET
  HALT
