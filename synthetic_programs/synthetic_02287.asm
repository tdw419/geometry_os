; drawing loop program
; initialization
  LDI r9, 3626
  LDI r6, 0x9444AC
  LDI r15, 294
  LDI r14, 1561
  LDI r3, 0x8EBBA2
  LDI r7, 0x987715
main_0:
  LDI r3, 1
  LDI r2, 2860
  LDI r12, 16
  LDI r3, 2908
  CIRCLE r3, r2, r12, r3
  LDI r14, 10
  LDI r6, 2
  LDI r0, 2759
  PSET r14, r6, r0
  CMPI r13, r0, 0x83F628
  FRAME
  JMP main_0
