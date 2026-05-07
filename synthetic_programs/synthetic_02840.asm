; mixed program
; initialization
  LDI r0, 3857
  LDI r6, 32
  LDI r13, 0x47088B
  LDI r5, 638
  LDI r8, 64
  LDI r14, 0x692172
  LDI r9, 2347
  LDI r4, 3750
  SUB r10, r9, r22
  LDI r3, 0x31B962
  LDI r1, 256
  LDI r7, 1678
  DRAWTEXT r3, r1, r7, "WORLD"
  SAR r11, r12, r13
  SAR r15, r5, r10
  CMPI r1, 175
  HALT
