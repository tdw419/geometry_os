; conditional logic
; initialization
  LDI r3, 4
  LDI r2, 0x0F0655
  LDI r0, 0x2E9326
  LDI r5, 0
  LDI r15, 0x5FD6F4
  LDI r13, 1909
  LDI r22, 0xD41861
  CMP r6, r2
  JNZ r6, else_0
  SHR r12, r11, r15
  JMP endif_1
else_0:
  LDI r9, 0x78FB82
  FILL r9
  LDI r6, 0xA1841A
  LDI r9, 0xEDB742
  LDI r13, 3226
  PSET r6, r9, r13
endif_1:
  CMP r14, r6
  JNZ r14, else_2
  AND r12, r4, r11
  JMP endif_3
else_2:
  LDI r4, 16
  LDI r3, 3731
  LDI r4, 0x91705B
  PSETI
  LDI r0, 1732
  LDI r1, 255
  LDI r11, 0xFC63E2
  WPIXEL
  LDI r9, 8
  LDI r2, 681
  LDI r8, 0x2F55D7
  LDI r13, 2640
  CIRCLE r9, r2, r8, r13
  LDI r5, 0xDFD76E
  LDI r0, 75
  LDI r8, 0xEA0031
  PSETI
endif_3:
  HALT
