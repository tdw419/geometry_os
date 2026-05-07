; drawing loop program
; initialization
  LDI r7, 0
  LDI r1, 3065
  LDI r9, 816
  LDI r8, 3295
  LDI r3, 128
; palette
  LDI r3, 0x24E9
  LDI r7, 1
  LDI r14, 0x008888
  STORE r3, r14
  ADD r3, r3, r7
  LDI r14, 0x0000FF
  STORE r3, r14
  ADD r3, r3, r7
  LDI r14, 0x00FFFF
  STORE r3, r14
  ADD r3, r3, r7
  LDI r14, 0xFF0000
  STORE r3, r14
  ADD r3, r3, r7
  LDI r14, 0x00FFAA
  STORE r3, r14
  ADD r3, r3, r7
  LDI r14, 0xAAAAAA
  STORE r3, r14
  ADD r3, r3, r7
main_0:
  MOD r3, r1, r9
  LDI r8, 1722
  LDI r11, 3618
  LDI r7, 16
  TEXT r8, r11, r7, "HELLO"
  IKEY r21
  CMPI r21, 0x60F32F
  JNZ r21, key_1
  CMP r8, r0
  FRAME
  JMP main_0
