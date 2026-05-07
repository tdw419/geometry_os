; conditional logic
; initialization
  LDI r4, 0x5F081E
  LDI r7, 0x911ECE
  LDI r9, 0x3CCF7A
  LDI r8, 0xCA8ABF
  LDI r13, 3866
  CMP r4, r14
  JNZ r4, else_0
  ADD r19, r0, r8
  JMP endif_1
else_0:
  LDI r8, 3468
  LDI r0, 1
  LDI r1, 58
  LDI r5, 0xE2E1BF
  LDI r6, 594
  LINE r8, r0, r1, r5, r6
  LDI r5, 0
  LDI r0, 3810
  LDI r10, 128
  LDI r15, 0x92A486
  CIRCLE r5, r0, r10, r15
  LDI r5, 2654
  LDI r20, 0
  LDI r11, 1
  LDI r7, 0x3A6BEB
  LDI r7, 256
  RECTF r5, r20, r11, r7, r7
  LDI r5, 0xE3850A
  LDI r4, 0xA789F8
  LDI r14, 0xE6FCD6
  LDI r15, 0x7BF9D9
  CIRCLE r5, r4, r14, r15
endif_1:
  CMP r12, r9
  JNZ r12, else_2
  MOD r1, r3, r7
  AND r3, r12, r9
  OR r4, r1, r9
  JMP endif_3
else_2:
  LDI r14, 1559
  LDI r0, 0x4D2942
  LDI r11, 0x638A6F
  LDI r9, 0xC6D2D4
  LDI r19, 0x329586
  LINE r14, r0, r11, r9, r19
endif_3:
  HALT
