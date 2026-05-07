; mixed program
; initialization
  LDI r14, 343
  LDI r11, 0xBB929D
  LDI r9, 3571
  IKEY r27
  CMPI r27, 8
  JNZ r27, key_0
  XOR r2, r6, r3
  AND r9, r0, r17
  LDI r1, 0x673A6B
  LDI r0, 2548
  LDI r7, 0xC92643
  DRAWTEXT r1, r0, r7, "WORLD"
  IKEY r14
  CMPI r14, 0xD9E23E
  JNZ r14, key_1
  IKEY r13
  CMPI r13, 45
  JNZ r13, key_2
  LDI r19, 0x32D370
  STORE r19, r12
  LOAD r13, r19
  LDI r13, 16
  STORE r13, r2
  LOAD r14, r13
  LDI r6, 234
  STORE r6, r1
  LOAD r10, r6
  LDI r6, 10
  STORE r6, r3
  LOAD r4, r6
  LDI r5, 16
  STORE r5, r5
  LOAD r0, r5
  LDI r10, 1959
  LDI r6, 1
  LDI r9, 394
  TEXT r10, r6, r9, "HELLO"
  CALL func_3
func_3:
  SHL r14, r1, r11
  DIV r4, r8, r14
  XOR r14, r7, r8
  XOR r15, r9, r19
  ADD r9, r14, r11
  RET
  HALT
