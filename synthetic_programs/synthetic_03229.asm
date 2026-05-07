; drawing loop program
; initialization
  LDI r10, 128
  LDI r18, 922
; palette
  LDI r12, 0x50BE
  LDI r0, 1
  LDI r15, 0x0000CC
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0x00AAFF
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0xFFFFFF
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0x000066
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0x00FF44
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0xDD0044
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0xAAAAAA
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0xAAAAAA
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0x00AAFF
  STORE r12, r15
  ADD r12, r12, r0
  LDI r15, 0x550077
  STORE r12, r15
  ADD r12, r12, r0
main_0:
  CMP r11, r5
  IKEY r7
  CMPI r7, 255
  JNZ r7, key_1
  FRAME
  JMP main_0
