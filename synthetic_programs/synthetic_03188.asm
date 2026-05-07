; conditional logic
; initialization
  LDI r4, 3355
  LDI r14, 64
  CMP r11, r9
  JZ r11, else_0
  OR r1, r2, r11
  JMP endif_1
else_0:
  LDI r10, 10
  LDI r3, 0x4068E6
  LDI r9, 0xD8AD0D
  WPIXEL
  LDI r4, 0x543347
  LDI r6, 0x8B6DF2
  LDI r7, 318
  LDI r8, 3134
  LDI r3, 187
  RECTF r4, r6, r7, r8, r3
  LDI r9, 3247
  LDI r11, 256
  LDI r12, 64
  LDI r14, 368
  LDI r10, 2
  RECTF r9, r11, r12, r14, r10
endif_1:
  CMP r4, r10
  JZ r4, else_2
  SUB r0, r5, r8
  ADD r9, r10, r15
  ADD r6, r3, r8
  XOR r23, r3, r10
  JMP endif_3
else_2:
  LDI r12, 0xC49E21
  LDI r3, 0x18A389
  LDI r15, 32
  LDI r10, 255
  CIRCLE r12, r3, r15, r10
  LDI r8, 1539
  LDI r7, 0xC3F571
  LDI r7, 4
  PSETI
endif_3:
  CMP r6, r23
  JZ r6, else_4
  DIV r5, r2, r0
  SUB r13, r2, r3
  JMP endif_5
else_4:
  LDI r8, 1
  LDI r15, 1889
  LDI r13, 0x222F84
  LDI r12, 16
  CIRCLE r8, r15, r13, r12
endif_5:
  HALT
