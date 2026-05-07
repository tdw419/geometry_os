; conditional logic
; initialization
  LDI r3, 1221
  LDI r5, 32
  CMP r6, r8
  JNZ r6, else_0
  MOD r3, r13, r2
  JMP endif_1
else_0:
  LDI r0, 0xCFB98E
  LDI r3, 2483
  LDI r10, 4026
  LDI r11, 1237
  CIRCLE r0, r3, r10, r11
  LDI r1, 10
  LDI r1, 1582
  LDI r10, 1754
  LDI r3, 0xB3AAB3
  CIRCLE r1, r1, r10, r3
  LDI r8, 0xF5B67A
  FILL r8
endif_1:
  HALT
