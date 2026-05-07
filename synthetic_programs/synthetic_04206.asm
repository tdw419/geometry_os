; conditional logic
; initialization
  LDI r7, 8
  LDI r4, 1213
  LDI r9, 255
  LDI r13, 3952
  LDI r8, 931
  LDI r3, 318
  CMP r2, r9
  JZ r2, else_0
  MUL r4, r6, r10
  JMP endif_1
else_0:
  LDI r8, 2872
  LDI r2, 0
  LDI r14, 0x117053
  WPIXEL
endif_1:
  CMP r9, r4
  JNZ r9, else_2
  ADD r4, r7, r15
  ADD r9, r12, r19
  ADD r15, r5, r4
  MOD r12, r15, r23
  JMP endif_3
else_2:
  LDI r12, 10
  LDI r7, 32
  LDI r3, 256
  PSETI
  LDI r4, 158
  LDI r8, 3481
  LDI r14, 2723
  PSET r4, r8, r14
endif_3:
  HALT
