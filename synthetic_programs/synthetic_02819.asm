; drawing loop program
; initialization
  LDI r12, 0xD7D782
  LDI r9, 2527
  LDI r15, 732
  LDI r0, 2705
  LDI r1, 8
  LDI r11, 64
main_0:
  CMPI r4, 1
  MOD r7, r8, r10
  CMPI r10, 26
  SHL r5, r14, r10
  SHLI r7, r10, 0xFA9297
  SHLI r12, r2, 128
  SAR r14, r11, r4
  FRAME
  JMP main_0
