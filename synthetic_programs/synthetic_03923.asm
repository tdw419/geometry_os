; math computation
; initialization
  LDI r2, 0xA7C672
  LDI r1, 128
  LDI r9, 2572
  LDI r15, 348
  LDI r6, 2608
  LDI r4, 0x70EF3F
  LDI r17, 0
  LDI r8, 1582
  SHR r8, r3, r0
  SAR r15, r1, r8
  SHL r3, r4, r6
  SHLI r10, r13, 128
  AND r11, r8, r9
  AND r7, r3, r13
  AND r11, r6, r13
  XOR r12, r10, r8
  AND r13, r2, r7
  AND r11, r10, r14
  OR r14, r15, r12
  OR r7, r4, r1
  XOR r3, r15, r6
  OR r1, r0, r10
  AND r6, r1, r10
  DIV r10, r8, r4
  SUBI r15, r9, 64
  OR r5, r7, r20
  AND r13, r6, r2
  OR r12, r15, r7
  OR r14, r7, r10
  XOR r10, r1, r0
  OR r7, r5, r6
  XOR r4, r6, r13
  XOR r2, r7, r15
  CMPI r1, r2, 0x222A89
  HALT
