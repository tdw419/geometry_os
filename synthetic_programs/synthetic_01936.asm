; drawing loop program
; initialization
  LDI r8, 3
  LDI r7, 0x5C264E
  LDI r12, 8
  LDI r9, 0xA0EBCB
main_0:
  CMP r6, r3
  SHR r14, r8, r5
  SAR r1, r9, r12
  SAR r4, r8, r0
  FRAME
  JMP main_0
