; conditional logic
; initialization
  LDI r8, 2374
  LDI r6, 16
  LDI r11, 16
  LDI r12, 4056
  LDI r15, 10
  LDI r27, 255
  LDI r29, 3843
  LDI r7, 0x0796ED
  CMP r7, r13
  JNZ r7, else_0
  AND r12, r11, r10
  SHL r14, r7, r8
  AND r12, r14, r6
  JMP endif_1
else_0:
  LDI r10, 2203
  LDI r9, 2099
  LDI r2, 2593
  PSET r10, r9, r2
  LDI r2, 1866
  FILL r2
  LDI r13, 0x62D174
  LDI r5, 173
  LDI r10, 38
  LDI r0, 955
  LDI r6, 0xCB4500
  LINE r13, r5, r10, r0, r6
  LDI r2, 8
  LDI r11, 0xA49B39
  LDI r13, 8
  PSET r2, r11, r13
endif_1:
  CMP r10, r13
  JZ r10, else_2
  SHL r13, r20, r30
  MOD r3, r14, r17
  SUB r10, r2, r12
  JMP endif_3
else_2:
  LDI r10, 4001
  LDI r13, 256
  LDI r11, 2351
  LDI r20, 0xA6A141
  LDI r5, 2595
  RECTF r10, r13, r11, r20, r5
  LDI r5, 389
  LDI r0, 2179
  LDI r7, 0x5C7290
  WPIXEL
  LDI r11, 32
  LDI r3, 2675
  LDI r10, 0x6AF038
  LDI r13, 2334
  LDI r13, 149
  RECTF r11, r3, r10, r13, r13
  LDI r15, 0x6F41E5
  LDI r2, 3874
  LDI r11, 0x9D9E07
  LDI r7, 4
  CIRCLE r15, r2, r11, r7
endif_3:
  CMP r2, r15
  JNZ r2, else_4
  SHL r3, r15, r9
  SUB r1, r3, r11
  MOD r11, r4, r8
  OR r15, r3, r13
  JMP endif_5
else_4:
  LDI r25, 16
  LDI r5, 0x9D3682
  LDI r2, 1
  LDI r7, 0x789A3F
  LDI r17, 0xE1B0DB
  LINE r25, r5, r2, r7, r17
  LDI r10, 256
  FILL r10
endif_5:
  HALT
