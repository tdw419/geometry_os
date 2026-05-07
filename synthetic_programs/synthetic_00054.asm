; input driven program
; initialization
  LDI r7, 0xD7EBF9
  LDI r4, 16
  LDI r11, 0
  LDI r2, 0xA12E10
  LDI r5, 0
main_0:
  LDI r25, 2493
  LDI r10, 8
  LDI r4, 4
  PSETI
  LDI r12, 690
  LDI r10, 1032
  LDI r9, 0x9FDF8C
  DRAWTEXT r12, r10, r9, "WORLD"
  CMP r8, r9
  FRAME
  JMP main_0
