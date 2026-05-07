; conditional logic
; initialization
  LDI r3, 2
  LDI r4, 255
  CMP r13, r28
  JNZ r13, else_0
  SHR r4, r0, r12
  OR r10, r11, r13
  XOR r9, r8, r24
  JMP endif_1
else_0:
  LDI r11, 0x40056C
  LDI r4, 1663
  LDI r1, 10
  PSETI
  LDI r2, 0x606081
  LDI r15, 2401
  LDI r11, 1
  LDI r10, 1845
  LDI r4, 650
  LINE r2, r15, r11, r10, r4
endif_1:
  CMP r1, r5
  JZ r1, else_2
  SHR r9, r15, r13
  JMP endif_3
else_2:
  LDI r7, 0x618DBD
  LDI r12, 1
  LDI r2, 3659
  LDI r1, 557
  LDI r5, 3900
  LINE r7, r12, r2, r1, r5
  LDI r2, 0xE32FCE
  LDI r1, 2898
  LDI r2, 255
  PSETI
  LDI r1, 0x237697
  LDI r2, 0xCE65F9
  LDI r4, 8
  WPIXEL
  LDI r3, 1106
  FILL r3
endif_3:
  CMP r7, r0
  JNZ r7, else_4
  XOR r9, r8, r0
  JMP endif_5
else_4:
  LDI r14, 10
  LDI r14, 4
  LDI r29, 2636
  WPIXEL
  LDI r15, 0xB5A304
  LDI r11, 2541
  LDI r26, 765
  LDI r3, 1
  LDI r7, 2026
  RECTF r15, r11, r26, r3, r7
  LDI r15, 3268
  LDI r4, 255
  LDI r4, 0xF9E4B9
  WPIXEL
  LDI r4, 0x91EF9B
  LDI r15, 2694
  LDI r2, 335
  LDI r7, 0x1835E6
  LDI r14, 10
  RECTF r4, r15, r2, r7, r14
endif_5:
  HALT
