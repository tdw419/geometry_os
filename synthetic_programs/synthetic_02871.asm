; counted animation
; initialization
  LDI r12, 32
  LDI r1, 256
  LDI r8, 0xAF9D4A
  LDI r2, 32
  LDI r10, 0x1D2461
  LDI r7, 3434
  LDI r6, 2
  LDI r0, 0x1BCE58
  LDI r12, 2
loop_0:
  ADD r6, r4, r1
  LDI r2, 0xCEDA83
  LDI r1, 0x327D35
  LDI r7, 0x2EFDE5
  PSET r2, r1, r7
  ANDI r8, r1, 79
  CMPI r12, r14, 186
  LDI r6, 1
  SUB r12, r12, r6
  JNZ r12, loop_0
  LDI r1, 0x20C8B4
loop_1:
  ADD r15, r4, r6
  MUL r9, r0, r10
  SHL r28, r15, r8
  OR r0, r29, r5
  LDI r0, 1
  SUB r1, r1, r0
  JNZ r1, loop_1
  HALT
