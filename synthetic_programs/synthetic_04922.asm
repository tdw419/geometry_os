; drawing loop program
; initialization
  LDI r13, 79
  LDI r9, 255
  LDI r14, 1192
; palette
  LDI r14, 0x211F
  LDI r15, 1
  LDI r10, 0x444444
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0xFF8800
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0xFF8800
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0x550077
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0xDD0044
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0x000000
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0x8800FF
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0x00AAFF
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0xAAFF00
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0xFFAA00
  STORE r14, r10
  ADD r14, r14, r15
  LDI r10, 0xFF4400
  STORE r14, r10
  ADD r14, r14, r15
main_0:
  SAR r14, r2, r0
  SHLI r6, r2, 4
  SHLI r12, r11, 2
  IKEY r8
  CMPI r8, 217
  JNZ r8, key_1
  FRAME
  JMP main_0
