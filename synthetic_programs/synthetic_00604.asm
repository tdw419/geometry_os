; input driven program
; initialization
  LDI r8, 0x21A212
  LDI r5, 0x76A0AA
  LDI r14, 1103
main_0:
  LDI r8, 1630
  LDI r15, 16
  LDI r13, 602
  DRAWTEXT r8, r15, r13, "WORLD"
  LDI r11, 0x3CA4CB
  LDI r9, 2
  LDI r8, 32
  DRAWTEXT r11, r9, r8, "WORLD"
  SHR r15, r0, r14
  SUBI r0, r1, 0xB7B159
  LDI r0, 0x4BCFBE
  LDI r2, 255
  LDI r15, 3967
  TEXT r0, r2, r15, "HELLO"
  LDI r12, 1194
  LDI r12, 2819
  LDI r17, 1
  DRAWTEXT r12, r12, r17, "WORLD"
  FRAME
  JMP main_0
