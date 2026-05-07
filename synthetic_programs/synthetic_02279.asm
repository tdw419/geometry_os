; math computation
; initialization
  LDI r15, 0x386C3E
  LDI r13, 3530
  LDI r10, 1195
  LDI r7, 8
  LDI r9, 0
  LDI r2, 16
  ADDI r9, r7, 255
  AND r8, r4, r12
  OR r0, r1, r10
  AND r9, r15, r13
  XOR r4, r8, r12
  MUL r21, r10, r22
  CMPI r11, r10, 4
  SAR r5, r14, r13
  SAR r5, r6, r11
  SHLI r1, r8, 32
  SHLI r1, r15, 0
  SAR r6, r5, r13
  SHR r15, r0, r11
  SHR r0, r3, r13
  XOR r14, r11, r2
  AND r12, r2, r7
  SHR r7, r14, r6
  SHL r12, r0, r2
  HALT
