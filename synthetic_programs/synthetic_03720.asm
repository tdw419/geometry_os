; conditional logic
; initialization
  LDI r9, 2040
  LDI r8, 10
  LDI r14, 16
  LDI r15, 0xB147E3
  LDI r4, 3528
  LDI r3, 0xFA5BF9
  LDI r6, 0xD0E675
  LDI r5, 3755
  CMP r4, r7
  JZ r4, else_0
  MUL r5, r8, r3
  XOR r9, r1, r11
  JMP endif_1
else_0:
  LDI r8, 118
  LDI r15, 1879
  LDI r4, 1
  LDI r3, 3169
  CIRCLE r8, r15, r4, r3
  LDI r3, 2488
  FILL r3
  LDI r5, 707
  LDI r1, 10
  LDI r1, 1174
  WPIXEL
  LDI r7, 2670
  FILL r7
endif_1:
  CMP r15, r1
  JNZ r15, else_2
  SHL r2, r9, r3
  SUB r12, r13, r0
  AND r20, r10, r11
  OR r9, r3, r11
  JMP endif_3
else_2:
  LDI r9, 0x1818BF
  LDI r2, 2
  LDI r11, 255
  PSET r9, r2, r11
endif_3:
  CMP r14, r1
  JZ r14, else_4
  MOD r1, r10, r0
  DIV r15, r10, r11
  JMP endif_5
else_4:
  LDI r0, 2
  LDI r12, 460
  LDI r0, 0x4BC5DD
  PSETI
endif_5:
  HALT
