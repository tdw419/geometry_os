; conditional logic
; initialization
  LDI r14, 0x81A60D
  LDI r1, 128
  LDI r12, 3850
  LDI r5, 64
  LDI r15, 1121
  LDI r8, 0x9F7D1D
  LDI r7, 2
  LDI r13, 4078
  CMP r15, r11
  JNZ r15, else_0
  MOD r7, r21, r11
  DIV r9, r13, r1
  SHR r10, r7, r12
  JMP endif_1
else_0:
  LDI r1, 4086
  LDI r12, 16
  LDI r3, 1633
  PSET r1, r12, r3
  LDI r14, 2
  FILL r14
  LDI r14, 3118
  LDI r1, 157
  LDI r6, 1958
  PSET r14, r1, r6
endif_1:
  CMP r13, r2
  JNZ r13, else_2
  SHL r15, r4, r1
  MUL r2, r1, r6
  SHR r14, r9, r5
  JMP endif_3
else_2:
  LDI r6, 0x595242
  LDI r7, 1431
  LDI r3, 3926
  WPIXEL
endif_3:
  HALT
