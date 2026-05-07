; drawing loop program
; initialization
  LDI r5, 3954
  LDI r2, 0x863CF3
  LDI r9, 8
  LDI r4, 0x370CBD
  LDI r26, 0x0049F8
  LDI r18, 10
main_0:
  LDI r9, 3929
  FILL r9
  CMPI r14, 0x234942
  AND r14, r15, r9
  AND r0, r4, r14
  ANDI r6, r14, 0x88AFED
  LDI r13, 8
  LDI r8, 64
  LDI r28, 128
  LDI r10, 8
  CIRCLE r13, r8, r28, r10
  FRAME
  JMP main_0
