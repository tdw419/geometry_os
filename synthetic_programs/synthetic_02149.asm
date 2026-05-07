; drawing loop program
; initialization
  LDI r4, 3531
  LDI r0, 128
main_0:
  LDI r8, 1193
  LDI r6, 0
  LDI r6, 128
  TEXT r8, r6, r6, "HELLO"
  LDI r1, 1875
  LDI r3, 2848
  LDI r2, 3031
  DRAWTEXT r1, r3, r2, "WORLD"
  IKEY r1
  CMPI r1, 0xA79BFE
  JNZ r1, key_1
  LDI r9, 2352
  LDI r11, 0x240DA4
  LDI r14, 0
  LDI r8, 1204
  LDI r9, 0xA8B485
  RECTF r9, r11, r14, r8, r9
  LDI r9, 0x7BD296
  LDI r12, 2219
  LDI r1, 0x9703B8
  TEXT r9, r12, r1, "HELLO"
  SHL r7, r10, r9
  SHLI r15, r8, 0x2592E4
  SHR r12, r11, r8
  SHR r6, r1, r11
  FRAME
  JMP main_0
