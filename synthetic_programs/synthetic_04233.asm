; conditional logic
; initialization
  LDI r4, 3455
  LDI r11, 668
  LDI r9, 8
  LDI r12, 128
  CMP r3, r9
  JZ r3, else_0
  MOD r14, r7, r8
  AND r5, r15, r10
  JMP endif_1
else_0:
  LDI r11, 0xE282D7
  LDI r9, 1
  LDI r0, 16
  LDI r5, 0x921A44
  LDI r14, 256
  RECTF r11, r9, r0, r5, r14
  LDI r0, 0x5AA520
  LDI r7, 452
  LDI r4, 0
  LDI r4, 0x076237
  CIRCLE r0, r7, r4, r4
  LDI r7, 0x5EFC40
  LDI r7, 0x15A03C
  LDI r15, 2039
  LDI r3, 128
  LDI r30, 3186
  LINE r7, r7, r15, r3, r30
endif_1:
  HALT
