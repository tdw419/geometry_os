; conditional logic
; initialization
  LDI r7, 0xFFE1FC
  LDI r14, 0xC5F948
  CMP r12, r15
  JZ r12, else_0
  OR r13, r5, r19
  DIV r11, r13, r12
  XOR r2, r15, r8
  DIV r3, r14, r15
  JMP endif_1
else_0:
  LDI r13, 0x003E67
  FILL r13
endif_1:
  CMP r10, r1
  JZ r10, else_2
  AND r5, r3, r14
  JMP endif_3
else_2:
  LDI r4, 3081
  FILL r4
  LDI r7, 0x3CB707
  LDI r3, 0x4A494B
  LDI r0, 2
  LDI r1, 0x12AAF9
  LDI r0, 680
  LINE r7, r3, r0, r1, r0
  LDI r10, 128
  LDI r8, 64
  LDI r14, 8
  WPIXEL
endif_3:
  HALT
