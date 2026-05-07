; drawing loop program
; initialization
  LDI r7, 3121
  LDI r12, 0xAD9540
  LDI r5, 64
; palette
  LDI r9, 0x20B7
  LDI r0, 1
  LDI r5, 0x444444
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x0044FF
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0xFF00FF
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x000066
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x000000
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0xFF0000
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0xFF8800
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x008888
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x0000FF
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x8800FF
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0x550077
  STORE r9, r5
  ADD r9, r9, r0
  LDI r5, 0xFF00FF
  STORE r9, r5
  ADD r9, r9, r0
main_0:
  DIV r20, r0, r4
  IKEY r2
  CMPI r2, 32
  JNZ r2, key_1
  LDI r14, 128
  LDI r14, 1446
  LDI r9, 2993
  LDI r10, 1517
  LDI r6, 0x3481BF
  RECTF r14, r14, r9, r10, r6
  FRAME
  JMP main_0
