; conditional logic
; initialization
  LDI r4, 3622
  LDI r6, 0xF71152
  LDI r8, 0x2AE624
  LDI r5, 0x7227DB
  LDI r1, 3440
  LDI r11, 64
  LDI r12, 0
  CMP r15, r1
  JZ r15, else_0
  SHL r12, r1, r15
  JMP endif_1
else_0:
  LDI r0, 4
  FILL r0
  LDI r12, 3573
  LDI r15, 32
  LDI r2, 16
  LDI r8, 4
  CIRCLE r12, r15, r2, r8
  LDI r3, 3985
  FILL r3
  LDI r6, 1201
  LDI r2, 1
  LDI r11, 3782
  PSET r6, r2, r11
endif_1:
  CMP r1, r14
  JNZ r1, else_2
  MOD r7, r12, r0
  OR r13, r11, r14
  MOD r4, r0, r14
  JMP endif_3
else_2:
  LDI r15, 16
  LDI r10, 4002
  LDI r9, 8
  WPIXEL
  LDI r3, 0
  LDI r8, 0xB27538
  LDI r2, 1
  PSET r3, r8, r2
  LDI r18, 0x157CC9
  LDI r10, 0xFDC6C0
  LDI r2, 16
  PSET r18, r10, r2
endif_3:
  CMP r10, r14
  JNZ r10, else_4
  ADD r2, r10, r6
  JMP endif_5
else_4:
  LDI r8, 0x7EDD01
  FILL r8
  LDI r12, 1948
  LDI r3, 0x2E3E16
  LDI r6, 4
  LDI r6, 0
  LDI r11, 1648
  RECTF r12, r3, r6, r6, r11
  LDI r2, 32
  LDI r13, 4
  LDI r2, 2151
  LDI r12, 0x612A0D
  LDI r7, 3891
  RECTF r2, r13, r2, r12, r7
endif_5:
  HALT
