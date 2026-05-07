; conditional logic
; initialization
  LDI r2, 128
  LDI r8, 2
  LDI r14, 0xC2604B
  LDI r13, 1217
  LDI r5, 2229
  LDI r12, 2241
  LDI r11, 0x9A06FF
  LDI r4, 1582
  CMP r1, r11
  JNZ r1, else_0
  SUB r13, r12, r8
  ADD r2, r11, r17
  JMP endif_1
else_0:
  LDI r9, 175
  LDI r10, 64
  LDI r0, 256
  LDI r6, 0x2F3C58
  CIRCLE r9, r10, r0, r6
  LDI r10, 1065
  LDI r2, 1837
  LDI r2, 0xA9B612
  PSETI
endif_1:
  CMP r10, r1
  JZ r10, else_2
  MOD r3, r11, r8
  MUL r14, r13, r11
  DIV r4, r8, r3
  DIV r7, r6, r5
  JMP endif_3
else_2:
  LDI r4, 1980
  LDI r10, 10
  LDI r12, 0
  PSETI
  LDI r5, 0x22A748
  LDI r16, 2065
  LDI r0, 10
  WPIXEL
endif_3:
  CMP r8, r14
  JNZ r8, else_4
  SHR r3, r2, r6
  SHR r5, r3, r11
  AND r11, r12, r13
  JMP endif_5
else_4:
  LDI r15, 900
  LDI r1, 16
  LDI r1, 1047
  LDI r15, 1
  LDI r17, 414
  RECTF r15, r1, r1, r15, r17
endif_5:
  HALT
