; conditional logic
; initialization
  LDI r0, 256
  LDI r6, 135
  LDI r5, 2464
  LDI r4, 0
  LDI r10, 4
  CMP r14, r24
  JNZ r14, else_0
  ADD r15, r0, r5
  MOD r20, r9, r2
  JMP endif_1
else_0:
  LDI r10, 128
  LDI r10, 1791
  LDI r6, 3380
  LDI r3, 2
  CIRCLE r10, r10, r6, r3
  LDI r11, 0x0E1410
  LDI r14, 4
  LDI r12, 10
  PSET r11, r14, r12
  LDI r8, 8
  LDI r9, 1
  LDI r9, 1185
  PSETI
endif_1:
  CMP r5, r7
  JZ r5, else_2
  OR r9, r0, r3
  JMP endif_3
else_2:
  LDI r21, 16
  LDI r8, 4
  LDI r9, 3505
  LDI r15, 0x62DB77
  LDI r12, 256
  LINE r21, r8, r9, r15, r12
  LDI r9, 256
  LDI r19, 4
  LDI r9, 0xD670C8
  LDI r4, 4
  LDI r10, 2080
  LINE r9, r19, r9, r4, r10
  LDI r23, 128
  LDI r5, 799
  LDI r6, 0x7BB689
  PSET r23, r5, r6
  LDI r2, 0x3D31ED
  LDI r3, 3209
  LDI r4, 0x14E13C
  WPIXEL
endif_3:
  HALT
