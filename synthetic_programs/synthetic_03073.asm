; mixed program
; initialization
  LDI r1, 0x027988
  LDI r5, 2
  LDI r2, 3898
; palette
  LDI r14, 0x240A
  LDI r12, 1
  LDI r3, 0xFF00FF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x0044FF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x880088
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x44FF00
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xAAFF00
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x000066
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x000066
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFF00FF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x888800
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0x550077
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFF00FF
  STORE r14, r3
  ADD r14, r14, r12
  LDI r3, 0xFFAA00
  STORE r14, r3
  ADD r14, r14, r12
  CALL func_0
func_0:
  SHR r12, r8, r15
  ADD r10, r6, r9
  OR r6, r12, r14
  AND r11, r3, r8
  RET
  IKEY r3
  CMPI r3, 255
  JNZ r3, key_1
  LDI r14, 0x50C8
  STORE r14, r7
  LOAD r15, r14
  LDI r24, 0xE26A63
  STORE r24, r3
  LOAD r2, r24
  LDI r7, 256
  STORE r7, r13
  LOAD r28, r7
  LDI r6, 0x85FEC5
  STORE r6, r1
  LOAD r14, r6
  LDI r13, 64
  STORE r13, r10
  LOAD r18, r13
  SUB r4, r0, r13
  LDI r26, 2026
  STORE r26, r10
  LOAD r14, r26
  LDI r10, 1
  STORE r10, r10
  LOAD r9, r10
  LDI r12, 3306
  STORE r12, r13
  LOAD r6, r12
  CALL func_2
func_2:
  OR r3, r11, r10
  ADD r11, r10, r5
  MOD r2, r14, r4
  MOD r0, r10, r12
  SUB r11, r9, r14
  RET
  LDI r9, 3197
  STORE r9, r15
  LOAD r8, r9
  LDI r30, 1486
  STORE r30, r11
  LOAD r9, r30
  IKEY r5
  CMPI r5, 32
  JNZ r5, key_3
main_4:
  SUBI r3, r6, 8
  SHR r11, r8, r14
  SAR r7, r10, r4
  SHLI r4, r2, 3
  SHL r12, r14, r6
  FRAME
  JMP main_4
