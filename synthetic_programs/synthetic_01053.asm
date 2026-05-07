; conditional logic
; initialization
  LDI r3, 2313
  LDI r13, 8
  LDI r7, 0x14558D
  CMP r28, r9
  JNZ r28, else_0
  MOD r15, r31, r7
  AND r8, r6, r15
  XOR r15, r29, r7
  JMP endif_1
else_0:
  LDI r10, 0x868792
  LDI r12, 0x429170
  LDI r9, 4
  PSETI
  LDI r6, 3449
  LDI r5, 138
  LDI r10, 1340
  LDI r10, 1
  LDI r2, 3540
  RECTF r6, r5, r10, r10, r2
  LDI r1, 8
  LDI r5, 0
  LDI r3, 10
  LDI r10, 0x01E242
  CIRCLE r1, r5, r3, r10
endif_1:
  CMP r2, r23
  JNZ r2, else_2
  SHR r10, r3, r5
  XOR r12, r5, r3
  JMP endif_3
else_2:
  LDI r8, 0x01B509
  LDI r4, 4010
  LDI r15, 0x7BCFF6
  LDI r13, 2
  CIRCLE r8, r4, r15, r13
endif_3:
  CMP r8, r12
  JNZ r8, else_4
  MOD r5, r15, r4
  SHL r0, r7, r6
  ADD r1, r15, r3
  AND r0, r3, r1
  JMP endif_5
else_4:
  LDI r10, 2336
  LDI r12, 531
  LDI r10, 128
  LDI r7, 0
  LDI r2, 256
  LINE r10, r12, r10, r7, r2
  LDI r5, 128
  FILL r5
endif_5:
  HALT
