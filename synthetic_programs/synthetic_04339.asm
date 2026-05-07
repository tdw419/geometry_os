; drawing loop program
; initialization
  LDI r14, 32
  LDI r2, 2443
  LDI r11, 3279
  LDI r15, 8
  LDI r4, 0x4A138A
  LDI r0, 3729
  LDI r13, 64
  LDI r6, 0x8D3F4A
main_0:
  ANDI r15, r0, 10
  LDI r9, 64
  LDI r6, 16
  LDI r14, 0xA34679
  LDI r6, 0x8E9A44
  LDI r11, 0xE89239
  RECTF r9, r6, r14, r6, r11
  IKEY r8
  CMPI r8, 16
  JNZ r8, key_1
  FRAME
  JMP main_0
