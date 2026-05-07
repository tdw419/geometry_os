; input driven program
; initialization
  LDI r15, 1865
  LDI r9, 3508
main_0:
  SHLI r6, r15, 0x8CDFD6
  SAR r14, r12, r0
  SHR r12, r10, r3
  SAR r14, r5, r15
  LDI r1, 3890
  LDI r0, 2092
  LDI r2, 4
  LDI r3, 276
  LDI r4, 256
  RECTF r1, r0, r2, r3, r4
  XOR r11, r6, r1
  OR r10, r7, r1
  LDI r12, 2825
  LDI r0, 3444
  LDI r1, 2467
  PSET r12, r0, r1
  LDI r24, 0x47C1FE
  LDI r9, 2663
  LDI r9, 0x641ED8
  LDI r9, 0xD836EE
  LDI r6, 0x4EB71C
  LINE r24, r9, r9, r9, r6
  LDI r2, 2571
  LDI r3, 1
  LDI r4, 16
  DRAWTEXT r2, r3, r4, "WORLD"
  FRAME
  JMP main_0
