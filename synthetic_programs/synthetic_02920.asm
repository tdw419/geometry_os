; mixed program
; initialization
  LDI r0, 128
  LDI r7, 166
; palette
  LDI r13, 0x3063
  LDI r1, 1
  LDI r6, 0x888800
  STORE r13, r6
  ADD r13, r13, r1
  LDI r6, 0x000066
  STORE r13, r6
  ADD r13, r13, r1
  LDI r6, 0x888800
  STORE r13, r6
  ADD r13, r13, r1
  LDI r6, 0xFF8800
  STORE r13, r6
  ADD r13, r13, r1
  LDI r6, 0xAA00AA
  STORE r13, r6
  ADD r13, r13, r1
  LDI r6, 0x0000CC
  STORE r13, r6
  ADD r13, r13, r1
  LDI r8, 0x2005234
  STORE r8, r14
  LOAD r2, r8
  LDI r13, 1604
  STORE r13, r4
  LOAD r1, r13
  LDI r2, 0x11D360
  STORE r2, r10
  LOAD r8, r2
  LDI r0x7094, 8
  STORE r2, r4
  LOAD r12, r2
  LDI r14, 2148
  STORE r14, r6
  LOAD r5, r14
  LDI r2, 0xC118A3
  LDI r6, 2205
  LDI r17, 0x6F0900
  PSET r2, r6, r17
  CMP r11, r4
  LDI r9, 0xF150A8
loop_0:
  CMPI r14, r15, 92
  LDI r13, 0x29F5FF
  LDI r2, 1053
  LDI r3, 0xE7466D
  LDI r14, 8
  LDI r14, 1777
  LINE r13, r2, r3, r14, r14
  LDI r4, 1
  SUB r9, r9, r4
  JNZ r9, loop_0
  OR r6, r4, r17
  XOR r8, r13, r10
main_1:
  SHR r8, r2, r1
  SHR r15, r0, r5
  SAR r23, r14, r1
  IKEY r7
  CMPI r7, 0xB7A874
  JNZ r7, key_2
  LDI r5, 0xCDEBFF
  LDI r4, 0xB174A1
  LDI r30, 2731
  TEXT r5, r4, r30, "HELLO"
  CMPI r14, 2
  FRAME
  JMP main_1
