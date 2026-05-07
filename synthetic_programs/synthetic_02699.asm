; drawing loop program
; initialization
  LDI r12, 2
  LDI r0, 256
  LDI r1, 439
  LDI r14, 110
  LDI r18, 128
  LDI r21, 903
; palette
  LDI r9, 0x24C5
  LDI r12, 1
  LDI r6, 0x00FF44
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0x0000CC
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0x0000CC
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0x8800FF
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0x008888
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0x550077
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0xAAAAAA
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0xFF0000
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0xAA00AA
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0x00FF00
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0xAAFF00
  STORE r9, r6
  ADD r9, r9, r12
  LDI r6, 0xAA00AA
  STORE r9, r6
  ADD r9, r9, r12
main_0:
  IKEY r1
  CMPI r1, 94
  JNZ r1, key_1
  XOR r2, r7, r3
  AND r8, r0, r5
  ADD r2, r3, r9
  SAR r11, r3, r7
  SHL r14, r2, r8
  SHL r5, r2, r6
  SUBI r13, r25, 221
  FRAME
  JMP main_0
