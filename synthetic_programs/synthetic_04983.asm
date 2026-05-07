; conditional logic
; initialization
  LDI r2, 3514
  LDI r13, 0xE9F343
  LDI r4, 2873
  LDI r15, 283
  LDI r0, 2451
  LDI r11, 403
  LDI r10, 0xAF44D3
  LDI r14, 0x6F88CD
  CMP r5, r13
  JNZ r5, else_0
  AND r14, r0, r23
  ADD r8, r13, r5
  ADD r14, r10, r15
  JMP endif_1
else_0:
  LDI r11, 2937
  LDI r13, 3758
  LDI r8, 2288
  PSET r11, r13, r8
  LDI r10, 64
  LDI r31, 128
  LDI r3, 1005
  LDI r3, 32
  CIRCLE r10, r31, r3, r3
endif_1:
  HALT
