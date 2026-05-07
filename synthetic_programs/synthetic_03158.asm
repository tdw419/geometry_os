; drawing loop program
; initialization
  LDI r11, 0x33A52C
  LDI r12, 10
  LDI r29, 0xC3AB9E
; palette
  LDI r4, 0x2451
  LDI r0, 1
  LDI r14, 0xFF8800
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0xFF8800
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x888800
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x0044FF
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x550077
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x00FFFF
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x000066
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x444444
  STORE r4, r14
  ADD r4, r4, r0
  LDI r14, 0x0044FF
  STORE r4, r14
  ADD r4, r4, r0
main_0:
  CMPI r24, 107
  MUL r12, r4, r21
  LDI r5, 2
  LDI r23, 256
  LDI r15, 712
  DRAWTEXT r5, r23, r15, "WORLD"
  XOR r6, r11, r7
  AND r14, r2, r13
  CMP r9, r6
  CMP r4, r3
  FRAME
  JMP main_0
