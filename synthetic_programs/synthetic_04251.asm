; mixed program
; initialization
  LDI r3, 2394
  LDI r11, 10
  LDI r30, 2624
  LDI r7, 2903
  LDI r1, 0x9FEB91
; palette
  LDI r5, 0x209D
  LDI r4, 1
  LDI r12, 0x44FF00
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x550077
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0xDD0044
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x0000CC
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x444444
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x000066
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x880088
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x000066
  STORE r5, r12
  ADD r5, r5, r4
  LDI r12, 0x00FFAA
  STORE r5, r12
  ADD r5, r5, r4
  XOR r0, r13, r24
  LDI r11, 3045
  LDI r3, 0xF41625
  LDI r11, 324
  TEXT r11, r3, r11, "HELLO"
  CMPI r13, 255
  SHR r4, r10, r9
  SHL r13, r15, r8
  SHR r2, r7, r13
  SHR r2, r4, r11
main_0:
  SHL r21, r8, r6
  AND r9, r15, r14
  XOR r11, r7, r3
  XOR r2, r4, r3
  IKEY r27
  CMPI r27, 64
  JNZ r27, key_1
  LDI r6, 0x06A834
  FILL r6
  LDI r4, 450
  LDI r20, 0xF30DA8
  LDI r2, 1584
  DRAWTEXT r4, r20, r2, "WORLD"
  FRAME
  JMP main_0
