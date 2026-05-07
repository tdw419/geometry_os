; conditional logic
; initialization
  LDI r31, 0xFBBB14
  LDI r7, 0x63C673
  LDI r2, 33
  LDI r14, 255
  CMP r7, r15
  JZ r7, else_0
  MOD r2, r6, r1
  OR r0, r11, r3
  SUB r14, r1, r3
  ADD r0, r9, r14
  JMP endif_1
else_0:
  LDI r4, 0x1B3005
  LDI r8, 1443
  LDI r7, 255
  LDI r14, 10
  LDI r10, 0xD62E60
  RECTF r4, r8, r7, r14, r10
  LDI r6, 3360
  LDI r11, 32
  LDI r3, 0x67BF3B
  PSETI
  LDI r3, 2800
  LDI r6, 256
  LDI r0, 2
  PSET r3, r6, r0
endif_1:
  HALT
