; conditional logic
; initialization
  LDI r22, 0x4A012E
  LDI r7, 255
  LDI r13, 0x476A3C
  LDI r8, 0
  CMP r10, r0
  JNZ r10, else_0
  SHR r5, r6, r4
  MOD r14, r12, r5
  MUL r12, r9, r20
  JMP endif_1
else_0:
  LDI r7, 128
  LDI r11, 255
  LDI r3, 0xA39EF7
  WPIXEL
  LDI r9, 10
  LDI r4, 10
  LDI r11, 64
  LDI r2, 10
  LDI r15, 0x48DCD4
  RECTF r9, r4, r11, r2, r15
  LDI r9, 0xE9F43E
  FILL r9
endif_1:
  CMP r21, r5
  JNZ r21, else_2
  ADD r9, r15, r12
  JMP endif_3
else_2:
  LDI r12, 0xF8841D
  LDI r12, 10
  LDI r6, 989
  LDI r14, 0xBA029A
  LDI r19, 8
  LINE r12, r12, r6, r14, r19
  LDI r9, 304
  LDI r6, 1409
  LDI r12, 437
  PSETI
  LDI r12, 0x337EEF
  LDI r5, 0xD2144A
  LDI r5, 0xEF88D8
  WPIXEL
  LDI r1, 0x50F39E
  FILL r1
endif_3:
  CMP r14, r11
  JZ r14, else_4
  DIV r14, r10, r0
  AND r8, r4, r0
  AND r0, r9, r6
  JMP endif_5
else_4:
  LDI r11, 261
  LDI r2, 4
  LDI r15, 255
  LDI r14, 0x37912A
  LDI r14, 1506
  RECTF r11, r2, r15, r14, r14
  LDI r2, 0x804745
  LDI r15, 4
  LDI r2, 4
  WPIXEL
  LDI r3, 0x65D7AC
  LDI r13, 0x88C6F1
  LDI r7, 4
  LDI r11, 0x0ED626
  LDI r13, 64
  RECTF r3, r13, r7, r11, r13
endif_5:
  HALT
