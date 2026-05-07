; conditional logic
; initialization
  LDI r14, 3372
  LDI r12, 128
  LDI r5, 0xF53AD8
  LDI r7, 2
  LDI r10, 32
  CMP r4, r2
  JNZ r4, else_0
  MOD r10, r14, r0
  JMP endif_1
else_0:
  LDI r15, 0x3F1EF2
  LDI r5, 1942
  LDI r11, 0xBD9EC5
  PSET r15, r5, r11
endif_1:
  CMP r11, r6
  JZ r11, else_2
  XOR r2, r0, r13
  SUB r3, r4, r11
  XOR r5, r7, r15
  DIV r4, r12, r7
  JMP endif_3
else_2:
  LDI r5, 0x3EEBE7
  FILL r5
  LDI r3, 525
  LDI r14, 0xE73F58
  LDI r15, 0xFA362A
  PSET r3, r14, r15
endif_3:
  CMP r13, r0
  JZ r13, else_4
  XOR r3, r11, r6
  DIV r0, r6, r30
  AND r9, r19, r0
  AND r13, r14, r9
  JMP endif_5
else_4:
  LDI r17, 3765
  FILL r17
  LDI r11, 1755
  LDI r4, 0x449647
  LDI r14, 179
  WPIXEL
  LDI r2, 2
  LDI r25, 0
  LDI r11, 128
  PSET r2, r25, r11
  LDI r5, 32
  LDI r11, 846
  LDI r10, 0xB9F420
  LDI r5, 0xD69426
  LDI r1, 1
  RECTF r5, r11, r10, r5, r1
endif_5:
  HALT
