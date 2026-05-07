; math computation
; initialization
  LDI r1, 719
  LDI r15, 1981
  LDI r10, 3605
  LDI r7, 0x61F0E2
  LDI r13, 0xDE038D
  SAR r0, r5, r4
  SHR r11, r6, r13
  SHR r6, r8, r12
  SHLI r15, r3, 0x8E5113
  XOR r1, r15, r7
  AND r9, r11, r1
  OR r0, r4, r6
  XOR r1, r7, r6
  XOR r10, r12, r1
  AND r6, r9, r11
  ANDI r8, r0, 120
  ANDI r10, r3, 64
  SUB r3, r12, r15
  XOR r10, r13, r29
  DIV r1, r0, r23
  AND r11, r1, r2
  XOR r12, r2, r0
  AND r15, r1, r3
  XOR r6, r2, r9
  HALT
