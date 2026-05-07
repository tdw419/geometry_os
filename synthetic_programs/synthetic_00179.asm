; drawing loop program
; initialization
  LDI r14, 256
  LDI r15, 256
  LDI r19, 0x95C12C
  LDI r4, 64
  LDI r6, 0x1F7A1C
  LDI r2, 0x189A00
  LDI r8, 0x9724E2
main_0:
  IKEY r1
  CMPI r1, 228
  JNZ r1, key_1
  LDI r13, 3889
  LDI r11, 16
  LDI r14, 128
  DRAWTEXT r13, r11, r14, "WORLD"
  SUBI r8, r11, 0x90272E
  CMPI r11, 0xEAF407
  IKEY r21
  CMPI r21, 0x2D2E40
  JNZ r21, key_2
  FRAME
  JMP main_0
