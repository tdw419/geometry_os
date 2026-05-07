; conditional logic
; initialization
  LDI r0, 1666
  LDI r7, 0x8B5EF2
  LDI r2, 0x763AF7
  LDI r14, 973
  LDI r12, 0x5AB48D
  CMP r21, r6
  JNZ r21, else_0
  OR r6, r4, r15
  DIV r0, r2, r12
  MOD r12, r0, r14
  JMP endif_1
else_0:
  LDI r20, 1819
  FILL r20
endif_1:
  CMP r7, r5
  JZ r7, else_2
  ADD r3, r14, r31
  AND r14, r15, r2
  JMP endif_3
else_2:
  LDI r20, 256
  LDI r14, 244
  LDI r5, 1864
  PSET r20, r14, r5
  LDI r12, 0x38BC0B
  FILL r12
  LDI r10, 0xB6365C
  LDI r12, 3133
  LDI r9, 0x6D9CC8
  PSETI
  LDI r21, 1470
  LDI r8, 4
  LDI r15, 32
  LDI r8, 0xB6D589
  CIRCLE r21, r8, r15, r8
endif_3:
  CMP r2, r1
  JZ r2, else_4
  SUB r30, r3, r4
  SUB r13, r7, r12
  JMP endif_5
else_4:
  LDI r13, 0xCEE14C
  LDI r22, 3156
  LDI r6, 64
  LDI r9, 128
  CIRCLE r13, r22, r6, r9
endif_5:
  HALT
