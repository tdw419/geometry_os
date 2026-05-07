; math computation
; initialization
  LDI r14, 139
  LDI r6, 16
  LDI r19, 180
  LDI r11, 98
  LDI r7, 861
  LDI r5, 0x82F996
  SAR r14, r7, r13
  SHL r15, r3, r10
  SHL r4, r10, r9
  AND r13, r4, r5
  SHR r0, r13, r1
  OR r13, r2, r7
  XOR r4, r13, r5
  OR r11, r2, r9
  XOR r15, r8, r4
  ANDI r1, r11, 136
  XOR r13, r15, r3
  XOR r11, r13, r4
  XOR r2, r8, r14
  AND r6, r14, r11
  ANDI r9, r5, 16
  OR r3, r5, r12
  AND r7, r8, r9
  AND r1, r2, r7
  AND r2, r3, r1
  XOR r1, r5, r3
  HALT
