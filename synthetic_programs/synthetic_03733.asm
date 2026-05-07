; counted animation
; initialization
  LDI r0, 999
  LDI r1, 0x9C2DF3
  LDI r4, 1723
  LDI r7, 0x9ECC8E
  LDI r9, 0xDA8919
  LDI r12, 3324
  LDI r14, 0x13D571
  LDI r3, 2369
  LDI r13, 0x1EE55D
loop_0:
  ANDI r0, r23, 0xE47ECC
  ANDI r3, r14, 0
  LDI r7, 1
  SUB r13, r13, r7
  JNZ r13, loop_0
  LDI r7, 0x008D4D
loop_1:
  ANDI r0, r13, 0x8EA511
  LDI r4, 0x26D646
  LDI r2, 4
  LDI r0, 10
  LDI r3, 0x071C4D
  LDI r1, 32
  RECTF r4, r2, r0, r3, r1
  AND r8, r10, r29
  LDI r9, 4
  LDI r4, 128
  LDI r9, 4
  LDI r2, 0xCDC4DE
  LDI r12, 0x93715E
  LINE r9, r4, r9, r2, r12
  LDI r3, 1
  SUB r7, r7, r3
  JNZ r7, loop_1
  HALT
