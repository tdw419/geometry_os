; conditional logic
; initialization
  LDI r15, 0x5262D3
  LDI r2, 0xCEE791
  LDI r13, 0xFDBCA1
  LDI r0, 0xAA499A
  LDI r10, 1055
  CMP r5, r6
  JZ r5, else_0
  AND r14, r10, r6
  SHL r8, r10, r15
  MOD r15, r19, r14
  JMP endif_1
else_0:
  LDI r23, 1
  LDI r2, 0
  LDI r5, 16
  PSETI
endif_1:
  HALT
