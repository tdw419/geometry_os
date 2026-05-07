; conditional logic
; initialization
  LDI r13, 0x54C9E9
  LDI r1, 1555
  LDI r18, 3194
  LDI r12, 0x9CAA92
  LDI r0, 256
  CMP r15, r3
  JNZ r15, else_0
  MUL r4, r10, r8
  SUB r0, r9, r8
  JMP endif_1
else_0:
  LDI r6, 10
  FILL r6
  LDI r9, 4
  LDI r4, 10
  LDI r8, 64
  LDI r0, 3653
  CIRCLE r9, r4, r8, r0
endif_1:
  CMP r2, r8
  JNZ r2, else_2
  SHR r0, r14, r5
  MOD r14, r15, r9
  AND r15, r1, r10
  JMP endif_3
else_2:
  LDI r2, 0
  LDI r5, 1535
  LDI r14, 64
  LDI r2, 2369
  CIRCLE r2, r5, r14, r2
endif_3:
  HALT
