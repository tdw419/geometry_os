; conditional logic
; initialization
  LDI r31, 1473
  LDI r0, 0xD65618
  LDI r15, 0
  LDI r2, 0xC6B6E5
  LDI r11, 0x7B9D5B
  LDI r3, 2757
  CMP r3, r17
  JZ r3, else_0
  AND r14, r13, r15
  MUL r2, r0, r11
  AND r14, r8, r3
  JMP endif_1
else_0:
  LDI r1, 3495
  LDI r12, 2
  LDI r6, 128
  PSET r1, r12, r6
  LDI r9, 0x93602D
  LDI r14, 0x56B136
  LDI r8, 1897
  PSET r9, r14, r8
endif_1:
  CMP r4, r5
  JZ r4, else_2
  OR r6, r0, r9
  JMP endif_3
else_2:
  LDI r4, 1
  LDI r3, 8
  LDI r4, 954
  PSETI
  LDI r7, 64
  LDI r14, 606
  LDI r10, 1
  PSET r7, r14, r10
  LDI r10, 0x123EE7
  LDI r0, 0xC09E79
  LDI r7, 2
  PSETI
  LDI r15, 0x65AB5B
  LDI r2, 1754
  LDI r2, 1459
  LDI r8, 1922
  CIRCLE r15, r2, r2, r8
endif_3:
  CMP r15, r5
  JNZ r15, else_4
  MOD r15, r12, r7
  SUB r25, r14, r13
  JMP endif_5
else_4:
  LDI r10, 16
  LDI r15, 3375
  LDI r0, 0x6E2265
  LDI r13, 0xA5796C
  LDI r10, 3483
  RECTF r10, r15, r0, r13, r10
endif_5:
  HALT
