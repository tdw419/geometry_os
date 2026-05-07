; conditional logic
; initialization
  LDI r1, 1848
  LDI r11, 2364
  LDI r13, 0x55859C
  LDI r6, 89
  LDI r9, 1
  CMP r6, r7
  JZ r6, else_0
  MOD r12, r7, r14
  MOD r13, r6, r3
  MOD r1, r7, r5
  JMP endif_1
else_0:
  LDI r6, 2117
  LDI r13, 0x190EC4
  LDI r5, 16
  LDI r8, 16
  CIRCLE r6, r13, r5, r8
  LDI r15, 128
  LDI r14, 1
  LDI r5, 8
  WPIXEL
  LDI r12, 2135
  LDI r4, 0xB8ED6B
  LDI r3, 16
  PSETI
endif_1:
  CMP r9, r15
  JZ r9, else_2
  MOD r10, r6, r1
  JMP endif_3
else_2:
  LDI r3, 785
  LDI r12, 255
  LDI r0, 0x4B145F
  WPIXEL
endif_3:
  CMP r1, r0
  JNZ r1, else_4
  SUB r1, r0, r8
  SHR r0, r6, r7
  DIV r12, r23, r9
  JMP endif_5
else_4:
  LDI r14, 1023
  LDI r13, 32
  LDI r8, 0x8B9D22
  LDI r8, 16
  LDI r9, 2283
  RECTF r14, r13, r8, r8, r9
endif_5:
  HALT
