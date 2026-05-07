; input driven program
; initialization
  LDI r14, 0xDBE876
  LDI r2, 16
  LDI r4, 3680
  LDI r9, 0x33D229
  LDI r3, 32
  LDI r1, 0x9E7BF0
  LDI r10, 10
main_0:
  CMP r12, r3
  LDI r9, 265
  LDI r14, 1662
  LDI r11, 0xED7A94
  DRAWTEXT r9, r14, r11, "WORLD"
  SHL r6, r0, r9
  SAR r6, r8, r12
  CMPI r11, 30
  CMPI r7, 0x24F1EF
  FRAME
  JMP main_0
