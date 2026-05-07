; drawing loop program
; initialization
  LDI r6, 2
  LDI r4, 0
; palette
  LDI r6, 0x2361
  LDI r3, 1
  LDI r14, 0x008888
  STORE r6, r14
  ADD r6, r6, r3
  LDI r14, 0x0044FF
  STORE r6, r14
  ADD r6, r6, r3
  LDI r14, 0x00FF44
  STORE r6, r14
  ADD r6, r6, r3
  LDI r14, 0x000000
  STORE r6, r14
  ADD r6, r6, r3
  LDI r14, 0xFF8800
  STORE r6, r14
  ADD r6, r6, r3
main_0:
  LDI r2, 3942
  LDI r13, 2812
  LDI r13, 2
  TEXT r2, r13, r13, "HELLO"
  SHL r15, r3, r0
  SHLI r7, r11, 255
  SAR r3, r10, r11
  XOR r12, r2, r6
  OR r3, r2, r10
  FRAME
  JMP main_0
