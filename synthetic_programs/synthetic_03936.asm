; drawing loop program
; initialization
  LDI r10, 128
  LDI r5, 2
  LDI r9, 16
  LDI r12, 3963
  LDI r0, 256
  LDI r1, 0xBB089E
  LDI r8, 1463
main_0:
  SHL r8, r13, r2
  LDI r6, 0x2752D6
  LDI r8, 255
  LDI r9, 3712
  TEXT r6, r8, r9, "HELLO"
  XOR r9, r26, r12
  AND r12, r7, r15
  ANDI r10, r23, 32
  LDI r11, 10
  LDI r15, 102
  LDI r11, 1647
  TEXT r11, r15, r11, "HELLO"
  LDI r3, 10
  LDI r12, 0x745FFB
  LDI r12, 1644
  DRAWTEXT r3, r12, r12, "WORLD"
  FRAME
  JMP main_0
