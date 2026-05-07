; conditional logic
; initialization
  LDI r15, 64
  LDI r13, 681
  LDI r9, 1425
  LDI r14, 843
  LDI r6, 0x77F0D2
  LDI r0, 64
  LDI r10, 3279
  CMP r11, r2
  JZ r11, else_0
  OR r13, r26, r9
  DIV r11, r3, r6
  JMP endif_1
else_0:
  LDI r9, 0xE1048B
  LDI r13, 128
  LDI r0, 0x9708AC
  PSET r9, r13, r0
  LDI r4, 0xC7FE5B
  LDI r0, 0xA73438
  LDI r6, 16
  LDI r2, 0x69A141
  LDI r2, 2
  RECTF r4, r0, r6, r2, r2
  LDI r14, 10
  LDI r7, 32
  LDI r3, 162
  LDI r1, 0x4462B5
  LDI r6, 1
  LINE r14, r7, r3, r1, r6
  LDI r14, 3400
  LDI r27, 10
  LDI r9, 0x252591
  PSET r14, r27, r9
endif_1:
  CMP r5, r0
  JNZ r5, else_2
  SHR r9, r1, r6
  AND r0, r4, r11
  JMP endif_3
else_2:
  LDI r9, 1700
  FILL r9
  LDI r7, 2491
  LDI r14, 3612
  LDI r3, 128
  LDI r4, 3566
  CIRCLE r7, r14, r3, r4
endif_3:
  CMP r5, r11
  JZ r5, else_4
  SUB r12, r11, r7
  ADD r15, r12, r10
  ADD r0, r30, r15
  JMP endif_5
else_4:
  LDI r12, 0
  LDI r2, 0
  LDI r8, 0x2E1C62
  LDI r13, 128
  LDI r0, 0x0FD787
  LINE r12, r2, r8, r13, r0
  LDI r1, 3950
  LDI r3, 255
  LDI r4, 64
  LDI r5, 0
  CIRCLE r1, r3, r4, r5
  LDI r12, 0xEB4787
  LDI r5, 1
  LDI r6, 64
  LDI r9, 2
  LDI r2, 0xA44CF2
  RECTF r12, r5, r6, r9, r2
endif_5:
  HALT
