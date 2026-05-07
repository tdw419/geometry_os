; mixed program
; initialization
  LDI r4, 1461
  LDI r16, 64
; palette
  LDI r10, 0x808B
  LDI r4, 1
  LDI r0, 0xFFFF00
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x0000CC
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x8800FF
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x00FF00
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x0044FF
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x444444
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x888800
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0xFF00FF
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x880088
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x00FF00
  STORE r10, r0
  ADD r10, r10, r4
  LDI r0, 0x444444
  STORE r10, r0
  ADD r10, r10, r4
  IKEY r3
  CMPI r3, 0xC87314
  JNZ r3, key_0
  CMPI r5, 179
  LDI r3, 0x91C13D
  LDI r2, 0xDF4162
  LDI r3, 1114
  WPIXEL
  LDI r8, 4
  LDI r14, 0x80FE46
  LDI r8, 32
  WPIXEL
  CMP r1, r3
  JNZ r1, else_1
  ADD r2, r0, r11
  SHL r1, r9, r7
  OR r12, r14, r10
  MUL r13, r1, r11
  JMP endif_2
else_1:
  LDI r8, 0
  LDI r10, 370
  LDI r2, 0xA72D0C
  WPIXEL
  LDI r4, 1
  LDI r7, 0xA544DD
  LDI r14, 1002
  PSETI
  LDI r21, 256
  LDI r16, 1907
  LDI r4, 64
  LDI r1, 1578
  LDI r6, 463
  RECTF r21, r16, r4, r1, r6
endif_2:
  PUSH r10
  MOD r7, r3, r14
  DIV r8, r14, r11
  POP r10
main_3:
  LDI r3, 0x6199B9
  LDI r2, 0xA7937A
  LDI r15, 8
  DRAWTEXT r3, r2, r15, "WORLD"
  SUBI r14, r8, 156
  SHLI r15, r3, 10
  SHLI r9, r2, 16
  XOR r5, r8, r2
  XOR r13, r10, r14
  OR r8, r3, r7
  OR r10, r11, r7
  FRAME
  JMP main_3
