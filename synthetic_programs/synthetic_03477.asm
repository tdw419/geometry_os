; conditional logic
; initialization
  LDI r7, 0x3BB101
  LDI r12, 0xA39F89
  LDI r0, 16
  LDI r21, 290
  CMP r8, r6
  JZ r8, else_0
  SHR r10, r1, r2
  MOD r11, r3, r12
  JMP endif_1
else_0:
  LDI r4, 108
  LDI r13, 0xFBFDCE
  LDI r13, 551
  LDI r11, 16
  CIRCLE r4, r13, r13, r11
  LDI r13, 126
  LDI r1, 0x1BE577
  LDI r11, 3488
  PSET r13, r1, r11
  LDI r2, 8
  LDI r12, 0x7181AC
  LDI r6, 3023
  PSETI
  LDI r8, 0xBA861B
  LDI r21, 1363
  LDI r12, 3602
  LDI r10, 2307
  LDI r15, 752
  RECTF r8, r21, r12, r10, r15
endif_1:
  CMP r14, r5
  JZ r14, else_2
  ADD r12, r6, r10
  ADD r0, r4, r14
  SUB r4, r24, r9
  JMP endif_3
else_2:
  LDI r11, 16
  LDI r10, 203
  LDI r9, 0xE44CF4
  PSET r11, r10, r9
  LDI r1, 255
  LDI r5, 0
  LDI r7, 499
  PSETI
  LDI r15, 0xAE3A8E
  LDI r13, 1
  LDI r4, 128
  PSET r15, r13, r4
  LDI r8, 128
  LDI r8, 0x0DC990
  LDI r8, 2
  PSETI
endif_3:
  HALT
