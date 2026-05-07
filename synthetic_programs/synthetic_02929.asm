; mixed program
; initialization
  LDI r10, 1
  LDI r14, 256
  LDI r2, 2934
  LDI r6, 0x0DAEED
  LDI r9, 256
; palette
  LDI r9, 0x70A5
  LDI r0, 1
  LDI r7, 0x0000CC
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xDD0044
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x00FF00
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x8800FF
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x888800
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x008888
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xDD0044
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xFF8800
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xFFAA00
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xFF0000
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xFF8800
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x8800FF
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x8800FF
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x0044FF
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0x880088
  STORE r9, r7
  ADD r9, r9, r0
  LDI r7, 0xFFFFFF
  STORE r9, r7
  ADD r9, r9, r0
  PUSH r2
  PUSH r5
  PUSH r0
  SHR r3, r0, r4
  DIV r2, r12, r1
  MUL r2, r13, r10
  ADD r4, r13, r8
  MUL r13, r25, r9
  POP r0
  POP r5
  POP r2
  SHR r15, r13, r12
  SHLI r1, r10, 5
  SHLI r13, r1, 8
  LDI r3, 128
  LDI r6, 2
  LDI r8, 64
  PSETI
  CMP r14, r15
  JZ r14, else_0
  MUL r15, r4, r7
  SUB r13, r2, r9
  SUB r0, r3, r11
  AND r5, r4, r7
  JMP endif_1
else_0:
  LDI r10, 3204
  LDI r8, 0x59A005
  LDI r15, 3673
  WPIXEL
  LDI r14, 0xC8FFD9
  LDI r11, 2
  LDI r13, 994
  LDI r1, 64
  CIRCLE r14, r11, r13, r1
  LDI r23, 3150
  LDI r12, 0x14D0DE
  LDI r3, 128
  PSET r23, r12, r3
endif_1:
  MOD r10, r8, r3
  OR r14, r8, r1
  XOR r6, r13, r9
  OR r1, r9, r10
  AND r10, r9, r8
main_2:
  SHL r7, r11, r4
  SHR r5, r8, r14
  LDI r14, 0x36638B
  LDI r14, 0xF909E4
  LDI r11, 0x63CE73
  PSET r14, r14, r11
  IKEY r28
  CMPI r28, 171
  JNZ r28, key_3
  IKEY r10
  CMPI r10, 0xA1490B
  JNZ r10, key_4
  ANDI r8, r7, 32
  FRAME
  JMP main_2
