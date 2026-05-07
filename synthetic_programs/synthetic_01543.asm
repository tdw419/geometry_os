; math computation
; initialization
  LDI r17, 697
  LDI r6, 3328
  LDI r9, 1646
  LDI r0, 0xBDE421
  LDI r5, 0xCA5921
  LDI r7, 3680
  CMPI r10, r0, 178
  DIV r3, r10, r1
  XOR r2, r5, r13
  SHLI r1, r6, 8
  SHL r2, r9, r1
  SAR r13, r10, r6
  SHL r9, r8, r7
  ANDI r8, r10, 100
  SUBI r8, r0, 166
  SHL r4, r10, r15
  SAR r8, r9, r17
  SUBI r5, r14, 17
  MUL r2, r9, r0
  HALT
