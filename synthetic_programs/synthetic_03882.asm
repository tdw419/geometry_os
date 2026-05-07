; mixed program
; initialization
  LDI r11, 0
  LDI r5, 2
  IKEY r7
  CMPI r7, 248
  JNZ r7, key_0
  LDI r0, 0x047699
loop_1:
  LDI r15, 0x274CD4
  LDI r3, 2
  LDI r7, 0x51FE55
  PSETI
  LDI r14, 0x4993CB
  LDI r5, 2044
  LDI r11, 3334
  LDI r8, 0xEF7D4E
  CIRCLE r14, r5, r11, r8
  SUBI r1, r0, 0x8DB20C
  LDI r5, 1
  SUB r0, r0, r5
  JNZ r0, loop_1
  LDI r10, 0x7FF793
  STORE r10, r13
  LOAD r2, r10
  LDI r12, 383
  STORE r12, r15
  LOAD r24, r12
  LDI r2, 3349
  STORE r2, r6
  LOAD r0, r2
  LDI r8, 0xC87552
  LDI r21, 32
  LDI r4, 0xF25184
  LDI r5, 610
  LDI r7, 64
  LINE r8, r21, r4, r5, r7
  LDI r6, 0xBDCF6F
  LDI r2, 10
  LDI r3, 10
  TEXT r6, r2, r3, "HELLO"
  SAR r15, r14, r9
  SAR r10, r7, r6
  SHLI r0, r10, 10
  SHLI r12, r8, 4
  HALT
