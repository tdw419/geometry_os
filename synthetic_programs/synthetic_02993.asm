; drawing loop program
; initialization
  LDI r1, 559
  LDI r7, 1238
  LDI r6, 446
  LDI r30, 320
  LDI r26, 10
main_0:
  CMPI r13, r10, 100
  LDI r15, 128
  LDI r11, 3235
  LDI r11, 4024
  LDI r4, 1
  LDI r7, 468
  LINE r15, r11, r11, r4, r7
  LDI r12, 0
  LDI r4, 0xB5FF4C
  LDI r9, 0x3492BC
  LDI r7, 8
  LDI r12, 0xBBF3F4
  RECTF r12, r4, r9, r7, r12
  LDI r14, 256
  LDI r14, 3657
  LDI r2, 32
  TEXT r14, r14, r2, "HELLO"
  ANDI r11, r0, 32
  IKEY r12
  CMPI r12, 125
  JNZ r12, key_1
  FRAME
  JMP main_0
