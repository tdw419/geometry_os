; drawing loop program
; initialization
  LDI r9, 0xAD12D2
  LDI r8, 3339
  LDI r10, 64
  LDI r3, 3317
  LDI r4, 2801
  LDI r0, 2192
  LDI r12, 2225
  LDI r5, 1314
; palette
  LDI r11, 0x214B
  LDI r7, 1
  LDI r4, 0x44FF00
  STORE r11, r4
  ADD r11, r11, r7
  LDI r4, 0x008888
  STORE r11, r4
  ADD r11, r11, r7
  LDI r4, 0xFF0000
  STORE r11, r4
  ADD r11, r11, r7
  LDI r4, 0xFFFFFF
  STORE r11, r4
  ADD r11, r11, r7
main_0:
  ADDI r9, r15, 18
  IKEY r8
  CMPI r8, 0x59EEE8
  JNZ r8, key_1
  XOR r8, r10, r6
  OR r14, r3, r11
  OR r10, r4, r9
  FRAME
  JMP main_0
