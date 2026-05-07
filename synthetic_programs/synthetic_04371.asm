; input driven program
; initialization
  LDI r3, 1876
  LDI r10, 1437
  LDI r0, 256
  LDI r6, 0xFE540F
  LDI r1, 0xD843F5
  LDI r2, 0x2E2459
  LDI r27, 1607
main_0:
  CMP r0, r8
  LDI r13, 2
  LDI r3, 1325
  LDI r6, 2
  LDI r2, 32
  CIRCLE r13, r3, r6, r2
  LDI r6, 0xBF4E0B
  LDI r12, 1
  LDI r1, 0x36047F
  DRAWTEXT r6, r12, r1, "WORLD"
  CMP r3, r14
  SUBI r11, r1, 94
  FRAME
  JMP main_0
