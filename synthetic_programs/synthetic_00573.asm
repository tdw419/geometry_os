; math computation
; initialization
  LDI r2, 8
  LDI r14, 0
  CMPI r3, r14, 0x682095
  ANDI r11, r13, 222
  SAR r6, r5, r7
  SAR r1, r0, r13
  ANDI r12, r10, 31
  SHLI r8, r5, 5
  SHL r15, r13, r6
  SHR r11, r14, r6
  ADDI r25, r8, 108
  SHR r12, r1, r6
  AND r12, r4, r11
  MOD r4, r9, r11
  XOR r4, r14, r11
  XOR r15, r3, r13
  OR r14, r10, r2
  XOR r27, r7, r8
  HALT
