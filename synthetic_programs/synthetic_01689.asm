; drawing loop program
; initialization
  LDI r13, 8
  LDI r4, 10
  LDI r10, 0x9015DE
main_0:
  ADD r7, r14, r10
  SUB r1, r3, r15
  SHLI r9, r7, 128
  SHR r6, r14, r29
  SHLI r11, r1, 3
  FRAME
  JMP main_0
