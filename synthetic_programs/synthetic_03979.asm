; drawing loop program
; initialization
  LDI r3, 3659
  LDI r31, 255
  LDI r1, 114
  LDI r13, 3455
  LDI r12, 3182
  LDI r4, 0
; palette
  LDI r11, 0x6007
  LDI r13, 1
  LDI r7, 0x000066
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x0000FF
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x44FF00
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0xAA00AA
  STORE r11, r7
  ADD r11, r11, r13
  LDI r7, 0x0044FF
  STORE r11, r7
  ADD r11, r11, r13
main_0:
  LDI r0, 16
  LDI r4, 10
  LDI r12, 3379
  TEXT r0, r4, r12, "HELLO"
  SHR r5, r15, r10
  CMP r15, r9
  FRAME
  JMP main_0
