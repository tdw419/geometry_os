; conditional logic
; initialization
  LDI r0, 0x7D690F
  LDI r5, 256
  LDI r9, 64
  LDI r7, 0xC0CF07
  LDI r15, 64
  CMP r5, r13
  JNZ r5, else_0
  AND r3, r25, r14
  MOD r9, r1, r15
  JMP endif_1
else_0:
  LDI r2, 0xFC74C1
  LDI r15, 0x5F764B
  LDI r5, 3281
  WPIXEL
endif_1:
  HALT
