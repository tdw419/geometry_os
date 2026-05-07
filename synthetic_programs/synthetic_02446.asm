; mixed program
; initialization
  LDI r4, 128
  LDI r1, 1447
  LDI r25, 4
  LDI r15, 0x748C54
  SHLI r8, r6, 0xD9A762
  SAR r7, r5, r9
  LDI r4, 0xD5EC09
  LDI r13, 271
  LDI r8, 2194
  TEXT r4, r13, r8, "HELLO"
  LDI r13, 0x968E28
loop_0:
  LDI r5, 0xA35546
  LDI r6, 0x1D0707
  LDI r1, 255
  WPIXEL
  SUBI r10, r1, 187
  ANDI r5, r10, 0xE8CE5E
  SUBI r0, r6, 64
  LDI r3, 1
  SUB r13, r13, r3
  JNZ r13, loop_0
  LDI r0x307C, 1212
  STORE r8, r2
  LOAD r14, r8
  LDI r3, 0x30103A
  STORE r3, r6
  LOAD r12, r3
  LDI r11, 8
  STORE r11, r5
  LOAD r6, r11
  LDI r1, 2464
  STORE r1, r10
  LOAD r0, r1
  LDI r12, 128
  STORE r12, r1
  LOAD r9, r12
  SAR r9, r10, r15
  SAR r7, r6, r10
  SHR r17, r5, r3
  SHL r4, r9, r7
  SHL r6, r5, r4
  SAR r7, r1, r5
  SHLI r2, r6, 0x8D0B6E
  SHLI r1, r10, 4
  LDI r8, 1608
  LDI r11, 0xE78DD5
  LDI r8, 0x287831
  TEXT r8, r11, r8, "HELLO"
  LDI r2, 1917
  LDI r25, 0x3D92A7
  LDI r15, 2129
  TEXT r2, r25, r15, "HELLO"
main_1:
  CMPI r9, r6, 0xBA8790
  CMPI r3, 174
  CMPI r8, r7, 69
  FRAME
  JMP main_1
