; math computation
; initialization
  LDI r12, 0x1A4112
  LDI r1, 16
  LDI r5, 4
  LDI r17, 1
  LDI r13, 16
  SUBI r6, r8, 112
  MOD r7, r12, r6
  ADDI r13, r5, 1
  SUBI r0, r5, 0
  OR r15, r11, r13
  OR r13, r14, r2
  XOR r30, r15, r11
  XOR r1, r11, r9
  AND r3, r10, r21
  AND r7, r12, r8
  XOR r8, r7, r0
  OR r20, r8, r9
  SHLI r9, r12, 0x52E2FE
  SAR r14, r11, r19
  SHR r12, r8, r9
  SHR r13, r10, r4
  MUL r1, r29, r10
  XOR r11, r4, r15
  OR r20, r13, r10
  XOR r10, r4, r9
  OR r14, r13, r1
  ANDI r10, r2, 0xF149D4
  HALT
