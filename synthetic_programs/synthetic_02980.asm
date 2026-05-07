; input driven program
; initialization
  LDI r15, 0xEC3AD6
  LDI r14, 8
  LDI r9, 490
  LDI r5, 16
  LDI r1, 0
  LDI r3, 0xA79B3F
main_0:
  CMPI r13, 0xE205C7
  ANDI r9, r5, 0x901F52
  CMPI r2, r13, 145
  MOD r7, r1, r9
  SUBI r9, r14, 0
  MUL r3, r1, r15
  FRAME
  JMP main_0
