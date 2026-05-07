; mixed program
; initialization
  LDI r6, 8
  LDI r2, 889
  LDI r5, 3111
  CMP r9, r3
  JZ r9, else_0
  SHR r5, r6, r0
  AND r0, r11, r12
  MOD r8, r2, r12
  JMP endif_1
else_0:
  LDI r10, 32
  LDI r15, 32
  LDI r5, 0xF2EF29
  PSETI
  LDI r7, 4
  FILL r7
  LDI r0, 0xB5F0B9
  LDI r8, 0xD022E3
  LDI r8, 0x571412
  PSET r0, r8, r8
endif_1:
  SAR r1, r8, r3
  SHR r10, r12, r0
  CMPI r6, 86
  HALT
