; input driven program
; initialization
  LDI r9, 0xFC8790
  LDI r5, 2761
  LDI r15, 10
  LDI r17, 0x09BFDD
main_0:
  SHL r15, r14, r11
  SHR r11, r12, r8
  LDI r4, 0x18CDFB
  LDI r10, 1
  LDI r7, 64
  TEXT r4, r10, r7, "HELLO"
  DIV r6, r3, r19
  LDI r1, 0x7D10A7
  LDI r3, 0x2CA979
  LDI r8, 0x7A4764
  LDI r2, 256
  LDI r4, 10
  LINE r1, r3, r8, r2, r4
  SUBI r14, r3, 0x67FE42
  LDI r8, 0x6359AC
  LDI r7, 1
  LDI r12, 0xD777B8
  DRAWTEXT r8, r7, r12, "WORLD"
  FRAME
  JMP main_0
