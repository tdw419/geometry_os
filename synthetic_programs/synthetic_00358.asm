; drawing loop program
; initialization
  LDI r5, 2
  LDI r14, 255
; palette
  LDI r2, 0x218D
  LDI r14, 1
  LDI r15, 0xFF8800
  STORE r2, r15
  ADD r2, r2, r14
  LDI r15, 0x000066
  STORE r2, r15
  ADD r2, r2, r14
  LDI r15, 0xFFFF00
  STORE r2, r15
  ADD r2, r2, r14
  LDI r15, 0x444444
  STORE r2, r15
  ADD r2, r2, r14
  LDI r15, 0xFF4400
  STORE r2, r15
  ADD r2, r2, r14
main_0:
  CMPI r12, 195
  MOD r6, r2, r9
  CMPI r10, 182
  SHLI r9, r10, 0xF7F91B
  SHR r10, r14, r5
  SHR r9, r8, r0
  SHL r12, r15, r10
  FRAME
  JMP main_0
