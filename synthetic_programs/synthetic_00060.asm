; math computation
; initialization
  LDI r14, 0x7C0DE8
  LDI r8, 0
  LDI r5, 0xC81D6D
  LDI r0, 10
  LDI r1, 3621
  LDI r3, 0
  LDI r6, 4
  SHR r0, r6, r2
  SUB r5, r1, r3
  XOR r6, r12, r3
  AND r11, r0, r10
  AND r14, r8, r11
  DIV r15, r19, r5
  SUB r12, r4, r10
  OR r0, r14, r7
  XOR r0, r3, r13
  AND r1, r15, r4
  OR r1, r14, r10
  SHL r1, r13, r9
  SAR r6, r7, r12
  SAR r0, r15, r6
  MUL r4, r6, r2
  CMPI r6, r5, 128
  SUBI r15, r11, 32
  HALT
