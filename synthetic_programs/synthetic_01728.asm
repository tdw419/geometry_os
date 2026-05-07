; conditional logic
; initialization
  LDI r9, 3964
  LDI r5, 0x38D9A1
  LDI r7, 1911
  LDI r14, 2
  LDI r10, 18
  LDI r0, 1249
  LDI r13, 255
  CMP r12, r4
  JNZ r12, else_0
  SUB r13, r7, r11
  XOR r0, r3, r9
  SUB r13, r4, r5
  SHL r12, r9, r18
  JMP endif_1
else_0:
  LDI r11, 749
  LDI r0, 32
  LDI r13, 10
  WPIXEL
  LDI r9, 0x72037C
  LDI r8, 0xDD38F8
  LDI r1, 1440
  LDI r5, 10
  CIRCLE r9, r8, r1, r5
  LDI r13, 256
  LDI r8, 76
  LDI r9, 8
  PSET r13, r8, r9
  LDI r6, 128
  LDI r2, 4
  LDI r2, 404
  WPIXEL
endif_1:
  CMP r15, r26
  JZ r15, else_2
  OR r10, r12, r5
  MUL r0, r15, r13
  JMP endif_3
else_2:
  LDI r4, 2
  LDI r8, 0x1EDE12
  LDI r4, 0xED25B6
  PSET r4, r8, r4
  LDI r8, 0x33EB27
  LDI r13, 3678
  LDI r4, 0x3B2B89
  PSET r8, r13, r4
endif_3:
  CMP r0, r2
  JZ r0, else_4
  DIV r7, r5, r4
  SHL r7, r13, r8
  ADD r3, r12, r11
  JMP endif_5
else_4:
  LDI r6, 64
  LDI r8, 32
  LDI r15, 2
  LDI r8, 2330
  LDI r9, 0x62E880
  RECTF r6, r8, r15, r8, r9
  LDI r6, 0x63F9E5
  LDI r1, 2856
  LDI r5, 8
  PSETI
endif_5:
  HALT
