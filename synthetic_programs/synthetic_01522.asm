; drawing loop program
; initialization
  LDI r2, 3564
  LDI r13, 3410
  LDI r5, 3266
  LDI r10, 3987
  LDI r11, 2691
main_0:
  LDI r6, 0xC0E76E
  LDI r13, 0x8DA55C
  LDI r6, 0x7E1E7C
  WPIXEL
  IKEY r14
  CMPI r14, 198
  JNZ r14, key_1
  LDI r15, 2894
  LDI r15, 598
  LDI r4, 3673
  DRAWTEXT r15, r15, r4, "WORLD"
  CMPI r3, 104
  FRAME
  JMP main_0
