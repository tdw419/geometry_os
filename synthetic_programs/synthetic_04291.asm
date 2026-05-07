; input driven program
; initialization
  LDI r11, 0x877102
  LDI r2, 3652
  LDI r4, 2502
  LDI r14, 0x7218E2
  LDI r12, 255
main_0:
  SHR r11, r5, r9
  SHL r15, r4, r7
  SHR r15, r3, r8
  LDI r0, 10
  LDI r1, 695
  LDI r6, 0x809A6C
  TEXT r0, r1, r6, "HELLO"
  FRAME
  JMP main_0
