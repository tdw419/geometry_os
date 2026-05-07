; mixed program
; initialization
  LDI r2, 0
  LDI r12, 3474
  CMP r12, r1
  JNZ r12, else_0
  AND r13, r9, r15
  DIV r12, r9, r10
  JMP endif_1
else_0:
  LDI r10, 1422
  LDI r1, 0x817C79
  LDI r3, 0x082B54
  PSET r10, r1, r3
endif_1:
  PUSH r4
  PUSH r4
  PUSH r11
  MOD r3, r1, r7
  SHL r13, r10, r5
  ADD r13, r7, r2
  ADD r1, r13, r9
  DIV r7, r6, r5
  POP r11
  POP r4
  POP r4
  LDI r4, 3550
  LDI r15, 0x8DDD75
  LDI r9, 0xCB609F
  PSET r4, r15, r9
  LDI r1, 4
  LDI r3, 255
  LDI r12, 2921
  LDI r5, 255
  LDI r7, 3624
  RECTF r1, r3, r12, r5, r7
  LDI r7, 0
loop_2:
  CMPI r3, r9, 0
  CMPI r1, r2, 32
  LDI r9, 1
  SUB r7, r7, r9
  JNZ r7, loop_2
  CMP r3, r7
  JZ r3, else_3
  SHR r24, r14, r11
  JMP endif_4
else_3:
  LDI r9, 1613
  LDI r7, 0xE1FD1E
  LDI r3, 2403
  WPIXEL
endif_4:
  HALT
