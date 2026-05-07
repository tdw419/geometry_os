; conditional logic
; initialization
  LDI r6, 90
  LDI r4, 2
  LDI r12, 2633
  LDI r8, 0xAECCA7
  LDI r9, 0x43A996
  CMP r12, r10
  JZ r12, else_0
  SHR r3, r13, r1
  JMP endif_1
else_0:
  LDI r15, 3804
  LDI r12, 0xA801A6
  LDI r11, 2106
  PSETI
  LDI r5, 8
  LDI r6, 0
  LDI r8, 0xE04421
  PSET r5, r6, r8
endif_1:
  CMP r0, r3
  JNZ r0, else_2
  MOD r14, r11, r10
  ADD r10, r7, r8
  AND r18, r4, r5
  JMP endif_3
else_2:
  LDI r19, 3919
  LDI r4, 2776
  LDI r15, 10
  PSET r19, r4, r15
  LDI r14, 0xDDC963
  LDI r13, 830
  LDI r3, 0xEBD570
  LDI r2, 3754
  CIRCLE r14, r13, r3, r2
  LDI r15, 0
  LDI r5, 4057
  LDI r12, 1
  PSET r15, r5, r12
  LDI r14, 256
  FILL r14
endif_3:
  CMP r11, r9
  JZ r11, else_4
  DIV r13, r11, r2
  JMP endif_5
else_4:
  LDI r2, 4
  LDI r29, 255
  LDI r2, 2
  PSET r2, r29, r2
  LDI r15, 0x2F047B
  FILL r15
  LDI r5, 0x415384
  LDI r14, 0xBC8B63
  LDI r5, 4
  PSETI
endif_5:
  HALT
