; mixed program
; initialization
  LDI r13, 1111
  LDI r5, 3837
  LDI r14, 0x134E1F
  LDI r16, 2326
  CALL func_0
func_0:
  DIV r2, r17, r5
  ADD r4, r15, r5
  RET
  LDI r14, 8
  STORE r14, r0
  LOAD r4, r14
  LDI r5, 1
  STORE r5, r1
  LOAD r0, r5
  LDI r10, 16
  STORE r10, r11
  LOAD r7, r10
  LDI r9, 2821
  STORE r9, r3
  LOAD r0, r9
  LDI r7, 0
  LDI r15, 1134
  LDI r13, 0x6FA85C
  PSET r7, r15, r13
  OR r7, r18, r3
  IKEY r3
  CMPI r3, 186
  JNZ r3, key_1
  OR r11, r3, r0
  OR r7, r1, r8
  OR r12, r27, r5
  XOR r4, r3, r5
  HALT
