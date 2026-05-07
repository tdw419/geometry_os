; mixed program
; initialization
  LDI r4, 0x0C315D
  LDI r5, 4
  LDI r11, 256
  LDI r8, 0x028697
  LDI r2, 1
  LDI r3, 2
  LDI r13, 2
  LDI r24, 1421
  CMPI r1, 16
  LDI r6, 3717
  LDI r4, 0xAEC9C4
  LDI r24, 2231
  TEXT r6, r4, r24, "HELLO"
  IKEY r8
  CMPI r8, 73
  JNZ r8, key_0
  HALT
