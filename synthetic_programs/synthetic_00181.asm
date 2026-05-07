; input driven program
; initialization
  LDI r13, 32
  LDI r9, 128
  LDI r25, 0xD82962
  LDI r15, 2916
  LDI r3, 32
  LDI r4, 1775
  LDI r7, 2928
main_0:
  SHR r5, r12, r13
  CMPI r0, r6, 16
  FRAME
  JMP main_0
