; mixed program
; initialization
  LDI r13, 255
  LDI r11, 1
  LDI r5, 322
  LDI r9, 10
; palette
  LDI r6, 0x4090
  LDI r11, 1
  LDI r7, 0x0044FF
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x000066
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x00FFFF
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x8800FF
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0xAAAAAA
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x00FFFF
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x00FFAA
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0xFFFF00
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0xAAAAAA
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0xFF0000
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0xAAAAAA
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0xFF0000
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x000066
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x880088
  STORE r6, r7
  ADD r6, r6, r11
  LDI r7, 0x0044FF
  STORE r6, r7
  ADD r6, r6, r11
  LDI r1, 0xA1E3AF
  LDI r10, 10
  LDI r9, 0xC437CB
  TEXT r1, r10, r9, "HELLO"
  LDI r6, 1
loop_0:
  CMPI r14, r9, 70
  LDI r5, 4
  LDI r1, 16
  LDI r15, 1
  WPIXEL
  LDI r2, 1
  SUB r6, r6, r2
  JNZ r6, loop_0
  PUSH r2
  PUSH r11
  PUSH r7
  MUL r11, r1, r30
  SUB r15, r9, r4
  OR r11, r4, r1
  POP r7
  POP r11
  POP r2
  LDI r15, 2
  LDI r25, 16
  LDI r5, 543
  TEXT r15, r25, r5, "HELLO"
  LDI r14, 3780
  LDI r7, 1382
  LDI r6, 1015
  TEXT r14, r7, r6, "HELLO"
  HALT
