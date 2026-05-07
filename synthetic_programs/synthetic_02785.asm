; drawing loop program
; initialization
  LDI r0, 128
  LDI r1, 2
  LDI r15, 16
  LDI r6, 0xDD2B11
  LDI r5, 3877
  LDI r2, 2343
  LDI r12, 0x877164
  LDI r7, 3238
main_0:
  SHR r28, r4, r13
  SAR r1, r7, r15
  SHL r4, r5, r7
  SHL r14, r2, r3
  LDI r3, 0xFE9D1D
  LDI r14, 0x670F36
  LDI r15, 0x79CA95
  LDI r6, 1
  LDI r12, 3549
  RECTF r3, r14, r15, r6, r12
  LDI r10, 1029
  LDI r13, 4
  LDI r0, 3317
  PSET r10, r13, r0
  SUBI r14, r6, 16
  ADDI r15, r12, 0x56DF94
  FRAME
  JMP main_0
