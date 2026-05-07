; drawing loop program
; initialization
  LDI r7, 1286
  LDI r8, 2545
; palette
  LDI r7, 0x706E
  LDI r9, 1
  LDI r11, 0xAAFF00
  STORE r7, r11
  ADD r7, r7, r9
  LDI r11, 0xAAFF00
  STORE r7, r11
  ADD r7, r7, r9
  LDI r11, 0x008888
  STORE r7, r11
  ADD r7, r7, r9
  LDI r11, 0x888800
  STORE r7, r11
  ADD r7, r7, r9
  LDI r11, 0x00AAFF
  STORE r7, r11
  ADD r7, r7, r9
  LDI r11, 0x0044FF
  STORE r7, r11
  ADD r7, r7, r9
  LDI r11, 0xFFFFFF
  STORE r7, r11
  ADD r7, r7, r9
main_0:
  LDI r12, 0x19DEBF
  LDI r9, 64
  LDI r7, 3147
  DRAWTEXT r12, r9, r7, "WORLD"
  ADDI r14, r9, 65
  DIV r1, r7, r13
  FRAME
  JMP main_0
