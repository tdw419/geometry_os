; math computation
; initialization
  LDI r13, 3492
  LDI r12, 2169
  LDI r1, 3720
  LDI r7, 255
  LDI r3, 0xEB4EDF
  LDI r9, 0x2C7948
  ANDI r12, r15, 0x90841F
  ANDI r4, r2, 255
  SHLI r15, r4, 64
  SAR r15, r7, r11
  SHLI r1, r11, 0x6B2D4B
  SHR r3, r2, r6
  AND r8, r15, r9
  OR r29, r0, r4
  AND r7, r15, r14
  AND r4, r17, r9
  SUB r1, r15, r11
  ANDI r11, r7, 0x5C2B73
  SHLI r6, r8, 4
  SHR r8, r1, r0
  SHL r16, r6, r13
  SHL r9, r6, r4
  SHL r6, r11, r8
  SHL r8, r11, r27
  SHL r10, r15, r6
  AND r0, r14, r15
  XOR r13, r11, r9
  OR r5, r0, r6
  OR r10, r11, r1
  XOR r3, r5, r4
  XOR r5, r8, r2
  SHLI r4, r7, 8
  SHL r11, r13, r7
  SHL r11, r1, r14
  SUBI r1, r14, 0
  AND r11, r10, r9
  OR r13, r12, r9
  AND r3, r4, r11
  OR r11, r4, r15
  DIV r5, r14, r11
  CMPI r14, r10, 0x8A591A
  SHLI r12, r2, 32
  SHR r13, r1, r6
  SAR r14, r4, r2
  DIV r6, r7, r2
  OR r1, r15, r5
  AND r13, r8, r15
  HALT
