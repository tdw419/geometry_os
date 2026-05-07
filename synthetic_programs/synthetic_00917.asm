; conditional logic
; initialization
  LDI r2, 538
  LDI r19, 256
  LDI r1, 255
  LDI r12, 3639
  LDI r14, 1
  LDI r9, 16
  CMP r4, r0
  JZ r4, else_0
  MOD r13, r6, r8
  AND r10, r1, r2
  SUB r7, r10, r9
  SHR r8, r3, r0
  JMP endif_1
else_0:
  LDI r11, 468
  LDI r11, 3505
  LDI r11, 4034
  PSET r11, r11, r11
endif_1:
  HALT
