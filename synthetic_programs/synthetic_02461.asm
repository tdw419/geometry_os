; drawing loop program
; initialization
  LDI r15, 8
  LDI r30, 128
  LDI r0, 0x01E157
  LDI r10, 2
  LDI r6, 308
; palette
  LDI r11, 0x70EE
  LDI r5, 1
  LDI r12, 0xAAAAAA
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0xAA00AA
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0xFF8800
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0xFFEE00
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0xAA00AA
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0xFF8800
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0xAAFF00
  STORE r11, r12
  ADD r11, r11, r5
  LDI r12, 0x444444
  STORE r11, r12
  ADD r11, r11, r5
main_0:
  MUL r5, r7, r12
  IKEY r12
  CMPI r12, 32
  JNZ r12, key_1
  AND r13, r4, r5
  AND r7, r4, r10
  XOR r10, r9, r7
  OR r4, r1, r12
  XOR r10, r14, r6
  XOR r1, r2, r9
  FRAME
  JMP main_0
