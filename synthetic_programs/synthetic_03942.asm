; counted animation
; initialization
  LDI r1, 32
  LDI r9, 702
  LDI r15, 0x00A173
  LDI r6, 2701
  LDI r8, 128
  LDI r12, 1
  LDI r13, 0xD27D8B
loop_0:
  SUBI r15, r14, 4
  LDI r1, 0x066E2E
  LDI r21, 0xCCB346
  LDI r6, 2211
  LDI r11, 4
  LDI r0, 0x6505E3
  LINE r1, r21, r6, r11, r0
  LDI r11, 1
  SUB r13, r13, r11
  JNZ r13, loop_0
  LDI r14, 10
loop_1:
  LDI r2, 0x7DD1A9
  LDI r13, 0x1A936E
  LDI r5, 3128
  LDI r12, 0x9D7D0D
  LDI r4, 564
  LINE r2, r13, r5, r12, r4
  LDI r0, 1
  SUB r14, r14, r0
  JNZ r14, loop_1
  LDI r10, 0x68FA64
loop_2:
  LDI r4, 0x2282CA
  LDI r14, 4046
  LDI r24, 3470
  LDI r4, 961
  CIRCLE r4, r14, r24, r4
  SHR r4, r2, r30
  LDI r4, 911
  LDI r7, 0x8776D2
  LDI r12, 2425
  PSET r4, r7, r12
  LDI r5, 1361
  LDI r0, 498
  LDI r2, 1787
  PSET r5, r0, r2
  LDI r9, 1
  SUB r10, r10, r9
  JNZ r10, loop_2
  HALT
