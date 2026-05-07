; drawing loop program
; initialization
  LDI r5, 32
  LDI r15, 0x78FB1E
  LDI r4, 0x1FECEE
  LDI r3, 64
  LDI r1, 2
  LDI r18, 1643
  LDI r13, 0x1A3A41
  LDI r10, 3289
main_0:
  SAR r2, r1, r3
  SHL r14, r13, r11
  SAR r10, r13, r1
  SHL r13, r7, r12
  SHR r4, r1, r12
  SAR r2, r8, r6
  SHLI r3, r7, 6
  SHLI r1, r5, 16
  SHR r9, r6, r0
  SAR r9, r0, r3
  ADD r1, r5, r7
  FRAME
  JMP main_0
