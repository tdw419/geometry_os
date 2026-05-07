; drawing loop program
; initialization
  LDI r13, 3947
  LDI r11, 4008
  LDI r15, 1
  LDI r9, 0x2869C0
  LDI r5, 8
  LDI r14, 64
  LDI r0, 1593
; palette
  LDI r11, 0x50A1
  LDI r29, 1
  LDI r6, 0x00FF00
  STORE r11, r6
  ADD r11, r11, r29
  LDI r6, 0x8800FF
  STORE r11, r6
  ADD r11, r11, r29
  LDI r6, 0x00FFAA
  STORE r11, r6
  ADD r11, r11, r29
  LDI r6, 0x0044FF
  STORE r11, r6
  ADD r11, r11, r29
main_0:
  LDI r7, 16
  LDI r15, 353
  LDI r4, 255
  LDI r11, 10
  LDI r15, 974
  RECTF r7, r15, r4, r11, r15
  OR r0, r12, r6
  OR r6, r8, r3
  FRAME
  JMP main_0
