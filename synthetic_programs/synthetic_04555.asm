; math computation
; initialization
  LDI r11, 0x66C251
  LDI r2, 0xB5B807
  SHL r10, r14, r3
  SHL r14, r4, r10
  SAR r3, r14, r9
  SAR r12, r15, r6
  SUB r0, r2, r12
  OR r2, r4, r23
  AND r18, r6, r7
  OR r13, r7, r5
  SAR r7, r15, r11
  SHLI r3, r7, 0x2DC416
  SHL r9, r15, r1
  SHLI r13, r9, 0x9679B6
  SHL r4, r0, r12
  SHL r1, r22, r17
  SHLI r7, r0, 2
  XOR r10, r3, r8
  XOR r12, r4, r9
  XOR r13, r19, r7
  AND r8, r7, r9
  OR r12, r4, r11
  ADD r8, r11, r3
  HALT
