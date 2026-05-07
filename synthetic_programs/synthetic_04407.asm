; mixed program
; initialization
  LDI r6, 1759
  LDI r5, 2189
  LDI r8, 2657
  LDI r10, 2857
  LDI r15, 0x6B9015
  LDI r1, 64
  PUSH r9
  PUSH r5
  PUSH r10
  PUSH r1
  SUB r4, r2, r11
  OR r1, r13, r9
  SHR r3, r12, r7
  SUB r29, r0, r26
  AND r13, r3, r15
  POP r1
  POP r10
  POP r5
  POP r9
  SHLI r3, r10, 0x7C3F01
  SAR r15, r1, r8
  XOR r14, r5, r3
  XOR r3, r10, r15
  AND r7, r2, r11
  XOR r15, r10, r3
  LDI r10, 4
  STORE r10, r8
  LOAD r11, r10
  LDI r14, 0xC2382D
  STORE r14, r11
  LOAD r7, r14
  LDI r14, 16
  STORE r14, r13
  LOAD r5, r14
  SHL r24, r3, r4
  SHL r1, r12, r2
  SAR r5, r2, r0
  SHLI r5, r10, 0xB1C9FE
  IKEY r8
  CMPI r8, 4
  JNZ r8, key_0
  IKEY r2
  CMPI r2, 0x895DEC
  JNZ r2, key_1
  AND r14, r11, r5
  OR r5, r2, r14
  OR r7, r5, r2
  AND r3, r14, r11
main_2:
  LDI r13, 64
  LDI r15, 0x183EF5
  LDI r13, 32
  DRAWTEXT r13, r15, r13, "WORLD"
  IKEY r1
  CMPI r1, 1
  JNZ r1, key_3
  SAR r15, r13, r7
  SHR r7, r10, r4
  SHR r20, r0, r11
  SHR r15, r13, r11
  IKEY r2
  CMPI r2, 10
  JNZ r2, key_4
  FRAME
  JMP main_2
