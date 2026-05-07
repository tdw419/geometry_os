; conditional logic
; initialization
  LDI r6, 0x92D6D9
  LDI r2, 0xBB9F8C
  LDI r9, 0xB681C5
  LDI r7, 8
  LDI r12, 128
  LDI r13, 1902
  LDI r0, 2084
  CMP r18, r14
  JZ r18, else_0
  MOD r3, r12, r15
  SHL r11, r2, r12
  XOR r14, r4, r9
  MUL r5, r6, r14
  JMP endif_1
else_0:
  LDI r7, 1163
  LDI r13, 16
  LDI r6, 256
  WPIXEL
  LDI r13, 76
  LDI r12, 2633
  LDI r3, 807
  WPIXEL
  LDI r1, 8
  LDI r19, 0x11AD78
  LDI r13, 255
  LDI r0, 2
  LDI r1, 0xD7B991
  RECTF r1, r19, r13, r0, r1
  LDI r5, 1
  LDI r4, 0xEE7CD9
  LDI r13, 899
  LDI r5, 694
  LDI r1, 0x654E83
  LINE r5, r4, r13, r5, r1
endif_1:
  CMP r8, r9
  JZ r8, else_2
  MOD r14, r15, r3
  OR r7, r15, r8
  JMP endif_3
else_2:
  LDI r4, 3801
  LDI r2, 3114
  LDI r3, 0x2DC73D
  LDI r6, 0x59AEFE
  CIRCLE r4, r2, r3, r6
  LDI r12, 2034
  LDI r6, 2575
  LDI r7, 2616
  PSETI
  LDI r0, 64
  LDI r12, 979
  LDI r2, 1657
  LDI r0, 2618
  LDI r4, 0x52A6AF
  LINE r0, r12, r2, r0, r4
  LDI r12, 8
  LDI r13, 0x8276EE
  LDI r11, 46
  LDI r6, 0xBA71D4
  CIRCLE r12, r13, r11, r6
endif_3:
  HALT
