; math computation
; initialization
  LDI r13, 0xE34796
  LDI r6, 64
  LDI r4, 8
  LDI r7, 256
  LDI r5, 10
  LDI r8, 1355
  SHL r3, r8, r0
  SAR r2, r5, r15
  SHL r8, r15, r18
  SHR r4, r1, r2
  SAR r19, r11, r6
  SHLI r10, r12, 0x3D4483
  SAR r11, r14, r1
  SHR r6, r13, r4
  SAR r8, r0, r5
  SHLI r14, r13, 2
  OR r6, r31, r7
  OR r6, r7, r5
  SHR r15, r1, r10
  ADDI r12, r7, 0x5AAF48
  ANDI r15, r8, 202
  SUBI r4, r0, 2
  XOR r8, r6, r12
  OR r6, r10, r5
  AND r9, r13, r2
  XOR r5, r15, r6
  ADDI r14, r4, 0xEA4969
  HALT
