; input driven program
; initialization
  LDI r4, 64
  LDI r9, 16
  LDI r12, 0x171503
  LDI r11, 547
  LDI r26, 0x816D4A
  LDI r15, 2216
main_0:
  LDI r6, 10
  LDI r3, 0
  LDI r4, 2221
  TEXT r6, r3, r4, "HELLO"
  LDI r8, 4
  LDI r7, 3556
  LDI r9, 1775
  DRAWTEXT r8, r7, r9, "WORLD"
  SHR r11, r9, r3
  SHL r12, r21, r13
  SHR r2, r9, r14
  SAR r3, r17, r0
  LDI r6, 16
  LDI r4, 0
  LDI r2, 10
  TEXT r6, r4, r2, "HELLO"
  FRAME
  JMP main_0
