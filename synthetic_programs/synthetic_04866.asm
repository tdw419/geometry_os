; math computation
; initialization
  LDI r4, 10
  LDI r11, 0xFE57B3
  LDI r3, 4071
  SHR r8, r3, r6
  SHL r8, r13, r1
  SHR r15, r4, r8
  SHR r0, r6, r3
  CMPI r11, r8, 15
  MUL r1, r8, r7
  SHR r9, r12, r2
  SUBI r7, r11, 0x9AF899
  ADD r8, r2, r0
  XOR r10, r6, r8
  XOR r10, r2, r4
  AND r1, r4, r12
  AND r13, r14, r20
  SHLI r0, r15, 0
  SAR r3, r8, r13
  ANDI r9, r7, 0x40C4B5
  ADD r2, r1, r3
  ANDI r15, r7, 0x921E20
  SUBI r12, r6, 19
  HALT
