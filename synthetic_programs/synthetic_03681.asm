; conditional logic
; initialization
  LDI r2, 0xEB5F06
  LDI r27, 0x2A9F0D
  LDI r4, 4
  CMP r11, r13
  JZ r11, else_0
  MUL r3, r6, r7
  JMP endif_1
else_0:
  LDI r11, 0xB193A7
  FILL r11
  LDI r11, 0x88E4A2
  LDI r9, 2424
  LDI r19, 841
  LDI r2, 3587
  LDI r4, 0x0F9F96
  LINE r11, r9, r19, r2, r4
  LDI r14, 2
  LDI r9, 1146
  LDI r10, 0x19AEF1
  LDI r14, 3911
  CIRCLE r14, r9, r10, r14
  LDI r10, 64
  LDI r11, 256
  LDI r7, 0
  PSETI
endif_1:
  CMP r5, r2
  JZ r5, else_2
  SHR r10, r14, r8
  SHL r20, r4, r8
  JMP endif_3
else_2:
  LDI r6, 256
  LDI r0, 0
  LDI r0, 16
  LDI r5, 0xA77454
  CIRCLE r6, r0, r0, r5
  LDI r30, 57
  LDI r15, 0xC8F58F
  LDI r12, 0x160E3C
  PSETI
  LDI r10, 2227
  LDI r5, 10
  LDI r10, 1952
  LDI r8, 10
  CIRCLE r10, r5, r10, r8
  LDI r10, 0x9C1D99
  FILL r10
endif_3:
  HALT
