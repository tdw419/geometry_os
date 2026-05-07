; drawing loop program
; initialization
  LDI r4, 0xC58D3A
  LDI r27, 2959
  LDI r14, 1602
  LDI r3, 0
main_0:
  CMPI r3, 0x29553A
  LDI r8, 256
  FILL r8
  SAR r10, r15, r6
  SHR r7, r2, r8
  SHR r0, r12, r15
  FRAME
  JMP main_0
