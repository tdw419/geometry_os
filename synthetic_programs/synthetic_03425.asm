; drawing loop program
; initialization
  LDI r4, 4
  LDI r8, 32
  LDI r10, 128
  LDI r7, 4
  LDI r0, 1688
  LDI r31, 0
  LDI r6, 90
; palette
  LDI r7, 0x22C2
  LDI r1, 1
  LDI r4, 0xDD0044
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0xFFFFFF
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x000066
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x888800
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x550077
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x00FF44
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0xFF8800
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x0000FF
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x000066
  STORE r7, r4
  ADD r7, r7, r1
  LDI r4, 0x0044FF
  STORE r7, r4
  ADD r7, r7, r1
main_0:
  CMPI r4, r15, 0x9C44FC
  LDI r13, 255
  LDI r25, 1724
  LDI r7, 148
  DRAWTEXT r13, r25, r7, "WORLD"
  SHR r14, r11, r9
  IKEY r5
  CMPI r5, 131
  JNZ r5, key_1
  LDI r4, 256
  LDI r1, 1086
  LDI r5, 4
  TEXT r4, r1, r5, "HELLO"
  SHL r4, r14, r2
  FRAME
  JMP main_0
