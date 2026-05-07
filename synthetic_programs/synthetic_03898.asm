; mixed program
; initialization
  LDI r2, 128
  LDI r13, 0x347822
  LDI r9, 480
  LDI r7, 0x03ED42
  LDI r15, 0xBB4CA2
  LDI r8, 3828
; palette
  LDI r12, 0x2198
  LDI r4, 1
  LDI r17, 0x00FFAA
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0xFF8800
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0xAAAAAA
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0xFF0000
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0x00FFFF
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0x0000FF
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0x880088
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0x00FFAA
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0x000000
  STORE r12, r17
  ADD r12, r12, r4
  LDI r17, 0x0000CC
  STORE r12, r17
  ADD r12, r12, r4
  LDI r1, 4
  STORE r1, r8
  LOAD r10, r1
  LDI r15, 3947
  STORE r15, r0
  LOAD r4, r15
  LDI r11, 10
loop_0:
  ANDI r6, r7, 16
  ADDI r7, r11, 100
  LDI r4, 1
  SUB r11, r11, r4
  JNZ r11, loop_0
  SHR r11, r2, r9
  SHLI r14, r0, 0x564D04
  IKEY r14
  CMPI r14, 0x554393
  JNZ r14, key_1
  LDI r5, 32
  LDI r14, 3706
  LDI r11, 0x595473
  LDI r3, 49
  LDI r12, 0x1FF118
  LINE r5, r14, r11, r3, r12
  IKEY r10
  CMPI r10, 0x71CDE0
  JNZ r10, key_2
  AND r13, r5, r14
  XOR r6, r4, r0
  OR r15, r5, r8
  SHLI r5, r12, 128
  SHLI r1, r12, 0x62C032
  SHR r26, r3, r14
  HALT
