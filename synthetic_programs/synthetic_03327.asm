; conditional logic
; initialization
  LDI r14, 3385
  LDI r2, 2842
  LDI r12, 0
  LDI r6, 1621
  LDI r21, 0
  LDI r15, 2
  LDI r10, 32
  CMP r0, r4
  JZ r0, else_0
  SUB r6, r5, r1
  ADD r5, r8, r14
  MUL r6, r14, r9
  ADD r7, r1, r12
  JMP endif_1
else_0:
  LDI r0, 3204
  LDI r1, 2369
  LDI r3, 1
  LDI r11, 0x275012
  LDI r13, 0x425629
  RECTF r0, r1, r3, r11, r13
  LDI r12, 0x8C7BC7
  LDI r3, 3441
  LDI r14, 1073
  LDI r3, 1
  LDI r13, 0x741449
  LINE r12, r3, r14, r3, r13
endif_1:
  CMP r0, r4
  JNZ r0, else_2
  MUL r14, r10, r22
  XOR r9, r3, r8
  JMP endif_3
else_2:
  LDI r10, 0x0237D9
  LDI r11, 128
  LDI r3, 2
  PSET r10, r11, r3
  LDI r0, 2019
  LDI r0, 4
  LDI r13, 0x842CC3
  LDI r8, 2
  LDI r10, 2590
  RECTF r0, r0, r13, r8, r10
  LDI r3, 256
  LDI r6, 1632
  LDI r13, 0x6F928B
  LDI r0, 2245
  CIRCLE r3, r6, r13, r0
endif_3:
  CMP r11, r13
  JZ r11, else_4
  AND r14, r11, r10
  JMP endif_5
else_4:
  LDI r7, 10
  LDI r12, 0x8A607E
  LDI r7, 0x0C9A71
  PSET r7, r12, r7
endif_5:
  HALT
