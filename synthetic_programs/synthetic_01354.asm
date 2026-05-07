; conditional logic
; initialization
  LDI r4, 1577
  LDI r20, 255
  LDI r6, 32
  LDI r13, 1393
  LDI r15, 64
  LDI r0, 79
  LDI r8, 2601
  LDI r10, 3218
  CMP r25, r8
  JNZ r25, else_0
  MOD r10, r5, r14
  MOD r6, r30, r9
  MOD r10, r0, r9
  JMP endif_1
else_0:
  LDI r14, 0xD61053
  LDI r9, 1420
  LDI r7, 3325
  LDI r3, 928
  CIRCLE r14, r9, r7, r3
  LDI r13, 0x19CB25
  LDI r7, 0xEB840B
  LDI r7, 255
  LDI r3, 8
  LDI r4, 255
  LINE r13, r7, r7, r3, r4
endif_1:
  CMP r12, r4
  JNZ r12, else_2
  OR r8, r10, r12
  SUB r7, r13, r15
  OR r2, r5, r12
  MUL r9, r10, r12
  JMP endif_3
else_2:
  LDI r3, 3792
  LDI r11, 0x3112F5
  LDI r0, 2409
  LDI r11, 1734
  LDI r12, 4
  RECTF r3, r11, r0, r11, r12
endif_3:
  HALT
