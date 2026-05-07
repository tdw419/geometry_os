; conditional logic
; initialization
  LDI r11, 3964
  LDI r9, 1
  LDI r8, 10
  LDI r7, 2961
  CMP r9, r8
  JZ r9, else_0
  MUL r12, r5, r1
  AND r6, r8, r12
  MUL r18, r7, r14
  JMP endif_1
else_0:
  LDI r8, 0xDE294D
  LDI r1, 0xD1B447
  LDI r7, 4
  PSETI
  LDI r7, 0
  LDI r6, 3771
  LDI r15, 4
  PSETI
  LDI r23, 0x2ECBA6
  LDI r6, 8
  LDI r7, 409
  PSET r23, r6, r7
  LDI r0, 0x713038
  LDI r13, 0x3DB106
  LDI r11, 0xEAB77F
  LDI r9, 3593
  CIRCLE r0, r13, r11, r9
endif_1:
  CMP r0, r1
  JZ r0, else_2
  OR r12, r15, r14
  MUL r2, r4, r1
  MOD r14, r3, r2
  SUB r3, r0, r14
  JMP endif_3
else_2:
  LDI r10, 16
  LDI r4, 0xA1AFEB
  LDI r13, 64
  PSETI
  LDI r4, 10
  LDI r30, 0x29C1A7
  LDI r14, 931
  LDI r10, 490
  CIRCLE r4, r30, r14, r10
endif_3:
  HALT
