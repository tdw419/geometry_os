; mixed program
; initialization
  LDI r9, 0x314702
  LDI r14, 0x976544
  LDI r6, 10
  SHLI r27, r0, 0xB0B0BA
  SAR r14, r1, r9
  CALL func_0
func_0:
  MOD r2, r11, r13
  MUL r28, r1, r5
  MUL r5, r13, r4
  SUB r3, r13, r23
  RET
  CMP r5, r6
  JZ r5, else_1
  MOD r10, r14, r2
  OR r6, r13, r9
  OR r1, r6, r11
  SHL r6, r4, r14
  JMP endif_2
else_1:
  LDI r12, 2093
  LDI r1, 560
  LDI r29, 16
  PSET r12, r1, r29
  LDI r14, 3309
  LDI r4, 586
  LDI r3, 0x3C9BB9
  WPIXEL
endif_2:
  CMP r3, r11
  JNZ r3, else_3
  ADD r5, r14, r11
  SHR r7, r1, r5
  JMP endif_4
else_3:
  LDI r6, 0
  LDI r10, 0xC96696
  LDI r15, 10
  LDI r13, 3426
  LDI r5, 255
  RECTF r6, r10, r15, r13, r5
  LDI r2, 2
  LDI r7, 2
  LDI r6, 3653
  LDI r9, 4
  CIRCLE r2, r7, r6, r9
endif_4:
  SHR r10, r4, r2
  SHL r3, r6, r5
  HALT
