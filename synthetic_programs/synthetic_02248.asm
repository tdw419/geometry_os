; mixed program
; initialization
  LDI r10, 0x96103C
  LDI r5, 4
  LDI r10, 16
  STORE r10, r3
  LOAD r22, r10
  LDI r11, 0
  STORE r11, r14
  LOAD r13, r11
  PUSH r5
  PUSH r13
  PUSH r13
  SHL r8, r7, r4
  SHL r6, r1, r11
  AND r4, r19, r3
  POP r13
  POP r13
  POP r5
  LDI r12, 0xAF2015
  LDI r2, 8
  LDI r14, 32
  LDI r14, 128
  LDI r13, 3794
  LINE r12, r2, r14, r14, r13
  CMPI r4, 255
main_0:
  CMPI r6, 80
  SHL r5, r27, r4
  SHL r4, r3, r13
  SAR r13, r9, r12
  SHR r4, r9, r12
  LDI r2, 128
  LDI r7, 2224
  LDI r4, 0x54C827
  LDI r5, 0x032E86
  LDI r10, 0xAA4A16
  LINE r2, r7, r4, r5, r10
  IKEY r4
  CMPI r4, 32
  JNZ r4, key_1
  FRAME
  JMP main_0
