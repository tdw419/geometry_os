; conditional logic
; initialization
  LDI r21, 4
  LDI r9, 2590
  CMP r10, r12
  JZ r10, else_0
  MOD r3, r5, r4
  OR r2, r3, r16
  SHL r15, r10, r5
  JMP endif_1
else_0:
  LDI r8, 3639
  LDI r21, 3836
  LDI r0, 246
  PSETI
endif_1:
  HALT
