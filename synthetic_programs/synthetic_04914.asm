; conditional logic
; initialization
  LDI r4, 2913
  LDI r14, 256
  LDI r15, 1896
  LDI r5, 0x8DD855
  LDI r13, 2574
  LDI r3, 259
  LDI r9, 256
  LDI r10, 255
  CMP r9, r0
  JNZ r9, else_0
  ADD r11, r3, r27
  MOD r9, r1, r8
  JMP endif_1
else_0:
  LDI r2, 3770
  LDI r6, 0
  LDI r3, 1673
  LDI r11, 255
  LDI r13, 10
  LINE r2, r6, r3, r11, r13
  LDI r1, 255
  LDI r5, 2254
  LDI r13, 612
  LDI r15, 10
  LDI r0, 1
  RECTF r1, r5, r13, r15, r0
  LDI r1, 3698
  LDI r2, 0x970B93
  LDI r9, 3726
  WPIXEL
endif_1:
  CMP r31, r14
  JNZ r31, else_2
  MUL r5, r14, r4
  MUL r9, r3, r4
  JMP endif_3
else_2:
  LDI r6, 2079
  LDI r5, 0x104BD4
  LDI r5, 2780
  PSETI
  LDI r3, 128
  LDI r0, 128
  LDI r3, 1792
  PSET r3, r0, r3
  LDI r6, 4037
  LDI r26, 3242
  LDI r0, 2
  LDI r14, 0xD35C7F
  LDI r8, 64
  RECTF r6, r26, r0, r14, r8
endif_3:
  CMP r4, r0
  JZ r4, else_4
  SUB r15, r3, r4
  JMP endif_5
else_4:
  LDI r0, 179
  FILL r0
  LDI r4, 3885
  LDI r15, 374
  LDI r1, 0x6DB101
  LDI r7, 64
  LDI r29, 0x5C2D39
  LINE r4, r15, r1, r7, r29
  LDI r8, 32
  LDI r1, 184
  LDI r13, 3237
  LDI r1, 2604
  CIRCLE r8, r1, r13, r1
  LDI r11, 0
  LDI r4, 0
  LDI r15, 8
  LDI r15, 0xD6C372
  LDI r11, 2562
  RECTF r11, r4, r15, r15, r11
endif_5:
  HALT
