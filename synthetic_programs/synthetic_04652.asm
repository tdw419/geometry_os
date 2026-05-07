; math computation
; initialization
  LDI r0, 0xFE0DE9
  LDI r6, 0
  LDI r12, 4
  LDI r4, 32
  LDI r5, 0
  SHL r7, r29, r0
  SHL r5, r14, r12
  SUBI r11, r2, 174
  ADDI r10, r11, 255
  SAR r17, r9, r10
  SHL r7, r23, r6
  SUBI r2, r6, 32
  SUBI r10, r8, 1
  ADD r0, r13, r8
  ADD r0, r5, r8
  HALT
