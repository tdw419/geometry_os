; conditional logic
; initialization
  LDI r4, 912
  LDI r5, 8
  LDI r9, 1
  LDI r1, 16
  CMP r13, r0
  JZ r13, else_0
  MUL r8, r2, r11
  JMP endif_1
else_0:
  LDI r7, 0x89AB15
  LDI r8, 508
  LDI r2, 1528
  PSET r7, r8, r2
  LDI r3, 8
  FILL r3
endif_1:
  CMP r3, r4
  JZ r3, else_2
  AND r10, r3, r12
  OR r4, r0, r15
  JMP endif_3
else_2:
  LDI r10, 0x775238
  LDI r7, 0xEC08BE
  LDI r10, 0xAC92A5
  LDI r6, 0x5E361C
  CIRCLE r10, r7, r10, r6
  LDI r10, 0x9D44EC
  LDI r12, 475
  LDI r15, 656
  PSETI
  LDI r1, 0
  LDI r2, 1165
  LDI r0, 0xE0E479
  LDI r22, 0
  CIRCLE r1, r2, r0, r22
  LDI r5, 0x9B55CD
  LDI r11, 0xBBEB44
  LDI r11, 8
  PSET r5, r11, r11
endif_3:
  CMP r5, r3
  JZ r5, else_4
  AND r10, r0, r9
  JMP endif_5
else_4:
  LDI r10, 10
  FILL r10
  LDI r11, 16
  LDI r5, 2190
  LDI r4, 255
  LDI r4, 0
  CIRCLE r11, r5, r4, r4
endif_5:
  HALT
