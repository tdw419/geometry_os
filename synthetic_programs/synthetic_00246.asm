; input driven program
; initialization
  LDI r15, 3718
  LDI r11, 32
  LDI r2, 0x6D193B
  LDI r7, 1316
  LDI r8, 2613
  LDI r13, 692
  LDI r14, 1
  LDI r0, 3299
main_0:
  LDI r3, 10
  LDI r6, 64
  LDI r7, 270
  LDI r8, 1929
  LDI r14, 0xA1E4FB
  RECTF r3, r6, r7, r8, r14
  SHLI r10, r14, 0x1BED05
  SHLI r18, r6, 2
  LDI r11, 10
  LDI r10, 0x12700F
  LDI r13, 1349
  PSETI
  CMPI r1, 2
  FRAME
  JMP main_0
