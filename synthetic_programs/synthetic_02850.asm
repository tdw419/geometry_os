; drawing loop program
; initialization
  LDI r0, 411
  LDI r2, 0
  LDI r8, 1810
main_0:
  SUBI r5, r1, 0x8B39AB
  IKEY r3
  CMPI r3, 255
  JNZ r3, key_1
  CMPI r14, r15, 144
  ADD r8, r12, r5
  LDI r7, 3282
  LDI r2, 10
  LDI r13, 1
  LDI r10, 2575
  CIRCLE r7, r2, r13, r10
  CMP r5, r28
  FRAME
  JMP main_0
