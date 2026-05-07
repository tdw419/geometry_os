; conditional logic
; initialization
  LDI r12, 1085
  LDI r14, 0x537644
  LDI r1, 3163
  LDI r5, 10
  LDI r2, 0x8EC466
  LDI r6, 0x22EA48
  CMP r0, r3
  JZ r0, else_0
  MOD r1, r8, r5
  AND r0, r9, r11
  DIV r7, r5, r6
  MOD r1, r2, r4
  JMP endif_1
else_0:
  LDI r8, 0xB87273
  LDI r23, 0xC4EFE2
  LDI r8, 0x1BC68F
  LDI r10, 1
  LDI r9, 0xB8F192
  LINE r8, r23, r8, r10, r9
  LDI r6, 0x028419
  LDI r5, 3097
  LDI r13, 0xC36785
  LDI r6, 3530
  LDI r14, 8
  LINE r6, r5, r13, r6, r14
  LDI r6, 2582
  LDI r12, 392
  LDI r5, 0xD7D537
  WPIXEL
  LDI r11, 8
  LDI r10, 3621
  LDI r12, 10
  LDI r3, 0xD82130
  LDI r8, 2116
  RECTF r11, r10, r12, r3, r8
endif_1:
  CMP r7, r10
  JZ r7, else_2
  SHR r6, r0, r8
  MOD r15, r14, r11
  JMP endif_3
else_2:
  LDI r2, 0x3FA3CA
  LDI r4, 8
  LDI r3, 3237
  PSETI
  LDI r0, 3052
  LDI r4, 0
  LDI r3, 0x3973DD
  LDI r10, 0xF8DCAB
  LDI r13, 237
  RECTF r0, r4, r3, r10, r13
  LDI r3, 226
  LDI r0, 0xF2297F
  LDI r12, 0x922199
  LDI r2, 0x2BEC80
  LDI r9, 3077
  RECTF r3, r0, r12, r2, r9
  LDI r21, 8
  LDI r0, 128
  LDI r12, 1057
  PSETI
endif_3:
  CMP r1, r10
  JNZ r1, else_4
  SHL r4, r0, r9
  MUL r11, r3, r9
  JMP endif_5
else_4:
  LDI r12, 0xC94382
  LDI r14, 0x8D0A5C
  LDI r5, 16
  LDI r0, 4077
  CIRCLE r12, r14, r5, r0
  LDI r10, 1264
  LDI r8, 128
  LDI r8, 0xF6DEFA
  PSET r10, r8, r8
endif_5:
  HALT
