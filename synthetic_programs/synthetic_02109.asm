; drawing loop program
; initialization
  LDI r5, 0xF3DDEB
  LDI r11, 103
  LDI r6, 128
; palette
  LDI r1, 0x203A
  LDI r2, 1
  LDI r12, 0xAAAAAA
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0x00AAFF
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0x00FF44
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0x00AAFF
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0xFF0000
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0x550077
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0x00AAFF
  STORE r1, r12
  ADD r1, r1, r2
  LDI r12, 0x00FFAA
  STORE r1, r12
  ADD r1, r1, r2
main_0:
  CMPI r12, 79
  LDI r15, 0x2D14B9
  LDI r11, 2762
  LDI r6, 0x737E69
  LDI r14, 2165
  LDI r1, 0xEB104B
  RECTF r15, r11, r6, r14, r1
  SHL r14, r13, r12
  SHL r12, r8, r3
  SAR r25, r12, r1
  SHR r4, r14, r2
  CMPI r11, 0xF3807A
  LDI r7, 32
  LDI r6, 0xAE8013
  LDI r3, 0
  LDI r7, 655
  LDI r11, 842
  RECTF r7, r6, r3, r7, r11
  FRAME
  JMP main_0
