; input driven program
; initialization
  LDI r9, 0x38E8DD
  LDI r1, 2
  LDI r15, 64
  LDI r3, 16
  LDI r6, 0x661B88
  LDI r14, 3587
  LDI r7, 0xD1A3F3
  LDI r8, 32
main_0:
  LDI r0, 0x478406
  LDI r6, 588
  LDI r14, 8
  DRAWTEXT r0, r6, r14, "WORLD"
  CMPI r1, r15, 22
  MUL r0, r30, r8
  SUB r13, r2, r6
  FRAME
  JMP main_0
