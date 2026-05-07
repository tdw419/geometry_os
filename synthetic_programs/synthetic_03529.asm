; input driven program
; initialization
  LDI r5, 8
  LDI r1, 32
main_0:
  AND r6, r11, r2
  XOR r6, r7, r10
  LDI r19, 32
  LDI r3, 32
  LDI r2, 0xF5E3A2
  DRAWTEXT r19, r3, r2, "WORLD"
  LDI r6, 256
  LDI r8, 128
  LDI r0, 1982
  WPIXEL
  FRAME
  JMP main_0
