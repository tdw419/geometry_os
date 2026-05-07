; mixed program
; initialization
  LDI r8, 2
  LDI r10, 0x9B387F
; palette
  LDI r18, 0x5014
  LDI r11, 1
  LDI r6, 0x000066
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0x000000
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0x00FF44
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xFFAA00
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0x444444
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xFFFF00
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xFF4400
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xAAAAAA
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xFFEE00
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xDD0044
  STORE r18, r6
  ADD r18, r18, r11
  LDI r6, 0xDD0044
  STORE r18, r6
  ADD r18, r18, r11
  IKEY r12
  CMPI r12, 0x8F8A3A
  JNZ r12, key_0
  LDI r11, 3673
  LDI r20, 64
  LDI r13, 0xFDB2F6
  WPIXEL
  LDI r13, 230x23D6
  STORE r13, r11
  LOAD r8, r13
  LDI r14, 0x117D0x708E8
  STORE r14, r2
  LOAD r4, r14
  CMP r8, r5
main_1:
  ANDI r6, r4, 50
  IKEY r6
  CMPI r6, 32
  JNZ r6, key_2
  LDI r15, 16
  LDI r13, 0xF8909C
  LDI r5, 733
  WPIXEL
  LDI r7, 4024
  LDI r15, 2670
  LDI r4, 3720
  LDI r10, 685
  LDI r5, 0xEB3703
  LINE r7, r15, r4, r10, r5
  SHLI r9, r1, 5
  SAR r15, r6, r5
  SAR r9, r1, r2
  SHL r6, r2, r13
  SHR r14, r1, r6
  SHL r4, r14, r3
  SHR r7, r8, r12
  FRAME
  JMP main_1
