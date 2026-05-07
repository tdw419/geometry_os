; conditional logic
; initialization
  LDI r1, 0x341F69
  LDI r3, 0xDAF446
  LDI r13, 27
  LDI r12, 186
  LDI r9, 0x84E23F
  LDI r0, 8
  CMP r15, r3
  JZ r15, else_0
  SHR r7, r12, r6
  SHL r6, r9, r8
  SHL r0, r5, r23
  JMP endif_1
else_0:
  LDI r14, 0x766DB9
  LDI r12, 3038
  LDI r11, 3173
  LDI r1, 0xEDF83D
  CIRCLE r14, r12, r11, r1
  LDI r12, 2
  LDI r12, 0x7B74B8
  LDI r11, 0xE93FB6
  PSET r12, r12, r11
  LDI r10, 32
  LDI r8, 3439
  LDI r13, 0x45954B
  LDI r4, 0x1FF227
  LDI r13, 2911
  RECTF r10, r8, r13, r4, r13
  LDI r11, 2783
  LDI r15, 64
  LDI r15, 8
  WPIXEL
endif_1:
  CMP r2, r15
  JZ r2, else_2
  MOD r18, r8, r14
  MUL r26, r12, r10
  ADD r13, r3, r5
  SUB r7, r8, r26
  JMP endif_3
else_2:
  LDI r2, 2864
  LDI r6, 2853
  LDI r13, 1400
  PSETI
endif_3:
  CMP r14, r12
  JNZ r14, else_4
  OR r5, r29, r0
  MUL r13, r6, r26
  JMP endif_5
else_4:
  LDI r15, 134
  LDI r9, 3505
  LDI r10, 32
  LDI r6, 16
  CIRCLE r15, r9, r10, r6
endif_5:
  HALT
