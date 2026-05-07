; conditional logic
; initialization
  LDI r12, 0
  LDI r1, 1306
  LDI r10, 2120
  LDI r3, 1810
  LDI r13, 389
  LDI r6, 16
  LDI r14, 0x316B40
  LDI r7, 16
  CMP r5, r6
  JZ r5, else_0
  SUB r10, r12, r9
  SUB r7, r6, r4
  XOR r20, r13, r12
  SHR r4, r5, r0
  JMP endif_1
else_0:
  LDI r2, 0xF8EAE3
  LDI r14, 2336
  LDI r10, 734
  LDI r1, 255
  CIRCLE r2, r14, r10, r1
  LDI r14, 0x9ED165
  LDI r10, 3218
  LDI r6, 0
  LDI r24, 0xD1AEF6
  LDI r9, 1770
  RECTF r14, r10, r6, r24, r9
  LDI r10, 0x5AEB89
  LDI r30, 16
  LDI r9, 2400
  PSET r10, r30, r9
endif_1:
  CMP r13, r15
  JNZ r13, else_2
  OR r9, r10, r11
  SUB r8, r9, r1
  JMP endif_3
else_2:
  LDI r1, 2341
  LDI r12, 0x80BE41
  LDI r12, 2
  PSET r1, r12, r12
  LDI r7, 1116
  LDI r14, 269
  LDI r12, 3852
  LDI r11, 0
  LDI r7, 2303
  LINE r7, r14, r12, r11, r7
endif_3:
  HALT
