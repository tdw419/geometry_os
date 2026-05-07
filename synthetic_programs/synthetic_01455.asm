; drawing loop program
; initialization
  LDI r15, 199
  LDI r11, 0
  LDI r1, 1
  LDI r2, 3930
; palette
  LDI r9, 0x20FD
  LDI r24, 1
  LDI r8, 0xDD0044
  STORE r9, r8
  ADD r9, r9, r24
  LDI r8, 0x880088
  STORE r9, r8
  ADD r9, r9, r24
  LDI r8, 0xFF00FF
  STORE r9, r8
  ADD r9, r9, r24
  LDI r8, 0x0000FF
  STORE r9, r8
  ADD r9, r9, r24
  LDI r8, 0x008888
  STORE r9, r8
  ADD r9, r9, r24
main_0:
  LDI r11, 0xCA8D39
  LDI r13, 0x62414E
  LDI r14, 4
  LDI r8, 218
  CIRCLE r11, r13, r14, r8
  AND r6, r4, r7
  OR r1, r3, r0
  LDI r9, 874
  LDI r9, 0x03A752
  LDI r3, 0x0774D3
  DRAWTEXT r9, r9, r3, "WORLD"
  LDI r31, 255
  LDI r10, 255
  LDI r12, 0x1DA2A4
  LDI r3, 4
  LDI r12, 1105
  LINE r31, r10, r12, r3, r12
  LDI r22, 2067
  FILL r22
  FRAME
  JMP main_0
