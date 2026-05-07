; conditional logic
; initialization
  LDI r6, 3575
  LDI r0, 0x9B134D
  LDI r10, 3525
  LDI r7, 0
  LDI r9, 1
  LDI r12, 64
  CMP r7, r9
  JZ r7, else_0
  DIV r1, r15, r9
  JMP endif_1
else_0:
  LDI r1, 0xCA6395
  LDI r12, 0x9F42DF
  LDI r7, 767
  PSET r1, r12, r7
  LDI r7, 590
  LDI r12, 0xED4A8E
  LDI r13, 1
  PSET r7, r12, r13
endif_1:
  CMP r6, r10
  JNZ r6, else_2
  OR r3, r1, r9
  DIV r7, r2, r3
  DIV r6, r8, r5
  JMP endif_3
else_2:
  LDI r8, 3712
  LDI r4, 2310
  LDI r1, 2
  PSET r8, r4, r1
  LDI r11, 1998
  LDI r3, 1968
  LDI r0, 2
  LDI r12, 3353
  CIRCLE r11, r3, r0, r12
  LDI r7, 0x4DA7C3
  LDI r3, 0
  LDI r11, 0xB4481C
  LDI r0, 16
  CIRCLE r7, r3, r11, r0
endif_3:
  HALT
