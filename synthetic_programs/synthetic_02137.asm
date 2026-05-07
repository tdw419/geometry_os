; drawing loop program
; initialization
  LDI r8, 2618
  LDI r11, 256
  LDI r2, 128
  LDI r0, 256
  LDI r6, 0xA92439
  LDI r14, 0x229334
  LDI r12, 0
  LDI r3, 0xAE44CB
; palette
  LDI r11, 0x7032
  LDI r15, 1
  LDI r14, 0xFF4400
  STORE r11, r14
  ADD r11, r11, r15
  LDI r14, 0x550077
  STORE r11, r14
  ADD r11, r11, r15
  LDI r14, 0x00FFFF
  STORE r11, r14
  ADD r11, r11, r15
  LDI r14, 0x888800
  STORE r11, r14
  ADD r11, r11, r15
  LDI r14, 0xFF0000
  STORE r11, r14
  ADD r11, r11, r15
  LDI r14, 0x00FF00
  STORE r11, r14
  ADD r11, r11, r15
main_0:
  CMPI r7, 256
  LDI r7, 258
  LDI r2, 128
  LDI r12, 0x72CB0C
  PSET r7, r2, r12
  IKEY r5
  CMPI r5, 32
  JNZ r5, key_1
  CMPI r2, 10
  LDI r8, 4
  LDI r6, 128
  LDI r6, 4042
  PSETI
  FRAME
  JMP main_0
