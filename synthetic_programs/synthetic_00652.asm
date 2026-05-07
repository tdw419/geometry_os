; counted animation
; initialization
  LDI r0, 64
  LDI r12, 16
  LDI r5, 2246
  LDI r7, 1782
  LDI r1, 2056
  LDI r2, 2609
  LDI r4, 0xC89818
loop_0:
  LDI r12, 0xD5FF64
  LDI r15, 128
  LDI r6, 0xC34614
  LDI r5, 2722
  LDI r19, 3586
  LINE r12, r15, r6, r5, r19
  OR r13, r3, r7
  OR r1, r8, r4
  SUBI r2, r4, 0x431665
  LDI r14, 1
  SUB r4, r4, r14
  JNZ r4, loop_0
  LDI r10, 11
loop_1:
  LDI r3, 0x3BF262
  LDI r11, 0x193CA2
  LDI r0, 0xAC2D69
  PSET r3, r11, r0
  LDI r0, 2002
  LDI r8, 0xE806C1
  LDI r7, 64
  LDI r4, 0xE4EEF2
  CIRCLE r0, r8, r7, r4
  LDI r8, 3528
  LDI r8, 329
  LDI r9, 0x0BA4F6
  PSET r8, r8, r9
  LDI r14, 1
  SUB r10, r10, r14
  JNZ r10, loop_1
  LDI r20, 1
loop_2:
  ADDI r0, r15, 0x49FE48
  LDI r2, 1
  SUB r20, r20, r2
  JNZ r20, loop_2
  HALT
