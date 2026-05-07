; input driven program
; initialization
  LDI r13, 3862
  LDI r6, 2
  LDI r9, 255
  LDI r14, 0x613407
  LDI r15, 4
  LDI r8, 0x260C06
  LDI r3, 0
main_0:
  CMPI r2, 16
  LDI r5, 0xA7E3E8
  LDI r23, 256
  LDI r4, 0x0029DB
  TEXT r5, r23, r4, "HELLO"
  FRAME
  JMP main_0
