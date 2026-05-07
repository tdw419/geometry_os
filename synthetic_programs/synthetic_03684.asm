; conditional logic
; initialization
  LDI r4, 0x074539
  LDI r7, 2001
  LDI r12, 3594
  CMP r9, r10
  JZ r9, else_0
  MOD r4, r10, r11
  MOD r3, r12, r14
  AND r4, r10, r1
  XOR r5, r0, r1
  JMP endif_1
else_0:
  LDI r5, 2826
  LDI r12, 1617
  LDI r1, 0xCEE781
  PSET r5, r12, r1
  LDI r8, 2290
  LDI r15, 158
  LDI r3, 0xA66A95
  WPIXEL
  LDI r7, 0xAB664C
  LDI r12, 32
  LDI r13, 0
  WPIXEL
endif_1:
  CMP r14, r7
  JNZ r14, else_2
  DIV r15, r0, r1
  SUB r14, r15, r16
  SHR r10, r6, r27
  MUL r12, r8, r3
  JMP endif_3
else_2:
  LDI r12, 388
  LDI r3, 8
  LDI r8, 0x89A3E4
  LDI r4, 3806
  LDI r15, 3662
  RECTF r12, r3, r8, r4, r15
  LDI r13, 2013
  LDI r4, 0x637E56
  LDI r23, 1201
  WPIXEL
  LDI r12, 1101
  LDI r6, 917
  LDI r10, 2420
  LDI r13, 89
  CIRCLE r12, r6, r10, r13
endif_3:
  CMP r4, r7
  JNZ r4, else_4
  MUL r12, r15, r29
  SHR r15, r1, r3
  OR r28, r5, r9
  OR r0, r10, r1
  JMP endif_5
else_4:
  LDI r13, 0x942FC9
  LDI r14, 0
  LDI r16, 8
  LDI r7, 1538
  LDI r22, 3472
  LINE r13, r14, r16, r7, r22
  LDI r5, 1029
  LDI r12, 0xFF4A99
  LDI r6, 0xC6E447
  PSET r5, r12, r6
endif_5:
  HALT
