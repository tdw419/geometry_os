; drawing loop program
; initialization
  LDI r4, 2123
  LDI r15, 2723
  LDI r5, 64
  LDI r3, 1785
  LDI r11, 8
  LDI r1, 3708
  LDI r8, 2091
; palette
  LDI r15, 0x240C
  LDI r10, 1
  LDI r5, 0x0000FF
  STORE r15, r5
  ADD r15, r15, r10
  LDI r5, 0x880088
  STORE r15, r5
  ADD r15, r15, r10
  LDI r5, 0x550077
  STORE r15, r5
  ADD r15, r15, r10
  LDI r5, 0x0044FF
  STORE r15, r5
  ADD r15, r15, r10
  LDI r5, 0xDD0044
  STORE r15, r5
  ADD r15, r15, r10
  LDI r5, 0xFFFFFF
  STORE r15, r5
  ADD r15, r15, r10
  LDI r5, 0x00AAFF
  STORE r15, r5
  ADD r15, r15, r10
main_0:
  CMPI r9, 255
  CMPI r15, r4, 2
  FRAME
  JMP main_0
