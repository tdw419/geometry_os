; input driven program
; initialization
  LDI r26, 0x25B228
  LDI r9, 16
  LDI r0, 1224
  LDI r28, 3330
  LDI r2, 0xBC68AC
  LDI r12, 8
  LDI r11, 64
  LDI r14, 1993
main_0:
  LDI r13, 0xFB328E
  LDI r12, 16
  LDI r3, 64
  DRAWTEXT r13, r12, r3, "WORLD"
  SUBI r2, r9, 255
  XOR r5, r13, r10
  AND r11, r10, r4
  XOR r15, r5, r20
  AND r3, r8, r11
  IKEY r5
  CMPI r5, 16
  JNZ r5, key_1
  FRAME
  JMP main_0
