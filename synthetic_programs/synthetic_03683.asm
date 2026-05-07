; input driven program
; initialization
  LDI r0, 0xF07294
  LDI r1, 64
  LDI r11, 1376
  LDI r12, 3391
  LDI r3, 1535
  LDI r13, 0xF3416F
main_0:
  LDI r15, 0x873698
  LDI r27, 3066
  LDI r17, 128
  DRAWTEXT r15, r27, r17, "WORLD"
  LDI r2, 0xB10815
  LDI r3, 821
  LDI r9, 3333
  DRAWTEXT r2, r3, r9, "WORLD"
  LDI r8, 16
  LDI r0, 0x75C7CC
  LDI r3, 891
  TEXT r8, r0, r3, "HELLO"
  CMPI r3, 0x96DE6F
  IKEY r13
  CMPI r13, 255
  JNZ r13, key_1
  IKEY r2
  CMPI r2, 32
  JNZ r2, key_2
  FRAME
  JMP main_0
