; drawing loop program
; initialization
  LDI r0, 1
  LDI r5, 592
  LDI r6, 4
  LDI r9, 0xCBA510
  LDI r3, 3738
main_0:
  SUB r15, r13, r12
  LDI r14, 3590
  LDI r12, 0xC263C9
  LDI r8, 0x58F2B9
  TEXT r14, r12, r8, "HELLO"
  FRAME
  JMP main_0
