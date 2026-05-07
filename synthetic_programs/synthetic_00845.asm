; drawing loop program
; initialization
  LDI r15, 256
  LDI r10, 128
  LDI r3, 0x76EA01
  LDI r14, 0
  LDI r13, 1509
; palette
  LDI r9, 0x21DE
  LDI r13, 1
  LDI r15, 0x008888
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x000066
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x444444
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0xAAFF00
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x00FFAA
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0xAA00AA
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x0000CC
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x444444
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0xFFFFFF
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x00FF00
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x0044FF
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0xAAAAAA
  STORE r9, r15
  ADD r9, r9, r13
  LDI r15, 0x00FFAA
  STORE r9, r15
  ADD r9, r9, r13
main_0:
  LDI r8, 0x3F7CEE
  LDI r13, 3041
  LDI r13, 1672
  LDI r1, 1030
  CIRCLE r8, r13, r13, r1
  CMP r12, r4
  SHL r12, r3, r4
  SHR r5, r11, r14
  CMPI r11, r4, 255
  FRAME
  JMP main_0
