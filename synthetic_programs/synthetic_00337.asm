; drawing loop program
; initialization
  LDI r0, 64
  LDI r1, 4
  LDI r8, 2
  LDI r14, 0xB3B014
  LDI r2, 16
  LDI r15, 0xF28AB6
  LDI r7, 1617
  LDI r6, 961
; palette
  LDI r3, 0x70DC
  LDI r9, 1
  LDI r12, 0x0000CC
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x0044FF
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x880088
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0xFFFF00
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x0044FF
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0xFF4400
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0xFF0000
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x00AAFF
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x0000FF
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0xFFFF00
  STORE r3, r12
  ADD r3, r3, r9
  LDI r12, 0x8800FF
  STORE r3, r12
  ADD r3, r3, r9
main_0:
  CMP r13, r14
  SHR r2, r11, r4
  XOR r5, r10, r17
  AND r6, r2, r14
  AND r8, r9, r3
  SHL r5, r2, r10
  AND r0, r15, r6
  FRAME
  JMP main_0
