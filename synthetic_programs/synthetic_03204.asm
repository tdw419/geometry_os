; conditional logic
; initialization
  LDI r5, 3914
  LDI r15, 9
  CMP r13, r0
  JZ r13, else_0
  XOR r10, r5, r9
  SHR r19, r11, r8
  OR r14, r3, r9
  SHR r10, r11, r4
  JMP endif_1
else_0:
  LDI r4, 1290
  LDI r3, 255
  LDI r12, 255
  LDI r9, 639
  LDI r7, 3533
  RECTF r4, r3, r12, r9, r7
  LDI r11, 0x4588C1
  LDI r10, 2
  LDI r10, 796
  PSET r11, r10, r10
  LDI r5, 0x1C3F0C
  LDI r12, 255
  LDI r8, 0x823A97
  LDI r14, 10
  CIRCLE r5, r12, r8, r14
endif_1:
  CMP r1, r9
  JNZ r1, else_2
  SHR r9, r7, r5
  SUB r4, r25, r3
  ADD r9, r6, r11
  JMP endif_3
else_2:
  LDI r2, 0x4CFE63
  LDI r13, 0x20FCA1
  LDI r1, 862
  LDI r0, 1147
  CIRCLE r2, r13, r1, r0
  LDI r2, 1964
  LDI r0, 1
  LDI r7, 0x8118A1
  WPIXEL
  LDI r27, 0x0E9AD8
  LDI r10, 32
  LDI r0, 2
  PSET r27, r10, r0
  LDI r7, 0xE3441E
  LDI r12, 16
  LDI r12, 3320
  PSETI
endif_3:
  HALT
