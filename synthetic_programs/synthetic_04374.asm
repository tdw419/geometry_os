; conditional logic
; initialization
  LDI r4, 0x017A1B
  LDI r9, 16
  LDI r10, 399
  LDI r15, 4
  CMP r8, r24
  JZ r8, else_0
  OR r14, r4, r7
  JMP endif_1
else_0:
  LDI r1, 0x2D851A
  LDI r6, 2296
  LDI r0, 3061
  PSETI
endif_1:
  CMP r8, r5
  JZ r8, else_2
  AND r3, r15, r6
  SUB r11, r24, r2
  OR r12, r8, r11
  JMP endif_3
else_2:
  LDI r12, 262
  LDI r10, 0x743810
  LDI r6, 4
  WPIXEL
  LDI r5, 2448
  LDI r4, 0x167ACD
  LDI r13, 10
  LDI r11, 2432
  LDI r6, 3493
  RECTF r5, r4, r13, r11, r6
  LDI r0, 1711
  LDI r7, 64
  LDI r11, 0x715176
  LDI r6, 0x3D03DF
  CIRCLE r0, r7, r11, r6
  LDI r5, 0xB2524C
  LDI r6, 3147
  LDI r11, 10
  LDI r6, 586
  LDI r0, 1518
  RECTF r5, r6, r11, r6, r0
endif_3:
  HALT
