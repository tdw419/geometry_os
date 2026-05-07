; conditional logic
; initialization
  LDI r0, 1456
  LDI r4, 984
  LDI r9, 988
  LDI r14, 1655
  LDI r3, 3926
  LDI r10, 256
  LDI r8, 1246
  LDI r1, 0x3DD45A
  CMP r4, r15
  JZ r4, else_0
  MOD r6, r13, r2
  SHR r1, r15, r4
  XOR r14, r11, r7
  AND r7, r12, r14
  JMP endif_1
else_0:
  LDI r13, 64
  LDI r15, 4
  LDI r2, 0xC0A9BD
  WPIXEL
  LDI r1, 0x351C67
  LDI r11, 1133
  LDI r2, 0xC5D8F2
  PSETI
endif_1:
  CMP r5, r12
  JNZ r5, else_2
  SUB r7, r11, r5
  OR r13, r2, r1
  ADD r0, r15, r5
  MOD r11, r1, r25
  JMP endif_3
else_2:
  LDI r0, 32
  LDI r7, 8
  LDI r23, 2900
  LDI r9, 1076
  LDI r20, 1067
  LINE r0, r7, r23, r9, r20
  LDI r1, 1758
  LDI r4, 64
  LDI r10, 64
  WPIXEL
endif_3:
  HALT
