; conditional logic
; initialization
  LDI r14, 619
  LDI r4, 10
  LDI r11, 0xAB5D44
  LDI r13, 1922
  CMP r9, r4
  JZ r9, else_0
  MOD r10, r14, r8
  SHL r10, r11, r15
  JMP endif_1
else_0:
  LDI r5, 128
  LDI r7, 3500
  LDI r8, 0xCAD404
  LDI r1, 4
  LDI r10, 128
  LINE r5, r7, r8, r1, r10
  LDI r2, 0xE2A939
  LDI r12, 0xC2A2BD
  LDI r1, 0xA9E50D
  PSETI
endif_1:
  CMP r22, r7
  JZ r22, else_2
  MUL r8, r9, r12
  OR r0, r12, r2
  ADD r2, r11, r10
  XOR r8, r7, r9
  JMP endif_3
else_2:
  LDI r27, 256
  LDI r14, 2059
  LDI r8, 1176
  PSET r27, r14, r8
  LDI r4, 1370
  LDI r16, 0x7E6995
  LDI r6, 0x6F0CE0
  PSETI
  LDI r3, 255
  LDI r14, 0x5D8589
  LDI r13, 10
  LDI r2, 1596
  CIRCLE r3, r14, r13, r2
  LDI r5, 2
  LDI r7, 2
  LDI r10, 0x30DAA8
  LDI r14, 10
  LDI r13, 128
  LINE r5, r7, r10, r14, r13
endif_3:
  CMP r0, r10
  JNZ r0, else_4
  MOD r13, r6, r14
  SHL r15, r22, r5
  XOR r8, r0, r11
  JMP endif_5
else_4:
  LDI r2, 0x372E25
  LDI r1, 2709
  LDI r15, 2323
  LDI r3, 1
  LDI r8, 128
  LINE r2, r1, r15, r3, r8
  LDI r5, 586
  LDI r1, 995
  LDI r11, 846
  LDI r11, 3993
  LDI r3, 8
  LINE r5, r1, r11, r11, r3
endif_5:
  HALT
