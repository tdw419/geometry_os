; counted animation
; initialization
  LDI r7, 0x588E14
  LDI r14, 0xD4E408
  LDI r10, 1777
  LDI r13, 2144
  LDI r12, 0
  LDI r1, 3821
  LDI r4, 636
  LDI r2, 2
loop_0:
  ADD r14, r3, r0
  SUBI r17, r10, 0x5C99CE
  LDI r12, 3366
  LDI r9, 204
  LDI r6, 297
  PSETI
  LDI r26, 1
  SUB r2, r2, r26
  JNZ r2, loop_0
  HALT
