; conditional logic
; initialization
  LDI r14, 51
  LDI r1, 2080
  LDI r3, 1704
  LDI r2, 0x6531A3
  LDI r0, 256
  LDI r10, 2082
  LDI r12, 0
  CMP r1, r4
  JNZ r1, else_0
  SHR r2, r24, r13
  DIV r8, r10, r5
  ADD r12, r5, r9
  JMP endif_1
else_0:
  LDI r4, 1993
  LDI r12, 10
  LDI r22, 8
  LDI r10, 0xC956F7
  LDI r12, 0xB66055
  LINE r4, r12, r22, r10, r12
  LDI r3, 64
  FILL r3
  LDI r15, 2
  LDI r10, 1
  LDI r4, 0xB039D2
  PSETI
endif_1:
  CMP r9, r0
  JZ r9, else_2
  MUL r10, r6, r14
  JMP endif_3
else_2:
  LDI r10, 1353
  LDI r0, 10
  LDI r3, 0x24AC6E
  LDI r17, 0xC6CF69
  LDI r4, 1446
  LINE r10, r0, r3, r17, r4
  LDI r6, 0x5481A4
  LDI r4, 1464
  LDI r24, 0
  LDI r15, 16
  LDI r28, 2346
  RECTF r6, r4, r24, r15, r28
  LDI r15, 1178
  LDI r12, 0x6B94B9
  LDI r15, 0x3761A8
  PSET r15, r12, r15
endif_3:
  CMP r3, r11
  JNZ r3, else_4
  OR r15, r0, r1
  DIV r8, r12, r14
  JMP endif_5
else_4:
  LDI r8, 128
  LDI r8, 255
  LDI r28, 0xC56611
  PSETI
  LDI r1, 0xE051D0
  LDI r3, 0x936D6C
  LDI r15, 0x1905B4
  WPIXEL
  LDI r12, 0xEDBCE8
  LDI r20, 3
  LDI r0, 0x96E404
  PSETI
  LDI r7, 0x3AE106
  FILL r7
endif_5:
  HALT
