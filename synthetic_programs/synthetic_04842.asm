; conditional logic
; initialization
  LDI r9, 64
  LDI r15, 8
  LDI r3, 0x530F1C
  LDI r12, 0x0A70A7
  LDI r0, 1870
  CMP r12, r15
  JZ r12, else_0
  SUB r2, r8, r14
  SHL r8, r3, r7
  JMP endif_1
else_0:
  LDI r4, 0x61C67F
  LDI r0, 3456
  LDI r19, 156
  WPIXEL
endif_1:
  CMP r9, r7
  JNZ r9, else_2
  SHR r5, r14, r10
  SHR r13, r7, r14
  OR r6, r4, r3
  JMP endif_3
else_2:
  LDI r3, 0xC9785F
  LDI r5, 16
  LDI r10, 4
  LDI r0, 256
  LDI r11, 2935
  LINE r3, r5, r10, r0, r11
endif_3:
  CMP r4, r12
  JZ r4, else_4
  XOR r6, r8, r12
  XOR r1, r18, r9
  JMP endif_5
else_4:
  LDI r7, 761
  LDI r14, 16
  LDI r3, 0x2EDBF3
  LDI r15, 1892
  LDI r1, 3551
  LINE r7, r14, r3, r15, r1
  LDI r12, 256
  LDI r14, 3698
  LDI r6, 0
  PSET r12, r14, r6
  LDI r7, 1256
  LDI r12, 0xB4D936
  LDI r14, 66
  WPIXEL
  LDI r18, 0xF6294A
  LDI r1, 2490
  LDI r9, 16
  WPIXEL
endif_5:
  HALT
