; input driven program
; initialization
  LDI r23, 0x5C996A
  LDI r22, 4059
  LDI r7, 1659
main_0:
  MOD r3, r2, r15
  SHR r3, r5, r15
  SHLI r15, r8, 0
  SAR r0, r14, r12
  FRAME
  JMP main_0
