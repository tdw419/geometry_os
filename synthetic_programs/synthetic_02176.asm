; math computation
; initialization
  LDI r3, 4
  LDI r0, 0x273C9D
  LDI r6, 0x10555F
  LDI r1, 64
  LDI r13, 1
  LDI r5, 255
  LDI r14, 0xD1F5D3
  LDI r11, 0x57C626
  ADDI r9, r8, 128
  SHR r0, r4, r2
  SHR r8, r6, r10
  SHR r5, r15, r2
  SHR r2, r4, r6
  ANDI r1, r11, 0x2C983D
  SUBI r5, r4, 87
  XOR r5, r1, r8
  SHR r1, r15, r2
  AND r14, r0, r2
  XOR r6, r8, r11
  OR r3, r1, r10
  SHR r14, r16, r3
  SAR r10, r4, r0
  SHL r1, r9, r7
  SUB r23, r5, r6
  SHLI r1, r9, 5
  SHL r9, r14, r8
  SHL r13, r12, r20
  SHL r14, r9, r4
  ADD r11, r9, r6
  HALT
