; conditional logic
; initialization
  LDI r8, 2241
  LDI r2, 256
  LDI r7, 256
  LDI r11, 0xBF4B9F
  LDI r3, 0x5B2F2F
  CMP r7, r6
  JNZ r7, else_0
  DIV r4, r3, r27
  JMP endif_1
else_0:
  LDI r15, 0x6E3BDD
  LDI r10, 0x551438
  LDI r15, 4042
  PSETI
  LDI r9, 0xB3EE3C
  LDI r10, 1981
  LDI r5, 4
  LDI r11, 255
  LDI r7, 3331
  RECTF r9, r10, r5, r11, r7
  LDI r3, 1701
  FILL r3
endif_1:
  CMP r5, r11
  JZ r5, else_2
  SUB r11, r2, r0
  SHR r3, r11, r26
  OR r10, r1, r5
  JMP endif_3
else_2:
  LDI r1, 10
  LDI r13, 1760
  LDI r10, 0x39C6E3
  LDI r7, 0xA1E88D
  LDI r3, 1795
  LINE r1, r13, r10, r7, r3
  LDI r10, 711
  LDI r7, 0
  LDI r1, 2285
  LDI r1, 1141
  LDI r9, 0
  RECTF r10, r7, r1, r1, r9
endif_3:
  HALT
