; conditional logic
; initialization
  LDI r11, 2
  LDI r6, 2214
  LDI r9, 2635
  LDI r15, 0x936605
  LDI r14, 0x4FC9C3
  LDI r12, 255
  LDI r0, 255
  CMP r2, r1
  JZ r2, else_0
  MOD r0, r3, r15
  SHR r23, r7, r0
  JMP endif_1
else_0:
  LDI r6, 0xF662FB
  LDI r6, 0
  LDI r14, 0xAD2837
  PSET r6, r6, r14
  LDI r6, 0x65EBBD
  LDI r3, 8
  LDI r2, 811
  LDI r5, 2796
  LDI r14, 0x136333
  LINE r6, r3, r2, r5, r14
  LDI r6, 3035
  LDI r10, 404
  LDI r8, 0x23CECD
  LDI r7, 0
  CIRCLE r6, r10, r8, r7
endif_1:
  CMP r11, r13
  JZ r11, else_2
  MUL r1, r8, r4
  XOR r14, r5, r11
  DIV r1, r5, r13
  JMP endif_3
else_2:
  LDI r6, 60
  LDI r5, 3561
  LDI r5, 3154
  PSETI
  LDI r10, 3255
  LDI r1, 3347
  LDI r6, 0x8773AD
  LDI r0, 0
  CIRCLE r10, r1, r6, r0
  LDI r2, 1524
  LDI r20, 16
  LDI r8, 3524
  PSET r2, r20, r8
  LDI r8, 128
  LDI r8, 0x46B850
  LDI r15, 2
  PSET r8, r8, r15
endif_3:
  CMP r14, r7
  JNZ r14, else_4
  SUB r12, r15, r10
  XOR r8, r14, r4
  DIV r14, r6, r8
  XOR r15, r0, r6
  JMP endif_5
else_4:
  LDI r4, 0xF264BE
  LDI r14, 2790
  LDI r0, 0xCD3A8D
  WPIXEL
  LDI r13, 10
  LDI r10, 0xB75F39
  LDI r6, 128
  PSETI
  LDI r8, 1631
  LDI r5, 255
  LDI r7, 238
  LDI r12, 32
  LDI r0, 255
  RECTF r8, r5, r7, r12, r0
  LDI r3, 32
  LDI r10, 8
  LDI r1, 2228
  PSETI
endif_5:
  HALT
