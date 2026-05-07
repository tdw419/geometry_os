; input driven program
; initialization
  LDI r3, 2372
  LDI r12, 1213
  LDI r1, 2141
  LDI r6, 0x9087D0
  LDI r0, 256
  LDI r14, 2919
  LDI r4, 32
main_0:
  IKEY r1
  CMPI r1, 0
  JNZ r1, key_1
  LDI r0, 0x5D232F
  FILL r0
  LDI r3, 4
  LDI r13, 2393
  LDI r11, 128
  PSET r3, r13, r11
  LDI r6, 64
  LDI r14, 0x34A720
  LDI r24, 0x9A4D81
  LDI r11, 1540
  LDI r15, 1830
  LINE r6, r14, r24, r11, r15
  FRAME
  JMP main_0
