; drawing loop program
; initialization
  LDI r10, 64
  LDI r9, 94
main_0:
  LDI r0, 0x48CF49
  LDI r7, 64
  LDI r9, 255
  DRAWTEXT r0, r7, r9, "WORLD"
  IKEY r9
  CMPI r9, 8
  JNZ r9, key_1
  CMP r5, r13
  FRAME
  JMP main_0
