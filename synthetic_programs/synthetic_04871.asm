; drawing loop program
; initialization
  LDI r8, 2006
  LDI r0, 4
  LDI r14, 2145
  LDI r15, 1853
; palette
  LDI r13, 0x50FC
  LDI r15, 1
  LDI r12, 0x00FFAA
  STORE r13, r12
  ADD r13, r13, r15
  LDI r12, 0x000066
  STORE r13, r12
  ADD r13, r13, r15
  LDI r12, 0x0000FF
  STORE r13, r12
  ADD r13, r13, r15
  LDI r12, 0x550077
  STORE r13, r12
  ADD r13, r13, r15
  LDI r12, 0x0044FF
  STORE r13, r12
  ADD r13, r13, r15
main_0:
  CMPI r30, 74
  SHLI r8, r12, 0x7D9024
  SAR r14, r7, r15
  SHR r2, r8, r9
  FRAME
  JMP main_0
