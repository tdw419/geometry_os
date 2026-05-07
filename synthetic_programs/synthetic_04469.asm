; mixed program
; initialization
  LDI r15, 0
  LDI r6, 0x7A8F51
  LDI r8, 1750
  LDI r12, 1155
; palette
  LDI r3, 0x50DB
  LDI r2, 1
  LDI r12, 0xFF0000
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x0044FF
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x00FFAA
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x000000
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x550077
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x00FFAA
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x44FF00
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0xFFFF00
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x000000
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x008888
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x00AAFF
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0x00FF44
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0xFFFF00
  STORE r3, r12
  ADD r3, r3, r2
  LDI r12, 0xFFEE00
  STORE r3, r12
  ADD r3, r3, r2
  LDI r13, 780
  LDI r1, 0xD440DF
  LDI r3, 1178
  LDI r14, 0x8BEAEE
  LDI r1, 32
  LINE r13, r1, r3, r14, r1
  IKEY r15
  CMPI r15, 255
  JNZ r15, key_0
  LDI r6, 10
  LDI r3, 128
  LDI r2, 128
  TEXT r6, r3, r2, "HELLO"
  CMP r0, r9
  JNZ r0, else_1
  MUL r8, r13, r6
  OR r5, r1, r14
  JMP endif_2
else_1:
  LDI r6, 1
  LDI r11, 1425
  LDI r12, 2710
  LDI r14, 2024
  CIRCLE r6, r11, r12, r14
endif_2:
  LDI r2, 1
  LDI r25, 0x5E3B91
  LDI r10, 64
  PSET r2, r25, r10
  LDI r2, 3426
  LDI r5, 128
  LDI r2, 4
  LDI r4, 8
  CIRCLE r2, r5, r2, r4
  LDI r12, 0x521F6E
loop_3:
  LDI r6, 0x179A79
  LDI r3, 0xC31452
  LDI r1, 32
  PSETI
  LDI r3, 1
  SUB r12, r12, r3
  JNZ r12, loop_3
  IKEY r2
  CMPI r2, 0x6C7D9C
  JNZ r2, key_4
  HALT
