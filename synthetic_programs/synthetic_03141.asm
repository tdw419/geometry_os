; math computation
; initialization
  LDI r10, 1292
  LDI r20, 0xE81260
  LDI r0, 255
  LDI r8, 803
  LDI r9, 2614
  LDI r15, 0x719F01
  LDI r13, 3240
  CMPI r2, r10, 8
  SUBI r10, r4, 32
  ADD r15, r8, r9
  ADDI r4, r14, 34
  MUL r11, r12, r9
  SHR r2, r8, r3
  SAR r5, r14, r6
  OR r6, r1, r0
  MUL r1, r15, r4
  MUL r10, r1, r0
  OR r3, r12, r10
  XOR r14, r9, r15
  SUBI r3, r9, 0
  MUL r8, r1, r14
  HALT
