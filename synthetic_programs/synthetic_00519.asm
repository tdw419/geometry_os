; math computation
; initialization
  LDI r6, 0xEFD209
  LDI r14, 1830
  LDI r12, 0x10915B
  ADDI r13, r10, 2
  ANDI r1, r12, 92
  SHLI r15, r0, 10
  SHLI r11, r4, 1
  SHLI r3, r11, 128
  SAR r0, r8, r1
  ANDI r15, r4, 255
  SHLI r12, r3, 7
  SHL r14, r0, r2
  SHL r1, r3, r13
  SHLI r10, r13, 0x508DF9
  SAR r11, r0, r10
  SAR r3, r11, r14
  SHLI r3, r4, 0
  SHLI r4, r5, 0x624BD4
  XOR r13, r3, r5
  AND r4, r3, r1
  OR r15, r10, r9
  AND r9, r0, r7
  SAR r6, r7, r23
  SHR r1, r11, r4
  SHLI r2, r13, 2
  SHR r13, r4, r0
  SHLI r1, r6, 4
  SHR r9, r11, r15
  SAR r10, r12, r7
  SHR r2, r0, r5
  HALT
