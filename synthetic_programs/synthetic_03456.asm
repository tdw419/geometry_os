; drawing loop program
; initialization
  LDI r8, 10
  LDI r6, 1
; palette
  LDI r5, 0x80BE
  LDI r18, 1
  LDI r14, 0xFF4400
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0x00FF00
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0x8800FF
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0x550077
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0xDD0044
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0xDD0044
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0xAAAAAA
  STORE r5, r14
  ADD r5, r5, r18
  LDI r14, 0xDD0044
  STORE r5, r14
  ADD r5, r5, r18
main_0:
  LDI r1, 64
  LDI r5, 59
  LDI r7, 128
  DRAWTEXT r1, r5, r7, "WORLD"
  CMPI r2, 107
  CMP r10, r1
  CMPI r11, r9, 83
  ANDI r4, r12, 0xF156D4
  FRAME
  JMP main_0
