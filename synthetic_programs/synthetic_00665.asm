; drawing loop program
; initialization
  LDI r12, 256
  LDI r4, 0x1B7208
  LDI r10, 64
  LDI r11, 64
; palette
  LDI r6, 0x232D
  LDI r5, 1
  LDI r7, 0xFFFF00
  STORE r6, r7
  ADD r6, r6, r5
  LDI r7, 0xAAAAAA
  STORE r6, r7
  ADD r6, r6, r5
  LDI r7, 0x0000CC
  STORE r6, r7
  ADD r6, r6, r5
  LDI r7, 0x00FFAA
  STORE r6, r7
  ADD r6, r6, r5
  LDI r7, 0xFFFFFF
  STORE r6, r7
  ADD r6, r6, r5
  LDI r7, 0x00AAFF
  STORE r6, r7
  ADD r6, r6, r5
main_0:
  LDI r14, 8
  LDI r1, 32
  LDI r7, 16
  LDI r7, 256
  LDI r12, 119
  LINE r14, r1, r7, r7, r12
  OR r12, r13, r15
  OR r8, r0, r6
  FRAME
  JMP main_0
