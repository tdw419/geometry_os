; conditional logic
; initialization
  LDI r9, 3418
  LDI r3, 0x09AEA3
  LDI r0, 999
  CMP r1, r14
  JZ r1, else_0
  MOD r9, r10, r6
  AND r6, r2, r0
  OR r4, r13, r9
  JMP endif_1
else_0:
  LDI r15, 0x9C18C6
  LDI r5, 0xC850D8
  LDI r9, 3982
  LDI r4, 4
  LDI r10, 4
  RECTF r15, r5, r9, r4, r10
  LDI r11, 2898
  LDI r7, 10
  LDI r8, 0x0F764D
  PSETI
  LDI r8, 128
  LDI r4, 2
  LDI r3, 256
  LDI r0, 255
  CIRCLE r8, r4, r3, r0
  LDI r15, 3553
  LDI r11, 0xD8D0F4
  LDI r3, 0x931171
  PSETI
endif_1:
  CMP r0, r12
  JNZ r0, else_2
  AND r14, r4, r12
  DIV r15, r12, r4
  SUB r10, r15, r5
  OR r0, r8, r7
  JMP endif_3
else_2:
  LDI r9, 4
  LDI r1, 3570
  LDI r2, 0
  LDI r3, 10
  LDI r14, 4061
  LINE r9, r1, r2, r3, r14
  LDI r0, 0x38C34D
  LDI r5, 16
  LDI r12, 0x285191
  WPIXEL
  LDI r4, 1998
  FILL r4
  LDI r2, 3501
  LDI r0, 10
  LDI r13, 1209
  LDI r7, 0x0F6182
  LDI r2, 2224
  LINE r2, r0, r13, r7, r2
endif_3:
  CMP r15, r9
  JNZ r15, else_4
  DIV r2, r15, r8
  JMP endif_5
else_4:
  LDI r0, 1495
  LDI r11, 0xF78E01
  LDI r4, 0xA95E34
  PSET r0, r11, r4
  LDI r4, 410
  LDI r14, 0xD0053C
  LDI r7, 0xBB22A6
  WPIXEL
  LDI r10, 0x33DD9B
  LDI r13, 0x71836E
  LDI r12, 0x871778
  WPIXEL
  LDI r9, 0x823339
  LDI r9, 1645
  LDI r4, 1280
  PSETI
endif_5:
  HALT
