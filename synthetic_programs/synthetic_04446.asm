; math computation
; initialization
  LDI r6, 632
  LDI r4, 0xABDF37
  LDI r10, 0x97EFA3
  LDI r1, 0xFD3951
  LDI r19, 407
  CMPI r6, r10, 0x63C498
  MOD r9, r1, r7
  XOR r14, r10, r23
  XOR r7, r13, r2
  OR r2, r8, r3
  DIV r15, r3, r7
  OR r23, r14, r4
  MUL r1, r9, r2
  CMPI r9, r2, 8
  SHR r1, r10, r5
  XOR r5, r2, r12
  XOR r10, r9, r2
  OR r11, r2, r1
  XOR r12, r14, r6
  SAR r6, r22, r12
  SHL r11, r9, r5
  CMPI r14, r15, 8
  SUBI r3, r11, 0x0F9843
  AND r0, r8, r14
  CMPI r4, r11, 10
  XOR r1, r3, r11
  XOR r13, r0, r1
  XOR r8, r2, r5
  SHL r1, r2, r8
  HALT
