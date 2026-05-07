; drawing loop program
; initialization
  LDI r1, 0xBBCBD6
  LDI r15, 32
; palette
  LDI r5, 0x2295
  LDI r0, 1
  LDI r4, 0x0000FF
  STORE r5, r4
  ADD r5, r5, r0
  LDI r4, 0x00FFFF
  STORE r5, r4
  ADD r5, r5, r0
  LDI r4, 0xAAAAAA
  STORE r5, r4
  ADD r5, r5, r0
  LDI r4, 0xFF0000
  STORE r5, r4
  ADD r5, r5, r0
  LDI r4, 0x880088
  STORE r5, r4
  ADD r5, r5, r0
  LDI r4, 0x880088
  STORE r5, r4
  ADD r5, r5, r0
main_0:
  IKEY r22
  CMPI r22, 182
  JNZ r22, key_1
  XOR r14, r5, r2
  SHL r5, r0, r6
  LDI r13, 255
  LDI r19, 256
  LDI r7, 0x27D47E
  LDI r3, 0x865A9A
  CIRCLE r13, r19, r7, r3
  FRAME
  JMP main_0
