; mixed program
; initialization
  LDI r6, 2013
  LDI r13, 2899
  LDI r4, 351
  LDI r5, 585
  LDI r3, 0x3B69AB
  LDI r10, 128
  LDI r19, 2259
  CMP r10, r11
  CMP r13, r6
  JNZ r13, else_0
  XOR r2, r10, r15
  MOD r15, r6, r12
  ADD r2, r8, r11
  AND r15, r13, r0
  JMP endif_1
else_0:
  LDI r10, 128
  LDI r0, 3094
  LDI r14, 222
  PSET r10, r0, r14
endif_1:
  LDI r7, 0x3A89EB
  LDI r8, 16
  LDI r9, 0xD17C3E
  TEXT r7, r8, r9, "HELLO"
  CMPI r11, 0x3BC690
  HALT
