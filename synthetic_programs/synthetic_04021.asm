; drawing loop program
; initialization
  LDI r10, 434
  LDI r18, 0xCE4A2E
  LDI r5, 2178
main_0:
  ANDI r3, r10, 50
  LDI r7, 0x99ABDF
  LDI r15, 3700
  LDI r13, 0x00F962
  TEXT r7, r15, r13, "HELLO"
  CMP r2, r14
  SHR r6, r14, r15
  FRAME
  JMP main_0
