; conditional logic
; initialization
  LDI r4, 43
  LDI r14, 4025
  LDI r11, 945
  LDI r10, 0x9899BD
  CMP r12, r7
  JNZ r12, else_0
  AND r11, r7, r9
  JMP endif_1
else_0:
  LDI r11, 2749
  FILL r11
  LDI r8, 4076
  FILL r8
  LDI r8, 2963
  LDI r0, 1721
  LDI r14, 0x61BE6F
  PSET r8, r0, r14
  LDI r6, 0x237FB8
  LDI r2, 4
  LDI r0, 4051
  LDI r1, 0x5C4EA8
  LDI r3, 0x968A5F
  RECTF r6, r2, r0, r1, r3
endif_1:
  HALT
