; drawing loop program
; initialization
  LDI r12, 3085
  LDI r4, 0x4138C7
  LDI r9, 3561
  LDI r1, 3217
  LDI r3, 256
  LDI r14, 255
; palette
  LDI r6, 0x200B
  LDI r15, 1
  LDI r1, 0x00FF00
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0xAAFF00
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0x444444
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0xFF8800
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0x000000
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0x0044FF
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0xAAAAAA
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0xFF00FF
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0x00AAFF
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0xAAFF00
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0x008888
  STORE r6, r1
  ADD r6, r6, r15
  LDI r1, 0x00AAFF
  STORE r6, r1
  ADD r6, r6, r15
main_0:
  LDI r6, 0x559620
  LDI r9, 0x4C06E4
  LDI r3, 460
  DRAWTEXT r6, r9, r3, "WORLD"
  LDI r8, 0x889BDD
  LDI r4, 32
  LDI r12, 16
  PSETI
  CMPI r11, 120
  FRAME
  JMP main_0
