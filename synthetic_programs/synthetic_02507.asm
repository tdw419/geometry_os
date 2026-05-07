; conditional logic
; initialization
  LDI r2, 4
  LDI r4, 32
  LDI r1, 10
  LDI r15, 0xE65CC2
  LDI r5, 0xAEE774
  CMP r12, r13
  JNZ r12, else_0
  AND r12, r2, r1
  SHL r21, r30, r1
  JMP endif_1
else_0:
  LDI r9, 0x7A005E
  LDI r2, 0xF3D9B2
  LDI r6, 1940
  LDI r8, 0x22A7B2
  LDI r6, 0
  LINE r9, r2, r6, r8, r6
  LDI r14, 1207
  FILL r14
endif_1:
  CMP r3, r6
  JZ r3, else_2
  DIV r6, r30, r15
  JMP endif_3
else_2:
  LDI r21, 3466
  LDI r6, 16
  LDI r12, 0xAB2084
  LDI r3, 3322
  LDI r4, 870
  RECTF r21, r6, r12, r3, r4
  LDI r10, 2913
  LDI r15, 916
  LDI r15, 1827
  LDI r13, 128
  CIRCLE r10, r15, r15, r13
  LDI r2, 1393
  LDI r6, 3516
  LDI r11, 0xA058FC
  LDI r0, 0xE2BBD4
  CIRCLE r2, r6, r11, r0
  LDI r6, 10
  LDI r3, 16
  LDI r9, 0
  LDI r6, 128
  LDI r3, 10
  RECTF r6, r3, r9, r6, r3
endif_3:
  HALT
