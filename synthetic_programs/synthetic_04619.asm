; conditional logic
; initialization
  LDI r12, 0x73FD83
  LDI r17, 8
  LDI r11, 2566
  LDI r2, 16
  CMP r8, r10
  JZ r8, else_0
  XOR r7, r9, r13
  SHR r9, r1, r11
  JMP endif_1
else_0:
  LDI r4, 4054
  LDI r10, 64
  LDI r9, 4
  LDI r9, 2066
  CIRCLE r4, r10, r9, r9
endif_1:
  CMP r13, r8
  JNZ r13, else_2
  DIV r4, r8, r6
  JMP endif_3
else_2:
  LDI r10, 0x3FA808
  LDI r8, 256
  LDI r21, 1416
  PSET r10, r8, r21
  LDI r2, 0x7DAB14
  LDI r5, 1
  LDI r3, 0x8BA4ED
  WPIXEL
  LDI r15, 2008
  LDI r3, 2
  LDI r12, 0x84B651
  LDI r9, 8
  LDI r7, 2756
  LINE r15, r3, r12, r9, r7
endif_3:
  CMP r6, r2
  JNZ r6, else_4
  ADD r8, r15, r2
  SHL r8, r1, r12
  JMP endif_5
else_4:
  LDI r3, 16
  FILL r3
endif_5:
  HALT
