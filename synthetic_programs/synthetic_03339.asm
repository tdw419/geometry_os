; conditional logic
; initialization
  LDI r0, 1
  LDI r12, 0x710B79
  LDI r9, 0x45EC08
  LDI r10, 255
  LDI r2, 1
  LDI r15, 8
  LDI r8, 0x3FB738
  LDI r4, 0xFE5A12
  CMP r17, r2
  JNZ r17, else_0
  ADD r13, r14, r12
  AND r4, r0, r15
  SHR r0, r1, r3
  AND r10, r4, r0
  JMP endif_1
else_0:
  LDI r7, 2964
  LDI r13, 0x1755AE
  LDI r3, 2
  LDI r9, 3495
  CIRCLE r7, r13, r3, r9
  LDI r10, 0xFDAEE7
  LDI r9, 10
  LDI r9, 0x0034DF
  WPIXEL
  LDI r8, 0x378D12
  LDI r1, 107
  LDI r10, 256
  WPIXEL
endif_1:
  CMP r5, r1
  JZ r5, else_2
  DIV r8, r3, r13
  DIV r14, r9, r8
  JMP endif_3
else_2:
  LDI r1, 10
  LDI r8, 0x79983D
  LDI r30, 0
  WPIXEL
  LDI r1, 0
  LDI r5, 1
  LDI r15, 64
  PSETI
  LDI r9, 1012
  LDI r8, 1442
  LDI r14, 16
  PSETI
  LDI r13, 0x91C42C
  LDI r2, 2884
  LDI r14, 0xC75B75
  LDI r12, 2095
  CIRCLE r13, r2, r14, r12
endif_3:
  HALT
