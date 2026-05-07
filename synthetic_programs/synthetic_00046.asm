; drawing loop program
; initialization
  LDI r5, 8
  LDI r7, 0xFA7A2D
  LDI r6, 2286
  LDI r13, 10
  LDI r4, 3422
main_0:
  LDI r1, 256
  LDI r14, 0
  LDI r13, 8
  TEXT r1, r14, r13, "HELLO"
  ADD r9, r14, r0
  FRAME
  JMP main_0
