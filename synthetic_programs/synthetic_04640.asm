; drawing loop program
; initialization
  LDI r22, 0x2D2D68
  LDI r2, 0x6AE1E4
  LDI r14, 1126
  LDI r10, 32
  LDI r12, 256
  LDI r6, 2
  LDI r13, 0xADD29B
  LDI r4, 2
; palette
  LDI r9, 0x60BB
  LDI r7, 1
  LDI r4, 0xFF8800
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x0000CC
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x550077
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0x0044FF
  STORE r9, r4
  ADD r9, r9, r7
  LDI r4, 0xDD0044
  STORE r9, r4
  ADD r9, r9, r7
main_0:
  LDI r3, 256
  LDI r2, 0xC1D634
  LDI r12, 473
  TEXT r3, r2, r12, "HELLO"
  LDI r14, 2174
  FILL r14
  CMPI r7, r11, 4
  SUBI r1, r0, 0x6DBA6A
  LDI r14, 4002
  LDI r12, 3725
  LDI r9, 128
  LDI r9, 1
  LDI r13, 1
  LINE r14, r12, r9, r9, r13
  FRAME
  JMP main_0
