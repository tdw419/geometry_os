; drawing loop program
; initialization
  LDI r8, 64
  LDI r11, 0x5B3634
  LDI r0, 255
  LDI r10, 0x2EA050
; palette
  LDI r12, 0x30EA
  LDI r9, 1
  LDI r20, 0x00AAFF
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0x880088
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0xFFFFFF
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0xDD0044
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0xDD0044
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0xAAAAAA
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0x0000CC
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0x0000CC
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0x0000CC
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0x00FF00
  STORE r12, r20
  ADD r12, r12, r9
  LDI r20, 0x008888
  STORE r12, r20
  ADD r12, r12, r9
main_0:
  SHLI r24, r1, 8
  SHR r29, r3, r2
  SAR r5, r4, r11
  ADDI r5, r1, 0x88D6FF
  CMP r6, r14
  LDI r11, 2
  FILL r11
  DIV r10, r7, r13
  FRAME
  JMP main_0
