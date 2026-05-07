; mixed program
; initialization
  LDI r14, 0
  LDI r11, 128
  LDI r7, 10
  LDI r2, 0xC31D68
  FILL r2
  LDI r15, 0xE83DF5
  STORE r15, r10
  LOAD r8, r15
  LDI r2, 1914
  STORE r2, r4
  LOAD r5, r2
  LDI r1, 0xAFF511
  STORE r1, r12
  LOAD r11, r1
  LDI r0, 0x0A0618
  STORE r0, r12
  LOAD r2, r0
  LDI r11, 64
  STORE r11, r14
  LOAD r2, r11
  DIV r22, r11, r6
  LDI r1, 3364
  LDI r11, 1
  LDI r7, 0xC1EE68
  TEXT r1, r11, r7, "HELLO"
  IKEY r15
  CMPI r15, 223
  JNZ r15, key_0
main_1:
  SHR r5, r13, r7
  SHL r1, r9, r15
  SHLI r13, r5, 1
  SHL r10, r7, r2
  LDI r1, 1
  LDI r0, 128
  LDI r6, 0x60F57D
  DRAWTEXT r1, r0, r6, "WORLD"
  OR r13, r7, r6
  OR r8, r5, r13
  OR r5, r21, r9
  OR r2, r0, r11
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_2
  SHR r14, r3, r13
  IKEY r5
  CMPI r5, 1
  JNZ r5, key_3
  FRAME
  JMP main_1
