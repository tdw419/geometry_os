; conditional logic
; initialization
  LDI r7, 168
  LDI r12, 16
  LDI r1, 1109
  LDI r0, 1096
  LDI r15, 256
  CMP r17, r12
  JNZ r17, else_0
  MUL r8, r9, r13
  OR r1, r8, r4
  MUL r0, r1, r10
  JMP endif_1
else_0:
  LDI r14, 0xBB8228
  LDI r2, 107
  LDI r6, 1
  PSET r14, r2, r6
  LDI r1, 3574
  LDI r16, 256
  LDI r8, 256
  LDI r3, 16
  CIRCLE r1, r16, r8, r3
  LDI r8, 1772
  LDI r0, 0x28447C
  LDI r3, 1532
  WPIXEL
  LDI r9, 2
  FILL r9
endif_1:
  CMP r10, r6
  JZ r10, else_2
  AND r7, r9, r6
  DIV r12, r24, r7
  JMP endif_3
else_2:
  LDI r9, 1
  LDI r15, 0xFAA737
  LDI r3, 2190
  LDI r4, 2189
  LDI r7, 3836
  RECTF r9, r15, r3, r4, r7
endif_3:
  HALT
