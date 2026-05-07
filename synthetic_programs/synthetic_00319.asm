; math computation
; initialization
  LDI r11, 0x088D3E
  LDI r6, 0x5C7F40
  LDI r5, 256
  LDI r13, 0
  SHL r10, r1, r9
  SHL r7, r14, r3
  SHR r12, r7, r1
  SHR r6, r9, r2
  SHR r10, r14, r0
  SHL r10, r15, r7
  DIV r11, r6, r2
  SHL r17, r7, r14
  SHLI r31, r6, 2
  SAR r12, r14, r13
  ANDI r3, r0, 8
  SAR r6, r4, r14
  SHLI r3, r12, 64
  CMPI r0, r15, 1
  AND r7, r1, r9
  XOR r9, r8, r5
  OR r4, r8, r13
  XOR r14, r5, r8
  OR r23, r8, r0
  AND r5, r16, r13
  XOR r3, r0, r11
  CMPI r15, r3, 0x6E550B
  XOR r10, r14, r15
  XOR r12, r2, r15
  OR r12, r13, r7
  AND r12, r3, r6
  SHR r13, r8, r11
  XOR r0, r7, r8
  AND r10, r4, r14
  OR r1, r5, r7
  AND r0, r5, r11
  AND r10, r11, r13
  XOR r1, r2, r6
  AND r10, r9, r8
  OR r10, r8, r4
  OR r13, r18, r5
  HALT
