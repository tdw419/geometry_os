; drawing loop program
; initialization
  LDI r10, 2
  LDI r13, 128
  LDI r11, 2162
  LDI r14, 10
  LDI r9, 128
  LDI r3, 0x4633F1
  LDI r6, 0xFD63A4
; palette
  LDI r14, 0x403F
  LDI r7, 1
  LDI r5, 0x000066
  STORE r14, r5
  ADD r14, r14, r7
  LDI r5, 0x888800
  STORE r14, r5
  ADD r14, r14, r7
  LDI r5, 0xFF0000
  STORE r14, r5
  ADD r14, r14, r7
  LDI r5, 0x00AAFF
  STORE r14, r5
  ADD r14, r14, r7
main_0:
  CMP r6, r4
  LDI r0, 0x803CC9
  LDI r4, 0xE3A832
  LDI r8, 3602
  DRAWTEXT r0, r4, r8, "WORLD"
  CMPI r0, 0xDE5EB6
  FRAME
  JMP main_0
