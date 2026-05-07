; mixed program
; initialization
  LDI r6, 0xF50896
  LDI r3, 3421
  MOD r15, r14, r25
  SUB r13, r12, r11
  IKEY r11
  CMPI r11, 84
  JNZ r11, key_0
  SUB r6, r10, r1
  IKEY r1
  CMPI r1, 121
  JNZ r1, key_1
  LDI r7, 0xA9C5B8
  LDI r6, 0x0C3582
  LDI r6, 0x053A23
  DRAWTEXT r7, r6, r6, "WORLD"
  OR r10, r5, r9
  LDI r6, 3380
  LDI r7, 16
  LDI r15, 255
  DRAWTEXT r6, r7, r15, "WORLD"
main_2:
  LDI r1, 0x2B22FA
  LDI r8, 437
  LDI r13, 2032
  TEXT r1, r8, r13, "HELLO"
  LDI r8, 1147
  LDI r0, 0xB8FEAA
  LDI r9, 0x88C3AD
  TEXT r8, r0, r9, "HELLO"
  XOR r8, r14, r11
  LDI r8, 0x4022B0
  LDI r7, 64
  LDI r2, 0xBC9887
  LDI r5, 255
  LDI r0, 3651
  RECTF r8, r7, r2, r5, r0
  XOR r28, r1, r12
  OR r6, r14, r15
  OR r15, r14, r6
  FRAME
  JMP main_2
