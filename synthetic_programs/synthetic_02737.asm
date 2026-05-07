; input driven program
; initialization
  LDI r9, 10
  LDI r16, 3149
  LDI r4, 0xC1C78F
  LDI r1, 2602
  LDI r13, 0xCAAD41
  LDI r6, 2728
  LDI r5, 0
  LDI r0, 2
main_0:
  SHLI r3, r2, 2
  SHL r4, r11, r9
  SHL r3, r13, r7
  LDI r15, 0x181FAC
  LDI r11, 8
  LDI r11, 255
  LDI r10, 8
  LDI r13, 64
  LINE r15, r11, r11, r10, r13
  IKEY r10
  CMPI r10, 241
  JNZ r10, key_1
  LDI r0, 32
  LDI r6, 0x854435
  LDI r2, 3264
  LDI r24, 10
  LDI r9, 2
  LINE r0, r6, r2, r24, r9
  FRAME
  JMP main_0
