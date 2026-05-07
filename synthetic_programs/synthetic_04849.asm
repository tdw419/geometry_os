; input driven program
; initialization
  LDI r13, 1
  LDI r4, 0xA87D71
main_0:
  XOR r4, r3, r11
  LDI r15, 1
  LDI r6, 10
  LDI r17, 32
  LDI r12, 0x23FBAB
  CIRCLE r15, r6, r17, r12
  SHR r10, r1, r12
  LDI r3, 2
  LDI r7, 2
  LDI r15, 3892
  TEXT r3, r7, r15, "HELLO"
  LDI r15, 0x9BBBCD
  LDI r0, 848
  LDI r14, 8
  DRAWTEXT r15, r0, r14, "WORLD"
  FRAME
  JMP main_0
