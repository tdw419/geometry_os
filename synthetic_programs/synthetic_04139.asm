; conditional logic
; initialization
  LDI r7, 3549
  LDI r12, 3646
  CMP r8, r9
  JNZ r8, else_0
  SHL r11, r14, r5
  SHL r12, r14, r15
  AND r6, r5, r11
  MOD r12, r29, r2
  JMP endif_1
else_0:
  LDI r9, 0xB32547
  FILL r9
  LDI r0, 0
  LDI r12, 3454
  LDI r2, 2244
  PSETI
  LDI r9, 0x4F74E2
  LDI r7, 32
  LDI r3, 4
  LDI r30, 1780
  LDI r3, 255
  LINE r9, r7, r3, r30, r3
endif_1:
  HALT
