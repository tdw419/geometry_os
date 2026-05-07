; input driven program
; initialization
  LDI r4, 0xC7FA7F
  LDI r2, 0xF2FED4
  LDI r14, 0xFFE14B
  LDI r10, 1822
  LDI r12, 3332
  LDI r21, 2
  LDI r5, 0x08C3E2
  LDI r6, 0x4CD1C2
main_0:
  LDI r9, 8
  LDI r15, 128
  LDI r20, 8
  TEXT r9, r15, r20, "HELLO"
  SHR r15, r4, r11
  SHL r12, r7, r9
  FRAME
  JMP main_0
