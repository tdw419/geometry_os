; input driven program
; initialization
  LDI r8, 8
  LDI r11, 0x4D2D74
  LDI r1, 0xDDCAA3
  LDI r10, 519
  LDI r0, 128
main_0:
  SUB r6, r12, r9
  CMPI r7, r12, 212
  LDI r13, 4
  LDI r5, 256
  LDI r12, 255
  DRAWTEXT r13, r5, r12, "WORLD"
  FRAME
  JMP main_0
