; conditional logic
; initialization
  LDI r0, 1029
  LDI r17, 16
  LDI r9, 3141
  LDI r8, 0x672825
  LDI r5, 0x85692A
  LDI r6, 3351
  LDI r1, 0x023A6F
  CMP r11, r14
  JZ r11, else_0
  DIV r2, r9, r5
  JMP endif_1
else_0:
  LDI r7, 0xB9312D
  LDI r7, 4
  LDI r4, 0x76BA9E
  PSET r7, r7, r4
  LDI r0, 0x0F2923
  FILL r0
endif_1:
  CMP r7, r1
  JZ r7, else_2
  OR r7, r8, r6
  JMP endif_3
else_2:
  LDI r7, 958
  LDI r6, 8
  LDI r4, 0x5674BE
  PSETI
  LDI r12, 113
  LDI r4, 256
  LDI r14, 128
  PSETI
  LDI r17, 0x04CE34
  LDI r9, 0xA333AD
  LDI r4, 0x98ACFB
  LDI r3, 4075
  LDI r5, 1249
  RECTF r17, r9, r4, r3, r5
endif_3:
  HALT
