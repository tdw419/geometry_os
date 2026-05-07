; mixed program
; initialization
  LDI r1, 1
  LDI r3, 1487
  LDI r8, 255
  LDI r12, 0x852908
  LDI r11, 0xB91B83
; palette
  LDI r2, 0x8029
  LDI r3, 1
  LDI r1, 0xFFAA00
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0x444444
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0x00FF00
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0x0044FF
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0x0044FF
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0xFFAA00
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0xAAAAAA
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0x550077
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0xFFFFFF
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0xFFEE00
  STORE r2, r1
  ADD r2, r2, r3
  LDI r1, 0x008888
  STORE r2, r1
  ADD r2, r2, r3
  LDI r14, 16
  LDI r9, 4
  LDI r10, 2495
  TEXT r14, r9, r10, "HELLO"
  LDI r4, 0x6AD391
  LDI r2, 8
  LDI r7, 10
  LDI r10, 2
  LDI r2, 2
  RECTF r4, r2, r7, r10, r2
  CMPI r10, 0x8FF710
  SHR r14, r12, r2
  SHR r2, r6, r4
  LDI r0, 8
loop_0:
  XOR r0, r14, r4
  LDI r12, 1
  SUB r0, r0, r12
  JNZ r0, loop_0
main_1:
  SHR r5, r0, r8
  SHL r8, r0, r6
  LDI r4, 2845
  LDI r9, 0xA54F91
  LDI r5, 0x08D679
  DRAWTEXT r4, r9, r5, "WORLD"
  FRAME
  JMP main_1
