; drawing loop program
; initialization
  LDI r11, 0x9D8458
  LDI r2, 0xDA0205
  LDI r10, 128
  LDI r9, 0xFD6FB2
; palette
  LDI r2, 0x8044
  LDI r14, 1
  LDI r9, 0x550077
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0x008888
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0xFF0000
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0xFFEE00
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0xAAFF00
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0x44FF00
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0xFFFFFF
  STORE r2, r9
  ADD r2, r2, r14
  LDI r9, 0x00AAFF
  STORE r2, r9
  ADD r2, r2, r14
main_0:
  ADDI r2, r6, 8
  CMPI r5, 0x595800
  IKEY r12
  CMPI r12, 216
  JNZ r12, key_1
  FRAME
  JMP main_0
