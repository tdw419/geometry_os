; drawing loop program
; initialization
  LDI r13, 3408
  LDI r5, 255
  LDI r4, 64
  LDI r10, 0x3B296C
  LDI r9, 0x2EE2E1
main_0:
  MOD r15, r4, r13
  OR r14, r10, r12
  SHR r4, r6, r14
  SAR r14, r12, r8
  LDI r14, 306
  FILL r14
  SHLI r10, r27, 4
  SAR r2, r7, r8
  SHR r14, r4, r12
  FRAME
  JMP main_0
