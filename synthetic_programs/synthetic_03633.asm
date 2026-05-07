; conditional logic
; initialization
  LDI r3, 938
  LDI r2, 128
  CMP r11, r3
  JNZ r11, else_0
  AND r3, r15, r2
  JMP endif_1
else_0:
  LDI r13, 0x3EAE3F
  LDI r0, 32
  LDI r14, 2
  LDI r6, 2006
  LDI r15, 469
  LINE r13, r0, r14, r6, r15
  LDI r31, 64
  LDI r5, 0x4916A5
  LDI r13, 0xF7D7CC
  LDI r1, 2173
  LDI r2, 85
  RECTF r31, r5, r13, r1, r2
endif_1:
  HALT
