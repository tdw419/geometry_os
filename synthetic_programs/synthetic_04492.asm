; input driven program
; initialization
  LDI r6, 2898
  LDI r5, 113
  LDI r2, 0x93488A
  LDI r7, 1
  LDI r8, 64
main_0:
  LDI r11, 0x32029D
  LDI r6, 1
  LDI r1, 0x85F809
  LDI r5, 445
  CIRCLE r11, r6, r1, r5
  CMPI r12, r3, 50
  CMP r13, r15
  ADD r9, r3, r8
  FRAME
  JMP main_0
