; drawing loop program
; initialization
  LDI r17, 0x968BE4
  LDI r13, 0x9B824D
  LDI r7, 3614
  LDI r12, 507
  LDI r14, 3832
  LDI r6, 0x6F85B9
main_0:
  LDI r5, 2800
  FILL r5
  CMPI r2, 81
  SHR r0, r13, r14
  FRAME
  JMP main_0
