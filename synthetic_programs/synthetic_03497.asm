; drawing loop program
; initialization
  LDI r8, 32
  LDI r9, 0x601745
  LDI r0, 4
  LDI r4, 0x6B80BF
  LDI r12, 0x7CA919
  LDI r2, 255
main_0:
  IKEY r18
  CMPI r18, 0xDA7898
  JNZ r18, key_1
  LDI r11, 0x73C7C6
  LDI r3, 0x229013
  LDI r6, 3153
  DRAWTEXT r11, r3, r6, "WORLD"
  FRAME
  JMP main_0
