; drawing loop program
; initialization
  LDI r2, 2502
  LDI r0, 957
; palette
  LDI r13, 0x22B4
  LDI r0, 1
  LDI r16, 0x0044FF
  STORE r13, r16
  ADD r13, r13, r0
  LDI r16, 0xFF00FF
  STORE r13, r16
  ADD r13, r13, r0
  LDI r16, 0x880088
  STORE r13, r16
  ADD r13, r13, r0
  LDI r16, 0x0044FF
  STORE r13, r16
  ADD r13, r13, r0
  LDI r16, 0xFF4400
  STORE r13, r16
  ADD r13, r13, r0
main_0:
  AND r13, r10, r5
  CMP r7, r14
  FRAME
  JMP main_0
