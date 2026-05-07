; drawing loop program
; initialization
  LDI r5, 3626
  LDI r15, 1580
  LDI r7, 2978
  LDI r4, 32
  LDI r10, 0x398822
  LDI r11, 4
  LDI r8, 1163
  LDI r0, 1781
; palette
  LDI r12, 0x70AC
  LDI r21, 1
  LDI r10, 0x00AAFF
  STORE r12, r10
  ADD r12, r12, r21
  LDI r10, 0xAAFF00
  STORE r12, r10
  ADD r12, r12, r21
  LDI r10, 0x00FFAA
  STORE r12, r10
  ADD r12, r12, r21
  LDI r10, 0x0000CC
  STORE r12, r10
  ADD r12, r12, r21
main_0:
  DIV r3, r10, r9
  SUBI r1, r14, 88
  SUB r1, r13, r9
  SHLI r1, r2, 0xDE8D53
  SHLI r14, r0, 0x3027E2
  SAR r14, r6, r7
  CMPI r25, 0x53D157
  LDI r10, 0x2070B2
  LDI r2, 3656
  LDI r2, 1306
  DRAWTEXT r10, r2, r2, "WORLD"
  FRAME
  JMP main_0
