; conditional logic
; initialization
  LDI r14, 2347
  LDI r2, 304
  CMP r3, r14
  JZ r3, else_0
  ADD r1, r15, r6
  JMP endif_1
else_0:
  LDI r12, 1
  LDI r5, 0x2601A7
  LDI r12, 4
  PSET r12, r5, r12
  LDI r13, 2
  LDI r8, 0x41EFC5
  LDI r15, 2452
  PSETI
endif_1:
  CMP r15, r13
  JNZ r15, else_2
  MUL r4, r6, r15
  ADD r7, r2, r15
  OR r12, r6, r7
  SHL r2, r0, r13
  JMP endif_3
else_2:
  LDI r11, 0x1896C7
  LDI r1, 0xA1CCE8
  LDI r0, 3337
  PSETI
  LDI r1, 2138
  FILL r1
endif_3:
  HALT
