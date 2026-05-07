; math computation
; initialization
  LDI r2, 0xC0278A
  LDI r0, 300
  LDI r15, 4
  LDI r4, 1
  LDI r9, 0
  OR r0, r14, r8
  OR r0, r2, r14
  OR r14, r7, r10
  OR r1, r9, r3
  SAR r9, r7, r2
  SHR r25, r4, r10
  SHL r2, r15, r28
  XOR r7, r2, r11
  XOR r8, r7, r4
  CMPI r17, r1, 0xB26403
  ANDI r14, r2, 72
  CMPI r0, r13, 4
  SAR r3, r8, r1
  SAR r13, r11, r3
  SAR r1, r12, r6
  SAR r10, r8, r2
  OR r9, r6, r2
  AND r8, r5, r2
  XOR r7, r14, r4
  ANDI r3, r13, 0x75E0C3
  XOR r9, r7, r3
  ANDI r15, r10, 4
  ANDI r9, r7, 190
  MUL r3, r8, r0
  AND r8, r7, r0
  HALT
