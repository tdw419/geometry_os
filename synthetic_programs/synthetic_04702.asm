; conditional logic
; initialization
  LDI r9, 3018
  LDI r10, 128
  LDI r7, 16
  LDI r3, 2506
  CMP r1, r9
  JNZ r1, else_0
  MUL r0, r15, r4
  ADD r16, r9, r8
  JMP endif_1
else_0:
  LDI r10, 2795
  LDI r1, 1050
  LDI r8, 3171
  WPIXEL
endif_1:
  CMP r5, r3
  JZ r5, else_2
  DIV r13, r4, r8
  DIV r7, r8, r15
  DIV r13, r30, r7
  JMP endif_3
else_2:
  LDI r4, 2519
  FILL r4
endif_3:
  HALT
