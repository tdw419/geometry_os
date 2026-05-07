; drawing loop program
; initialization
  LDI r10, 0x4A8107
  LDI r0, 8
main_0:
  OR r10, r12, r1
  AND r0, r12, r5
  SHLI r10, r12, 0x4841B5
  SHR r15, r1, r9
  SHL r2, r4, r14
  FRAME
  JMP main_0
