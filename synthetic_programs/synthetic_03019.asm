; math computation
; initialization
  LDI r15, 1039
  LDI r0, 371
  SAR r5, r8, r12
  SHL r6, r13, r8
  SHR r15, r0, r2
  SHL r7, r5, r11
  OR r7, r4, r3
  ANDI r0, r8, 256
  SAR r9, r12, r5
  SAR r1, r8, r3
  SHR r4, r0, r12
  CMPI r9, r11, 0xF41213
  OR r5, r28, r7
  SHLI r5, r8, 0x8E29C1
  SAR r0, r4, r6
  AND r9, r8, r6
  AND r5, r13, r14
  XOR r15, r12, r11
  OR r7, r12, r1
  CMPI r6, r12, 68
  ADDI r13, r2, 222
  SHR r12, r3, r1
  SUBI r11, r2, 255
  XOR r14, r15, r10
  AND r10, r0, r1
  XOR r12, r4, r0
  ANDI r6, r17, 128
  ADDI r9, r2, 0x88A6CB
  HALT
