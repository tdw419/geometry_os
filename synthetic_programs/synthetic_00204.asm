; conditional logic
; initialization
  LDI r7, 3949
  LDI r0, 32
  LDI r15, 0x525FF2
  LDI r3, 1259
  LDI r1, 0xBFF940
  LDI r25, 0
  LDI r6, 255
  LDI r12, 0x6DDA2B
  CMP r9, r7
  JNZ r9, else_0
  ADD r2, r10, r9
  JMP endif_1
else_0:
  LDI r8, 0xD35773
  FILL r8
  LDI r29, 128
  LDI r6, 3093
  LDI r10, 0xA794B3
  PSET r29, r6, r10
endif_1:
  HALT
