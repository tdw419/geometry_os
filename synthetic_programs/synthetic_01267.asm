; conditional logic
; initialization
  LDI r15, 256
  LDI r10, 4
  LDI r8, 64
  CMP r9, r29
  JZ r9, else_0
  MUL r3, r15, r5
  OR r3, r11, r13
  OR r7, r14, r15
  OR r1, r5, r18
  JMP endif_1
else_0:
  LDI r8, 2124
  FILL r8
  LDI r7, 8
  LDI r4, 3056
  LDI r13, 64
  LDI r5, 1
  LDI r11, 1458
  LINE r7, r4, r13, r5, r11
  LDI r1, 427
  LDI r4, 480
  LDI r15, 0x823370
  LDI r0, 255
  LDI r0, 1
  LINE r1, r4, r15, r0, r0
endif_1:
  CMP r11, r0
  JNZ r11, else_2
  MUL r8, r6, r0
  ADD r1, r2, r8
  JMP endif_3
else_2:
  LDI r2, 0x104AE1
  LDI r29, 1949
  LDI r11, 32
  PSET r2, r29, r11
  LDI r6, 1046
  LDI r17, 776
  LDI r11, 15
  LDI r1, 16
  LDI r10, 3271
  LINE r6, r17, r11, r1, r10
endif_3:
  HALT
