; input driven program
; initialization
  LDI r1, 0x384BC4
  LDI r12, 751
  LDI r14, 0xF4A099
main_0:
  LDI r5, 0x06CEFA
  LDI r26, 3414
  LDI r12, 255
  DRAWTEXT r5, r26, r12, "WORLD"
  XOR r1, r12, r11
  XOR r1, r13, r8
  AND r7, r0, r12
  FRAME
  JMP main_0
