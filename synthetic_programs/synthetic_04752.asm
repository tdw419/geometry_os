; drawing loop program
; initialization
  LDI r3, 0
  LDI r12, 0x7F054C
  LDI r13, 0x7CCFB8
  LDI r0, 0x734EA1
; palette
  LDI r13, 0x229E
  LDI r8, 1
  LDI r2, 0x8800FF
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x0000FF
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFFAA00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x000066
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFF00FF
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0xFFFF00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00FF00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x880088
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x444444
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x00FF00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x44FF00
  STORE r13, r2
  ADD r13, r13, r8
  LDI r2, 0x444444
  STORE r13, r2
  ADD r13, r13, r8
main_0:
  LDI r12, 3510
  LDI r15, 0xB8CA88
  LDI r10, 0xF80E9F
  DRAWTEXT r12, r15, r10, "WORLD"
  IKEY r5
  CMPI r5, 1
  JNZ r5, key_1
  XOR r15, r2, r13
  OR r11, r4, r13
  XOR r9, r6, r2
  FRAME
  JMP main_0
