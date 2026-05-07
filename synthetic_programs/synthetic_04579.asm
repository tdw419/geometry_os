; input driven program
; initialization
  LDI r15, 0x78AA57
  LDI r6, 1912
  LDI r5, 16
  LDI r3, 3025
  LDI r11, 1225
main_0:
  OR r15, r13, r10
  LDI r13, 0x5E0B0E
  LDI r1, 1932
  LDI r12, 1734
  DRAWTEXT r13, r1, r12, "WORLD"
  CMPI r4, 2
  LDI r14, 1941
  LDI r15, 0x7B200E
  LDI r2, 0x63D428
  TEXT r14, r15, r2, "HELLO"
  FRAME
  JMP main_0
