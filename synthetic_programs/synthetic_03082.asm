; conditional logic
; initialization
  LDI r2, 0x15CDFE
  LDI r4, 525
  LDI r3, 3665
  LDI r14, 0xD9DD80
  LDI r19, 3944
  LDI r7, 2
  LDI r1, 0x1DDEDC
  CMP r26, r4
  JNZ r26, else_0
  XOR r1, r14, r10
  MUL r1, r4, r9
  MOD r6, r5, r14
  ADD r14, r9, r10
  JMP endif_1
else_0:
  LDI r0, 32
  LDI r11, 0xAFAD29
  LDI r4, 255
  WPIXEL
  LDI r2, 64
  LDI r13, 0xA0949F
  LDI r9, 1604
  PSET r2, r13, r9
  LDI r12, 739
  LDI r9, 4
  LDI r15, 0xD874D6
  WPIXEL
endif_1:
  HALT
