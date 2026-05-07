; conditional logic
; initialization
  LDI r5, 0xC4E9A1
  LDI r1, 256
  CMP r1, r5
  JZ r1, else_0
  SHR r5, r2, r9
  JMP endif_1
else_0:
  LDI r30, 3000
  LDI r9, 0x52459F
  LDI r1, 0
  PSETI
  LDI r4, 2425
  LDI r5, 794
  LDI r12, 0xDBA7DE
  LDI r2, 0
  LDI r7, 64
  RECTF r4, r5, r12, r2, r7
  LDI r8, 3975
  LDI r3, 754
  LDI r9, 2802
  LDI r8, 0x8331B2
  CIRCLE r8, r3, r9, r8
  LDI r10, 255
  LDI r9, 256
  LDI r11, 0x854996
  WPIXEL
endif_1:
  CMP r3, r13
  JNZ r3, else_2
  OR r13, r5, r29
  DIV r5, r0, r1
  MOD r7, r4, r5
  JMP endif_3
else_2:
  LDI r10, 256
  LDI r1, 1
  LDI r1, 2203
  PSETI
  LDI r0, 0x796461
  LDI r3, 0xB227C4
  LDI r5, 0xE00A31
  PSETI
  LDI r5, 3813
  LDI r3, 3391
  LDI r7, 2613
  WPIXEL
endif_3:
  CMP r10, r6
  JNZ r10, else_4
  SHR r11, r3, r12
  DIV r2, r7, r11
  JMP endif_5
else_4:
  LDI r9, 128
  LDI r14, 8
  LDI r1, 255
  LDI r3, 1
  CIRCLE r9, r14, r1, r3
  LDI r13, 3924
  LDI r2, 2771
  LDI r0, 2769
  LDI r3, 0x1B2B2B
  LDI r1, 128
  RECTF r13, r2, r0, r3, r1
endif_5:
  HALT
