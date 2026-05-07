; conditional logic
; initialization
  LDI r7, 2279
  LDI r4, 0xB25081
  LDI r13, 3773
  LDI r6, 761
  LDI r11, 2
  LDI r15, 648
  LDI r12, 2
  CMP r0, r11
  JNZ r0, else_0
  SHR r12, r6, r8
  JMP endif_1
else_0:
  LDI r14, 8
  LDI r4, 1680
  LDI r0, 3777
  LDI r4, 3701
  LDI r2, 0x61990B
  LINE r14, r4, r0, r4, r2
  LDI r12, 1
  LDI r10, 0x67F3DB
  LDI r4, 3762
  PSETI
endif_1:
  CMP r5, r6
  JZ r5, else_2
  MOD r13, r0, r1
  DIV r10, r1, r7
  JMP endif_3
else_2:
  LDI r4, 128
  LDI r11, 3634
  LDI r8, 0xF2794E
  LDI r1, 128
  LDI r2, 0xC0F93C
  LINE r4, r11, r8, r1, r2
endif_3:
  HALT
