; conditional logic
; initialization
  LDI r10, 2658
  LDI r12, 0x994B0E
  LDI r4, 1
  CMP r7, r12
  JNZ r7, else_0
  AND r12, r9, r1
  JMP endif_1
else_0:
  LDI r0, 3093
  LDI r1, 0x12EAFC
  LDI r11, 0x336E4E
  LDI r7, 32
  CIRCLE r0, r1, r11, r7
  LDI r10, 0x732465
  LDI r15, 3946
  LDI r6, 0x95699F
  LDI r0, 32
  CIRCLE r10, r15, r6, r0
endif_1:
  CMP r18, r1
  JZ r18, else_2
  MOD r1, r4, r7
  AND r3, r11, r10
  XOR r10, r11, r13
  DIV r7, r1, r8
  JMP endif_3
else_2:
  LDI r5, 0x111B56
  LDI r13, 0x9D01BA
  LDI r5, 0
  LDI r21, 0x783E37
  LDI r9, 8
  RECTF r5, r13, r5, r21, r9
  LDI r9, 256
  LDI r14, 0x1F330A
  LDI r2, 1117
  LDI r11, 128
  LDI r9, 17
  RECTF r9, r14, r2, r11, r9
  LDI r8, 10
  LDI r6, 570
  LDI r14, 4
  PSETI
  LDI r5, 0x2A6FB5
  LDI r5, 1
  LDI r4, 4
  PSET r5, r5, r4
endif_3:
  CMP r4, r14
  JNZ r4, else_4
  AND r8, r7, r6
  AND r13, r8, r9
  ADD r14, r9, r12
  SHL r11, r18, r13
  JMP endif_5
else_4:
  LDI r9, 0
  LDI r13, 2811
  LDI r10, 0x77D39E
  PSET r9, r13, r10
endif_5:
  HALT
