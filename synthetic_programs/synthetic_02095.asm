; input driven program
; initialization
  LDI r10, 1
  LDI r2, 4
  LDI r9, 1655
main_0:
  SUBI r7, r25, 10
  ANDI r15, r17, 2
  SUBI r9, r5, 0x3990DA
  LDI r0, 1246
  LDI r4, 255
  LDI r3, 32
  DRAWTEXT r0, r4, r3, "WORLD"
  SHL r8, r12, r11
  SHL r13, r5, r10
  IKEY r15
  CMPI r15, 4
  JNZ r15, key_1
  FRAME
  JMP main_0
