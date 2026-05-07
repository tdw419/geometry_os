; conditional logic
; initialization
  LDI r3, 2226
  LDI r4, 3476
  LDI r0, 8
  LDI r5, 3462
  LDI r12, 1223
  CMP r9, r11
  JNZ r9, else_0
  AND r9, r4, r22
  SHR r14, r4, r6
  AND r12, r14, r11
  JMP endif_1
else_0:
  LDI r15, 0xC4D973
  LDI r10, 3695
  LDI r7, 0x448CC0
  LDI r10, 0x98EFCE
  LDI r20, 2946
  RECTF r15, r10, r7, r10, r20
  LDI r6, 308
  LDI r0, 0x05AE23
  LDI r22, 0x94D12F
  WPIXEL
  LDI r8, 871
  FILL r8
endif_1:
  CMP r13, r1
  JNZ r13, else_2
  SHR r11, r5, r12
  JMP endif_3
else_2:
  LDI r10, 3045
  LDI r1, 1
  LDI r5, 256
  LDI r20, 1687
  LDI r7, 128
  RECTF r10, r1, r5, r20, r7
  LDI r4, 32
  LDI r7, 0
  LDI r12, 2258
  LDI r6, 1850
  CIRCLE r4, r7, r12, r6
  LDI r3, 3999
  LDI r6, 3704
  LDI r15, 1
  LDI r3, 0x7C8454
  LDI r4, 0x188463
  LINE r3, r6, r15, r3, r4
  LDI r12, 574
  LDI r8, 2118
  LDI r10, 0x05174F
  PSET r12, r8, r10
endif_3:
  HALT
