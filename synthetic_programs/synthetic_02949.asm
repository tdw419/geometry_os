; conditional logic
; initialization
  LDI r13, 2
  LDI r6, 3997
  LDI r14, 0x61A7D6
  LDI r2, 424
  LDI r9, 0x80D223
  LDI r0, 3639
  LDI r3, 64
  CMP r15, r7
  JNZ r15, else_0
  SUB r7, r5, r4
  AND r10, r11, r14
  JMP endif_1
else_0:
  LDI r10, 4
  LDI r14, 255
  LDI r10, 0x089064
  LDI r15, 4
  LDI r6, 256
  LINE r10, r14, r10, r15, r6
endif_1:
  CMP r3, r9
  JNZ r3, else_2
  MUL r12, r13, r6
  JMP endif_3
else_2:
  LDI r11, 2
  LDI r3, 8
  LDI r19, 255
  LDI r13, 255
  LDI r8, 255
  LINE r11, r3, r19, r13, r8
  LDI r3, 0x1ACFC7
  LDI r14, 3974
  LDI r1, 0xBDB4D7
  LDI r10, 3363
  LDI r0, 0x058D53
  RECTF r3, r14, r1, r10, r0
endif_3:
  CMP r1, r6
  JNZ r1, else_4
  MUL r7, r5, r0
  ADD r12, r15, r3
  SHR r7, r6, r14
  XOR r4, r0, r2
  JMP endif_5
else_4:
  LDI r5, 256
  LDI r4, 773
  LDI r4, 2
  WPIXEL
  LDI r1, 255
  LDI r11, 64
  LDI r15, 0xF0340C
  PSETI
  LDI r0, 10
  LDI r15, 0x2152B3
  LDI r12, 3094
  LDI r2, 0x16281D
  LDI r15, 1698
  LINE r0, r15, r12, r2, r15
  LDI r2, 262
  LDI r12, 256
  LDI r7, 3848
  LDI r8, 1
  CIRCLE r2, r12, r7, r8
endif_5:
  HALT
