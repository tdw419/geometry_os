; input driven program
; initialization
  LDI r9, 0x9542F5
  LDI r4, 540
  LDI r3, 0x9AE34D
  LDI r1, 0
  LDI r14, 0x3ABB1A
  LDI r2, 64
main_0:
  LDI r0, 3211
  LDI r9, 0x1E8F6E
  LDI r0, 0x055B45
  WPIXEL
  IKEY r2
  CMPI r2, 0xDDE9C2
  JNZ r2, key_1
  CMP r2, r14
  FRAME
  JMP main_0
