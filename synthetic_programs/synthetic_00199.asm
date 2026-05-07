; mixed program
; initialization
  LDI r15, 1
  LDI r0, 0xB9667B
  LDI r9, 52
  LDI r14, 1081
  LDI r13, 3658
  LDI r1, 0x429767
; palette
  LDI r2, 0x60CD
  LDI r1, 1
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0xFF00FF
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0x00FF44
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0xDD0044
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0x00FF44
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0xFFEE00
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0x0000FF
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0x00FFAA
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0xAA00AA
  STORE r2, r10
  ADD r2, r2, r1
  LDI r10, 0x0044FF
  STORE r2, r10
  ADD r2, r2, r1
  LDI r5, 1662
  LDI r2, 0x50A48D
  LDI r11, 1
  TEXT r5, r2, r11, "HELLO"
  IKEY r9
  CMPI r9, 4
  JNZ r9, key_0
  CMP r0, r1
  JZ r0, else_1
  MOD r2, r0, r5
  ADD r15, r11, r2
  SHR r15, r2, r8
  SHR r14, r0, r11
  JMP endif_2
else_1:
  LDI r14, 0x57746E
  LDI r7, 32
  LDI r10, 0x609554
  LDI r11, 4
  CIRCLE r14, r7, r10, r11
  LDI r12, 3491
  LDI r2, 128
  LDI r4, 256
  PSETI
endif_2:
  IKEY r3
  CMPI r3, 1
  JNZ r3, key_3
  LDI r13, 3959
  STORE r13, r1
  LOAD r4, r13
  LDI r11, 0x7424FD
  STORE r11, r6
  LOAD r10, r11
  LDI r3, 3047
  LDI r3, 0x6C09D7
  LDI r14, 0x546A52
  DRAWTEXT r3, r3, r14, "WORLD"
  OR r3, r25, r9
  XOR r7, r5, r11
  XOR r7, r5, r15
  HALT
