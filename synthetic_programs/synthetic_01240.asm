; conditional logic
; initialization
  LDI r13, 2786
  LDI r8, 3485
  LDI r7, 0xC61CE4
  LDI r20, 2410
  LDI r15, 1157
  CMP r10, r15
  JZ r10, else_0
  AND r3, r4, r5
  XOR r4, r1, r7
  ADD r6, r15, r8
  SUB r21, r13, r11
  JMP endif_1
else_0:
  LDI r10, 2551
  LDI r28, 128
  LDI r14, 1788
  PSET r10, r28, r14
endif_1:
  CMP r3, r11
  JNZ r3, else_2
  SHL r11, r0, r6
  ADD r8, r11, r9
  MUL r8, r2, r11
  AND r15, r6, r4
  JMP endif_3
else_2:
  LDI r11, 0x17D9F8
  FILL r11
  LDI r5, 1382
  LDI r13, 3846
  LDI r14, 3685
  WPIXEL
  LDI r5, 0x9ED844
  LDI r9, 0xCF2729
  LDI r9, 0xBAE951
  LDI r2, 2802
  CIRCLE r5, r9, r9, r2
endif_3:
  HALT
