; conditional logic
; initialization
  LDI r9, 0x6789FB
  LDI r8, 2029
  CMP r11, r15
  JZ r11, else_0
  AND r8, r14, r6
  MOD r4, r6, r1
  JMP endif_1
else_0:
  LDI r4, 128
  LDI r6, 0x076753
  LDI r11, 75
  LDI r5, 0x5DAD26
  LDI r0, 2466
  RECTF r4, r6, r11, r5, r0
  LDI r5, 0x513E87
  LDI r11, 8
  LDI r2, 2
  PSETI
  LDI r8, 0x087E50
  LDI r9, 3417
  LDI r9, 2733
  LDI r14, 4
  CIRCLE r8, r9, r9, r14
endif_1:
  CMP r7, r9
  JZ r7, else_2
  MUL r10, r14, r0
  SUB r10, r12, r1
  ADD r10, r13, r2
  AND r10, r11, r14
  JMP endif_3
else_2:
  LDI r13, 621
  FILL r13
  LDI r14, 0xC3324C
  LDI r15, 0x58700A
  LDI r0, 3436
  PSETI
endif_3:
  CMP r10, r2
  JZ r10, else_4
  XOR r8, r2, r14
  JMP endif_5
else_4:
  LDI r0, 32
  LDI r12, 2
  LDI r14, 2646
  LDI r8, 1097
  LDI r3, 327
  RECTF r0, r12, r14, r8, r3
endif_5:
  HALT
