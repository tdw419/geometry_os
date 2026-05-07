; conditional logic
; initialization
  LDI r2, 0x32E9FB
  LDI r8, 35
  LDI r3, 64
  LDI r5, 4076
  LDI r0, 660
  LDI r7, 0x2388CE
  CMP r11, r14
  JNZ r11, else_0
  MUL r14, r5, r0
  DIV r15, r10, r5
  ADD r9, r15, r14
  JMP endif_1
else_0:
  LDI r1, 0x6FB841
  FILL r1
endif_1:
  CMP r11, r5
  JNZ r11, else_2
  DIV r14, r5, r0
  JMP endif_3
else_2:
  LDI r10, 3342
  LDI r5, 4
  LDI r0, 1139
  WPIXEL
endif_3:
  CMP r0, r5
  JZ r0, else_4
  SUB r10, r14, r7
  JMP endif_5
else_4:
  LDI r11, 2
  FILL r11
  LDI r22, 255
  LDI r8, 4
  LDI r6, 0x9BFA54
  LDI r10, 1390
  LDI r2, 0xFA4C50
  LINE r22, r8, r6, r10, r2
  LDI r8, 0x4D097E
  LDI r13, 2
  LDI r14, 0x3647EA
  LDI r6, 4
  CIRCLE r8, r13, r14, r6
endif_5:
  HALT
