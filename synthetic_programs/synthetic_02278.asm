; conditional logic
; initialization
  LDI r12, 1441
  LDI r5, 256
  LDI r0, 4
  LDI r6, 1484
  LDI r10, 3505
  LDI r13, 1
  LDI r14, 1741
  LDI r3, 1475
  CMP r6, r14
  JZ r6, else_0
  AND r13, r5, r3
  JMP endif_1
else_0:
  LDI r13, 2
  LDI r10, 32
  LDI r14, 0x348990
  LDI r10, 2
  CIRCLE r13, r10, r14, r10
  LDI r9, 0xE080A5
  FILL r9
  LDI r2, 136
  LDI r8, 1335
  LDI r13, 16
  LDI r12, 0x6EE823
  LDI r8, 0x1FAB09
  RECTF r2, r8, r13, r12, r8
endif_1:
  CMP r0, r7
  JZ r0, else_2
  OR r12, r11, r15
  AND r6, r9, r14
  JMP endif_3
else_2:
  LDI r8, 0
  FILL r8
endif_3:
  HALT
