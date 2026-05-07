; conditional logic
; initialization
  LDI r3, 0xD0F744
  LDI r0, 255
  LDI r12, 700
  LDI r2, 0x0D1C8F
  CMP r14, r1
  JZ r14, else_0
  OR r15, r9, r13
  SUB r27, r8, r12
  OR r8, r6, r5
  JMP endif_1
else_0:
  LDI r15, 0x2C8BFA
  LDI r15, 8
  LDI r6, 16
  PSETI
  LDI r7, 64
  LDI r2, 256
  LDI r2, 2778
  LDI r14, 2
  LDI r9, 2
  LINE r7, r2, r2, r14, r9
  LDI r13, 16
  LDI r11, 552
  LDI r3, 64
  LDI r11, 1
  LDI r5, 2098
  LINE r13, r11, r3, r11, r5
  LDI r4, 2378
  LDI r3, 0xC4ABD9
  LDI r6, 2018
  PSETI
endif_1:
  HALT
