; drawing loop program
; initialization
  LDI r2, 1625
  LDI r15, 10
  LDI r10, 4090
  LDI r9, 0x6B1232
  LDI r11, 1182
main_0:
  CMPI r2, r4, 8
  LDI r14, 0x9E263F
  LDI r13, 0x62D6D9
  LDI r19, 2201
  DRAWTEXT r14, r13, r19, "WORLD"
  LDI r6, 4
  LDI r5, 586
  LDI r5, 1574
  TEXT r6, r5, r5, "HELLO"
  SUBI r13, r3, 149
  FRAME
  JMP main_0
