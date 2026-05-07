; mixed program
; initialization
  LDI r14, 245
  LDI r15, 0x0FB2B3
  LDI r12, 0xC0FB93
  LDI r9, 255
  LDI r4, 1330
  LDI r11, 3319
  LDI r2, 0xD74ECB
; palette
  LDI r11, 0x22B6
  LDI r15, 1
  LDI r8, 0x00FFFF
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x0000FF
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x0044FF
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x0044FF
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x008888
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x000000
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0xFFAA00
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0xFF8800
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x00FF00
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0xFFFF00
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x00FFAA
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x00FFAA
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x550077
  STORE r11, r8
  ADD r11, r11, r15
  LDI r8, 0x00FFAA
  STORE r11, r8
  ADD r11, r11, r15
  IKEY r14
  CMPI r14, 0xE4A9B9
  JNZ r14, key_0
  SHLI r3, r10, 4
  SHL r6, r15, r3
  SHLI r9, r11, 3
  CMP r8, r9
  JZ r8, else_1
  AND r11, r8, r10
  MUL r10, r6, r13
  DIV r13, r6, r12
  JMP endif_2
else_1:
  LDI r9, 64
  LDI r6, 0x042837
  LDI r1, 10
  LDI r8, 0x5C8F56
  LDI r9, 2901
  LINE r9, r6, r1, r8, r9
  LDI r14, 2838
  LDI r14, 0xD03CC0
  LDI r8, 3201
  PSETI
  LDI r13, 2
  LDI r13, 0x22AD7E
  LDI r1, 3783
  LDI r7, 10
  LDI r6, 0x3828C3
  RECTF r13, r13, r1, r7, r6
  LDI r1, 255
  LDI r8, 308
  LDI r7, 0x410EF6
  PSETI
endif_2:
  SHLI r7, r9, 1
  SHLI r8, r4, 8
  SAR r1, r13, r5
  SHLI r14, r9, 5
main_3:
  ADD r1, r12, r2
  OR r10, r5, r2
  XOR r9, r8, r7
  AND r3, r15, r14
  SUBI r10, r8, 0x76D62F
  ANDI r12, r0, 0x277566
  SHLI r6, r15, 0x849214
  SHLI r14, r4, 0xDC6CB7
  SHL r0, r4, r8
  LDI r11, 16
  FILL r11
  FRAME
  JMP main_3
