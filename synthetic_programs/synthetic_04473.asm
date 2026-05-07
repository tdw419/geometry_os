; math computation
; initialization
  LDI r18, 1
  LDI r6, 10
  CMPI r13, r5, 255
  MOD r13, r10, r0
  XOR r9, r15, r11
  AND r0, r14, r13
  AND r6, r0, r2
  XOR r20, r10, r11
  ADDI r10, r5, 179
  ADD r10, r8, r4
  SUBI r10, r7, 2
  SAR r10, r8, r6
  SHLI r3, r15, 8
  SAR r3, r2, r14
  SHL r3, r9, r11
  SHR r12, r6, r7
  SAR r7, r14, r10
  SHL r4, r14, r3
  SHR r5, r14, r4
  SHL r9, r14, r5
  SHR r3, r1, r2
  XOR r9, r7, r5
  OR r15, r7, r2
  OR r9, r11, r28
  AND r9, r0, r15
  SHL r0, r12, r9
  SHL r15, r5, r9
  CMPI r11, r9, 0xBB4575
  SUB r2, r6, r7
  SAR r5, r6, r27
  SAR r15, r1, r2
  SHLI r0, r4, 1
  ADDI r3, r30, 10
  HALT
