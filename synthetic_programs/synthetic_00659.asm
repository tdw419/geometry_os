; mixed program
; initialization
  LDI r0, 0xA92951
  LDI r9, 32
  LDI r13, 1464
; palette
  LDI r10, 0x5095
  LDI r1, 1
  LDI r11, 0x0000CC
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0xFF0000
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0x00AAFF
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0x00FF00
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0x8800FF
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0x0044FF
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0x444444
  STORE r10, r11
  ADD r10, r10, r1
  LDI r11, 0x0000CC
  STORE r10, r11
  ADD r10, r10, r1
  IKEY r26
  CMPI r26, 32
  JNZ r26, key_0
  PUSH r2
  OR r8, r14, r3
  OR r4, r8, r10
  XOR r1, r12, r2
  SHR r13, r15, r9
  POP r2
  DIV r0, r10, r7
  CMPI r11, 2
  SHR r13, r4, r8
  SHLI r5, r14, 16
  SAR r8, r10, r4
  LDI r0, 4
  LDI r1, 0x763EE9
  LDI r10, 0x2E3539
  LDI r8, 0x1637CB
  LDI r14, 64
  RECTF r0, r1, r10, r8, r14
  SHL r27, r5, r3
  SHL r14, r7, r12
  SHR r3, r13, r15
  SHL r8, r4, r5
main_1:
  IKEY r8
  CMPI r8, 30
  JNZ r8, key_2
  SHL r0, r8, r11
  SAR r8, r11, r12
  AND r1, r3, r2
  AND r0, r7, r25
  LDI r14, 1048
  LDI r9, 2541
  LDI r2, 3573
  DRAWTEXT r14, r9, r2, "WORLD"
  IKEY r4
  CMPI r4, 187
  JNZ r4, key_3
  LDI r14, 4
  FILL r14
  FRAME
  JMP main_1
