; input driven program
; initialization
  LDI r6, 1
  LDI r11, 256
  LDI r12, 1
  LDI r8, 730
  LDI r30, 0x180284
  LDI r16, 1
  LDI r5, 3320
  LDI r13, 1395
main_0:
  SHR r17, r0, r14
  SHR r0, r5, r15
  SHR r23, r8, r4
  LDI r12, 32
  LDI r5, 1019
  LDI r11, 468
  TEXT r12, r5, r11, "HELLO"
  LDI r8, 2150
  LDI r0, 0x294549
  LDI r6, 64
  DRAWTEXT r8, r0, r6, "WORLD"
  ANDI r4, r1, 25
  CMPI r10, r8, 0x70DB3E
  CMPI r15, 10
  FRAME
  JMP main_0
