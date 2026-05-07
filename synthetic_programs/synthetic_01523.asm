; conditional logic
; initialization
  LDI r13, 2676
  LDI r10, 0x9B10AE
  LDI r14, 3464
  LDI r11, 256
  LDI r5, 2371
  LDI r2, 0x5042BB
  LDI r8, 133
  CMP r11, r2
  JNZ r11, else_0
  MUL r5, r13, r14
  XOR r4, r13, r24
  ADD r7, r4, r0
  JMP endif_1
else_0:
  LDI r5, 32
  FILL r5
  LDI r25, 255
  LDI r9, 2921
  LDI r3, 64
  LDI r8, 32
  LDI r11, 1016
  LINE r25, r9, r3, r8, r11
endif_1:
  CMP r10, r1
  JZ r10, else_2
  SHR r13, r8, r17
  ADD r1, r2, r11
  SHL r14, r5, r3
  JMP endif_3
else_2:
  LDI r5, 0xC31D9D
  LDI r14, 551
  LDI r12, 0x2910EA
  PSETI
  LDI r13, 255
  LDI r5, 550
  LDI r10, 16
  PSETI
  LDI r3, 0x62509E
  LDI r6, 8
  LDI r14, 16
  LDI r6, 0xFE82F9
  LDI r6, 0x10FE3A
  RECTF r3, r6, r14, r6, r6
endif_3:
  HALT
