; drawing loop program
; initialization
  LDI r4, 2453
  LDI r10, 108
  LDI r1, 2
; palette
  LDI r14, 0x23D8
  LDI r8, 1
  LDI r9, 0xFF8800
  STORE r14, r9
  ADD r14, r14, r8
  LDI r9, 0xFF0000
  STORE r14, r9
  ADD r14, r14, r8
  LDI r9, 0x00AAFF
  STORE r14, r9
  ADD r14, r14, r8
  LDI r9, 0x880088
  STORE r14, r9
  ADD r14, r14, r8
  LDI r9, 0x0000FF
  STORE r14, r9
  ADD r14, r14, r8
  LDI r9, 0xFF4400
  STORE r14, r9
  ADD r14, r14, r8
main_0:
  ADDI r5, r2, 10
  CMPI r11, r6, 0x3573EC
  SHL r10, r9, r3
  FRAME
  JMP main_0
