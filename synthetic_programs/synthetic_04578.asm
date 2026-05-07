; mixed program
; initialization
  LDI r11, 1633
  LDI r15, 32
; palette
  LDI r9, 0x4032
  LDI r2, 1
  LDI r3, 0x444444
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0x8800FF
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xFFFFFF
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0x00FFAA
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0x00FF00
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xFF8800
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xAA00AA
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0x0044FF
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xAA00AA
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0x44FF00
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xAAAAAA
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xAAFF00
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xFF0000
  STORE r9, r3
  ADD r9, r9, r2
  LDI r3, 0xAAAAAA
  STORE r9, r3
  ADD r9, r9, r2
  SHLI r3, r15, 6
  SAR r2, r15, r8
  SHL r14, r12, r2
  SHL r13, r11, r7
  CALL func_0
func_0:
  DIV r14, r8, r9
  XOR r8, r4, r10
  MUL r12, r0, r3
  RET
  IKEY r3
  CMPI r3, 0x4199D7
  JNZ r3, key_1
  CMP r12, r10
  LDI r4, 3915
  LDI r14, 268
  LDI r0, 0x68C09B
  TEXT r4, r14, r0, "HELLO"
  SHL r10, r13, r15
  SHLI r0, r9, 32
  LDI r9, 0x3AD51F
  LDI r21, 1503
  LDI r2, 1389
  TEXT r9, r21, r2, "HELLO"
main_2:
  LDI r12, 3168
  LDI r11, 0x926BBF
  LDI r2, 0x712D20
  DRAWTEXT r12, r11, r2, "WORLD"
  LDI r7, 1437
  LDI r1, 3141
  LDI r0, 0xE133F6
  LDI r9, 687
  LDI r7, 4
  LINE r7, r1, r0, r9, r7
  IKEY r1
  CMPI r1, 81
  JNZ r1, key_3
  XOR r15, r26, r2
  AND r8, r11, r7
  OR r5, r3, r0
  AND r12, r2, r13
  OR r6, r3, r17
  XOR r14, r6, r12
  FRAME
  JMP main_2
