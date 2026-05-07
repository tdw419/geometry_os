; conditional logic
; initialization
  LDI r5, 1423
  LDI r10, 0
  CMP r8, r4
  JZ r8, else_0
  SHL r11, r2, r10
  JMP endif_1
else_0:
  LDI r13, 0x616E75
  LDI r8, 432
  LDI r8, 0xF6C0FB
  PSETI
  LDI r8, 0x077148
  LDI r12, 0x6CF439
  LDI r15, 64
  LDI r5, 437
  LDI r9, 1080
  RECTF r8, r12, r15, r5, r9
  LDI r6, 0xA78D61
  LDI r3, 0x5D00C5
  LDI r1, 4
  LDI r9, 3144
  CIRCLE r6, r3, r1, r9
  LDI r11, 0xFE4FED
  LDI r11, 8
  LDI r4, 1935
  PSET r11, r11, r4
endif_1:
  CMP r7, r2
  JNZ r7, else_2
  XOR r14, r4, r9
  SHL r8, r14, r10
  AND r11, r8, r5
  SHL r5, r0, r2
  JMP endif_3
else_2:
  LDI r8, 0
  LDI r1, 4
  LDI r14, 32
  LDI r13, 16
  LDI r5, 2
  LINE r8, r1, r14, r13, r5
  LDI r4, 300
  LDI r5, 32
  LDI r31, 255
  PSETI
  LDI r13, 4
  LDI r11, 3124
  LDI r3, 0x761904
  PSET r13, r11, r3
  LDI r9, 0xF1848A
  LDI r11, 2072
  LDI r14, 3758
  LDI r10, 256
  LDI r5, 3163
  LINE r9, r11, r14, r10, r5
endif_3:
  CMP r7, r2
  JNZ r7, else_4
  SHR r10, r9, r18
  DIV r1, r14, r2
  JMP endif_5
else_4:
  LDI r22, 0x104180
  LDI r5, 4
  LDI r3, 1
  LDI r10, 0x7D9548
  CIRCLE r22, r5, r3, r10
endif_5:
  HALT
