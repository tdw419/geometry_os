; drawing loop program
; initialization
  LDI r1, 644
  LDI r15, 128
  LDI r13, 2024
  LDI r7, 3513
; palette
  LDI r9, 0x4061
  LDI r0, 1
  LDI r11, 0x0044FF
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0xFFAA00
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0xFFFFFF
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0x880088
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0x00AAFF
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0xAAFF00
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0x000066
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0x00FF44
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0x444444
  STORE r9, r11
  ADD r9, r9, r0
  LDI r11, 0x00FFAA
  STORE r9, r11
  ADD r9, r9, r0
main_0:
  SAR r8, r10, r0
  SHR r14, r11, r4
  IKEY r9
  CMPI r9, 0xBA096D
  JNZ r9, key_1
  IKEY r13
  CMPI r13, 10
  JNZ r13, key_2
  LDI r5, 10
  LDI r15, 341
  LDI r6, 2723
  PSET r5, r15, r6
  FRAME
  JMP main_0
