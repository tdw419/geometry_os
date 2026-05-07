; input driven program
; initialization
  LDI r1, 0x872F08
  LDI r27, 256
  LDI r10, 3697
main_0:
  XOR r13, r15, r2
  OR r4, r14, r16
  AND r14, r13, r10
  AND r9, r11, r15
  LDI r15, 0x377648
  LDI r3, 0x314C59
  LDI r4, 0x08F10F
  DRAWTEXT r15, r3, r4, "WORLD"
  FRAME
  JMP main_0
