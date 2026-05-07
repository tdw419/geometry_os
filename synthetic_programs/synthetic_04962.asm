; input driven program
; initialization
  LDI r14, 255
  LDI r9, 32
main_0:
  SAR r12, r13, r7
  SHR r10, r3, r15
  SAR r13, r6, r12
  SAR r10, r15, r3
  ANDI r15, r2, 0xB848CE
  FRAME
  JMP main_0
