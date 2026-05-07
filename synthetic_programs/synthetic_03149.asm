; conditional logic
; initialization
  LDI r9, 2528
  LDI r3, 0x99ADD6
  LDI r1, 0x480CE0
  LDI r10, 363
  CMP r2, r12
  JZ r2, else_0
  DIV r6, r9, r10
  SHR r15, r9, r13
  JMP endif_1
else_0:
  LDI r1, 0xBDF1E9
  LDI r9, 0x2F1F42
  LDI r14, 0x7B7D6F
  PSET r1, r9, r14
  LDI r12, 2200
  FILL r12
endif_1:
  CMP r12, r8
  JNZ r12, else_2
  DIV r21, r8, r10
  AND r13, r4, r5
  SHR r7, r13, r12
  JMP endif_3
else_2:
  LDI r6, 0x6DDADE
  LDI r10, 10
  LDI r1, 0x75D5DC
  LDI r4, 32
  LDI r8, 0x978344
  RECTF r6, r10, r1, r4, r8
  LDI r9, 4
  LDI r11, 1
  LDI r0, 64
  LDI r1, 3148
  LDI r0, 128
  RECTF r9, r11, r0, r1, r0
  LDI r9, 16
  LDI r15, 255
  LDI r1, 2676
  LDI r12, 0x639BC5
  CIRCLE r9, r15, r1, r12
endif_3:
  CMP r5, r13
  JZ r5, else_4
  MUL r8, r13, r19
  XOR r9, r4, r10
  MOD r14, r13, r2
  XOR r0, r11, r2
  JMP endif_5
else_4:
  LDI r12, 0xF8D573
  LDI r0, 0x63B9E6
  LDI r10, 4
  LDI r14, 0x80C764
  CIRCLE r12, r0, r10, r14
endif_5:
  HALT
