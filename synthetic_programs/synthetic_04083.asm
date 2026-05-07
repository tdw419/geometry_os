; math computation
; initialization
  LDI r1, 2818
  LDI r6, 16
  LDI r15, 32
  SAR r0, r6, r4
  SHLI r13, r7, 256
  SHR r15, r7, r4
  SAR r15, r2, r5
  SAR r13, r4, r9
  AND r5, r1, r10
  XOR r0, r4, r11
  XOR r2, r15, r5
  SHLI r5, r10, 0
  SHL r7, r4, r3
  SAR r5, r2, r15
  XOR r8, r10, r13
  XOR r9, r18, r15
  AND r0, r12, r11
  AND r5, r14, r13
  XOR r0, r22, r4
  XOR r4, r12, r11
  ADD r1, r6, r3
  XOR r4, r13, r9
  MUL r12, r8, r10
  ADDI r15, r5, 16
  SHL r7, r1, r13
  SAR r6, r13, r0
  SHR r15, r11, r13
  SAR r12, r10, r3
  ADDI r12, r24, 128
  HALT
