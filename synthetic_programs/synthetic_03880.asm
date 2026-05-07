; input driven program
; initialization
  LDI r0, 0xB8C932
  LDI r13, 0x8DF4F6
  LDI r8, 0xFF47ED
  LDI r7, 2164
  LDI r12, 1141
  LDI r10, 256
  LDI r2, 0x1646EB
main_0:
  SHL r9, r21, r4
  SHL r5, r1, r14
  LDI r14, 0xC0EA52
  LDI r13, 2798
  LDI r13, 256
  DRAWTEXT r14, r13, r13, "WORLD"
  SUB r2, r13, r5
  DIV r10, r8, r15
  SHR r9, r3, r11
  FRAME
  JMP main_0
