; conditional logic
; initialization
  LDI r9, 1
  LDI r15, 255
  CMP r9, r14
  JZ r9, else_0
  AND r6, r18, r4
  JMP endif_1
else_0:
  LDI r14, 17
  LDI r15, 1
  LDI r4, 1646
  PSETI
  LDI r10, 2
  LDI r1, 1150
  LDI r10, 0xACD557
  PSETI
endif_1:
  HALT
