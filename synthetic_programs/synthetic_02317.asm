; mixed program
; initialization
  LDI r2, 1612
  LDI r14, 0x2DE27A
  LDI r8, 0x58E032
  LDI r3, 256
  LDI r5, 0x7FC8BF
  LDI r6, 0x46AB17
  IKEY r11
  CMPI r11, 0x000BF0
  JNZ r11, key_0
  OR r9, r13, r0
  OR r11, r1, r15
  OR r14, r0, r24
  OR r8, r10, r3
  OR r0, r10, r11
  OR r15, r7, r3
  CALL func_1
func_1:
  SHL r4, r1, r10
  AND r2, r9, r6
  MUL r6, r13, r14
  AND r5, r14, r7
  RET
  CMP r11, r9
  IKEY r6
  CMPI r6, 0x6FBD8C
  JNZ r6, key_2
  LDI r5, 0x8338E7
  STORE r5, r9
  LOAD r0, r5
  LDI r8, 0x70FD
  STORE r8, r10
  LOAD r14, r8
  LDI r16, 0x989A6C
  STORE r16, r4
  LOAD r8, r16
  LDI r11, 8
  STORE r11, r8
  LOAD r10, r11
  LDI r6, 4093
  STORE r6, r10
  LOAD r3, r6
  HALT
