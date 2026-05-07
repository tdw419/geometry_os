; conditional logic
; initialization
  LDI r15, 0xDE1A0A
  LDI r12, 2358
  LDI r14, 1760
  LDI r3, 0x39C366
  LDI r10, 0x7576B7
  LDI r1, 0xFE7BEE
  CMP r6, r14
  JNZ r6, else_0
  XOR r9, r4, r11
  OR r14, r7, r3
  XOR r3, r0, r11
  SHR r1, r4, r0
  JMP endif_1
else_0:
  LDI r4, 0x9FADC0
  FILL r4
  LDI r0, 0xC1B754
  LDI r7, 2
  LDI r11, 128
  LDI r16, 1728
  LDI r7, 856
  RECTF r0, r7, r11, r16, r7
  LDI r8, 0
  LDI r6, 16
  LDI r7, 2215
  PSETI
endif_1:
  HALT
