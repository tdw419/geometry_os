; conditional logic
; initialization
  LDI r4, 2956
  LDI r15, 3307
  LDI r12, 2470
  LDI r13, 4094
  LDI r2, 10
  CMP r5, r3
  JZ r5, else_0
  SHL r13, r11, r8
  SHR r2, r15, r11
  DIV r1, r5, r4
  JMP endif_1
else_0:
  LDI r13, 0x6B91BE
  LDI r12, 256
  LDI r8, 2866
  LDI r3, 0x7F1B83
  CIRCLE r13, r12, r8, r3
  LDI r12, 0xEC048A
  LDI r1, 2598
  LDI r22, 4090
  LDI r10, 2540
  CIRCLE r12, r1, r22, r10
  LDI r8, 3516
  FILL r8
  LDI r6, 2907
  LDI r7, 0x3DEC67
  LDI r5, 0xC0BF8F
  LDI r10, 4
  LDI r7, 8
  RECTF r6, r7, r5, r10, r7
endif_1:
  CMP r13, r11
  JNZ r13, else_2
  SHL r4, r9, r3
  AND r9, r3, r11
  JMP endif_3
else_2:
  LDI r10, 32
  LDI r9, 0
  LDI r9, 0x48410E
  LDI r8, 0x9973AB
  LDI r11, 2126
  LINE r10, r9, r9, r8, r11
endif_3:
  CMP r12, r13
  JZ r12, else_4
  SHL r8, r3, r9
  DIV r0, r8, r10
  SHL r3, r14, r6
  JMP endif_5
else_4:
  LDI r5, 0x4404DB
  LDI r1, 3457
  LDI r2, 10
  WPIXEL
endif_5:
  HALT
