; conditional logic
; initialization
  LDI r15, 1947
  LDI r1, 0xE87287
  LDI r12, 208
  LDI r5, 0x5286EF
  CMP r1, r5
  JNZ r1, else_0
  XOR r3, r14, r6
  MOD r7, r1, r8
  AND r11, r7, r8
  XOR r11, r4, r13
  JMP endif_1
else_0:
  LDI r9, 0x900413
  LDI r1, 0xFFF960
  LDI r5, 0xAAAAD5
  LDI r11, 0x8FA10F
  CIRCLE r9, r1, r5, r11
  LDI r4, 3714
  FILL r4
endif_1:
  HALT
