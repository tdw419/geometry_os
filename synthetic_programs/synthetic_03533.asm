; input driven program
; initialization
  LDI r11, 0x49C71F
  LDI r4, 3558
  LDI r1, 0x11CDFC
  LDI r7, 0x9250D6
  LDI r9, 17
  LDI r14, 0xB2D97D
main_0:
  IKEY r0
  CMPI r0, 0x5E5EAC
  JNZ r0, key_1
  CMP r3, r7
  LDI r1, 0xD79082
  LDI r10, 0xF2FDC2
  LDI r6, 16
  LDI r11, 0x86BD9E
  CIRCLE r1, r10, r6, r11
  LDI r3, 256
  LDI r10, 0x91AC6D
  LDI r1, 1
  DRAWTEXT r3, r10, r1, "WORLD"
  CMPI r12, 184
  SUBI r2, r0, 0xEE9705
  FRAME
  JMP main_0
