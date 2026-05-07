; math computation
; initialization
  LDI r10, 4060
  LDI r14, 3569
  LDI r7, 8
  LDI r8, 2299
  LDI r22, 3476
  LDI r13, 1
  LDI r4, 256
  ADDI r1, r15, 255
  SHLI r15, r2, 0x84C822
  SAR r1, r8, r4
  SHR r14, r7, r8
  SAR r14, r6, r1
  XOR r12, r13, r14
  XOR r4, r12, r1
  XOR r7, r1, r8
  SHR r14, r0, r8
  AND r8, r13, r0
  OR r12, r5, r13
  ADDI r6, r15, 24
  CMPI r11, r3, 0x2F52C6
  AND r10, r13, r22
  CMPI r19, r27, 0
  ADDI r5, r11, 64
  OR r12, r15, r4
  XOR r14, r13, r3
  SHR r6, r7, r10
  SHR r1, r13, r12
  SUB r12, r11, r14
  HALT
