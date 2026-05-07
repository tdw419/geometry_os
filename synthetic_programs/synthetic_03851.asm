; input driven program
; initialization
  LDI r14, 4029
  LDI r5, 0x047B76
  LDI r0, 0x04EAC8
  LDI r3, 3267
  LDI r2, 1223
main_0:
  CMP r14, r4
  SHR r9, r3, r1
  SHR r9, r1, r12
  SHR r5, r10, r9
  FRAME
  JMP main_0
