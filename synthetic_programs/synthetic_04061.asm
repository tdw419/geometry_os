; mixed program
; initialization
  LDI r12, 0xABD2B3
  LDI r5, 16
; palette
  LDI r1, 0x8030
  LDI r2, 1
  LDI r11, 0xFF4400
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x00AAFF
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x000000
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x00FF00
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x444444
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0xFF8800
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0xFFAA00
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x0000CC
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x00AAFF
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x44FF00
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0xFF4400
  STORE r1, r11
  ADD r1, r1, r2
  LDI r11, 0x0044FF
  STORE r1, r11
  ADD r1, r1, r2
  SHL r3, r9, r1
  SHL r23, r9, r5
  CALL func_0
func_0:
  DIV r4, r7, r0
  OR r1, r5, r8
  RET
  LDI r12, 0x6AE5D0
  LDI r3, 0x6E79D5
  LDI r3, 2
  PSET r12, r3, r3
  LDI r12, 0xBEE704
loop_1:
  SUBI r8, r12, 128
  ANDI r0, r12, 127
  CMPI r3, r15, 32
  LDI r6, 128
  LDI r9, 0
  LDI r5, 0xC8A1BE
  LDI r4, 382
  LDI r6, 10
  LINE r6, r9, r5, r4, r6
  LDI r13, 1
  SUB r12, r12, r13
  JNZ r12, loop_1
  IKEY r10
  CMPI r10, 85
  JNZ r10, key_2
  AND r15, r11, r5
  XOR r12, r0, r11
  XOR r9, r10, r4
  LDI r10, 1680
  LDI r8, 128
  LDI r5, 0xF0ECAD
  WPIXEL
  HALT
