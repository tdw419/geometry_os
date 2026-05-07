; math computation
; initialization
  LDI r29, 256
  LDI r13, 2448
  ADDI r13, r10, 32
  CMPI r10, r1, 4
  MOD r11, r1, r15
  CMPI r8, r15, 0x96C6CC
  XOR r14, r6, r8
  XOR r5, r9, r10
  OR r11, r3, r0
  AND r4, r11, r7
  XOR r4, r6, r8
  XOR r8, r1, r10
  XOR r7, r11, r20
  XOR r15, r12, r11
  OR r4, r7, r10
  AND r8, r15, r9
  SUBI r12, r8, 106
  XOR r10, r11, r6
  AND r4, r15, r11
  OR r11, r13, r0
  AND r10, r14, r11
  DIV r9, r18, r4
  MUL r15, r8, r2
  SAR r3, r11, r13
  SAR r2, r7, r8
  SAR r0, r7, r13
  SAR r7, r4, r0
  SHR r4, r10, r5
  SHLI r3, r1, 5
  SHL r8, r15, r3
  ADDI r11, r15, 184
  AND r31, r12, r11
  XOR r9, r4, r12
  SHL r14, r1, r5
  ADD r9, r13, r4
  AND r5, r15, r1
  HALT
