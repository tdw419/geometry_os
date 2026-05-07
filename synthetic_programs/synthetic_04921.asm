; conditional logic
; initialization
  LDI r15, 0xED8671
  LDI r5, 2883
  LDI r14, 256
  LDI r1, 2184
  LDI r8, 0x7F892F
  LDI r4, 0xCC7522
  CMP r2, r12
  JNZ r2, else_0
  OR r5, r6, r4
  XOR r10, r20, r14
  SUB r3, r0, r12
  DIV r5, r13, r16
  JMP endif_1
else_0:
  LDI r13, 1818
  LDI r1, 4
  LDI r15, 16
  WPIXEL
  LDI r14, 2296
  LDI r10, 0x29ACE7
  LDI r14, 4006
  LDI r0, 1778
  CIRCLE r14, r10, r14, r0
  LDI r10, 0x4BCF7E
  LDI r5, 0x187DB8
  LDI r6, 256
  WPIXEL
endif_1:
  CMP r14, r11
  JNZ r14, else_2
  SUB r11, r5, r9
  JMP endif_3
else_2:
  LDI r13, 8
  LDI r7, 0xE3C8B0
  LDI r11, 235
  LDI r27, 0x164B43
  LDI r10, 914
  LINE r13, r7, r11, r27, r10
  LDI r2, 541
  FILL r2
endif_3:
  HALT
