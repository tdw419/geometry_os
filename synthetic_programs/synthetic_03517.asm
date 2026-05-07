; conditional logic
; initialization
  LDI r0, 0xF273CB
  LDI r5, 24
  LDI r23, 0x08A3A9
  CMP r11, r2
  JNZ r11, else_0
  MUL r12, r10, r13
  MUL r8, r11, r10
  JMP endif_1
else_0:
  LDI r0, 1969
  LDI r7, 3327
  LDI r4, 256
  PSET r0, r7, r4
  LDI r2, 0xA9BF1C
  LDI r15, 862
  LDI r0, 0xE9419A
  LDI r2, 3225
  LDI r14, 1553
  RECTF r2, r15, r0, r2, r14
endif_1:
  CMP r0, r2
  JNZ r0, else_2
  SHL r0, r13, r12
  ADD r12, r9, r2
  JMP endif_3
else_2:
  LDI r1, 1449
  FILL r1
  LDI r1, 0xB1F68B
  LDI r10, 0x88A90D
  LDI r5, 1339
  PSETI
  LDI r11, 2357
  LDI r1, 699
  LDI r14, 604
  LDI r13, 610
  LDI r15, 0x8ABD8E
  RECTF r11, r1, r14, r13, r15
endif_3:
  CMP r0, r10
  JNZ r0, else_4
  DIV r9, r1, r7
  MUL r11, r14, r5
  SHR r7, r10, r1
  JMP endif_5
else_4:
  LDI r6, 0xC01065
  LDI r12, 2212
  LDI r4, 0x6057EC
  WPIXEL
  LDI r15, 1964
  LDI r15, 1
  LDI r1, 4
  LDI r3, 728
  CIRCLE r15, r15, r1, r3
  LDI r8, 266
  LDI r15, 10
  LDI r11, 255
  PSET r8, r15, r11
  LDI r13, 1172
  FILL r13
endif_5:
  HALT
