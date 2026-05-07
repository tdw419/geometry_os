; drawing loop program
; initialization
  LDI r15, 1613
  LDI r1, 0x097DBF
; palette
  LDI r8, 0x2240
  LDI r0, 1
  LDI r13, 0xFF4400
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x0044FF
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x00FF44
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x888800
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x000066
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x44FF00
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0xFF4400
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x44FF00
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0xFF00FF
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0xAAAAAA
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x00FF00
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x0000FF
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0xFF00FF
  STORE r8, r13
  ADD r8, r8, r0
  LDI r13, 0x880088
  STORE r8, r13
  ADD r8, r8, r0
main_0:
  ADDI r12, r3, 0
  SHLI r14, r12, 0x5C797B
  SAR r0, r8, r10
  SAR r6, r15, r9
  SHR r4, r9, r2
  CMP r6, r0
  IKEY r0
  CMPI r0, 32
  JNZ r0, key_1
  ANDI r11, r26, 38
  LDI r12, 10
  LDI r14, 32
  LDI r15, 64
  PSET r12, r14, r15
  FRAME
  JMP main_0
