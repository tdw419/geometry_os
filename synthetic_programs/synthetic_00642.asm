; mixed program
; initialization
  LDI r13, 0xB16E70
  LDI r10, 8
  LDI r28, 1
  LDI r6, 0x1DF468
; palette
  LDI r5, 0x20FB
  LDI r6, 1
  LDI r12, 0xFF00FF
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0x00FF00
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0xFFFF00
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0x888800
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0x444444
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0xFFAA00
  STORE r5, r12
  ADD r5, r5, r6
  LDI r12, 0xFF4400
  STORE r5, r12
  ADD r5, r5, r6
  LDI r1, 0
  LDI r7, 1031
  LDI r15, 1
  PSET r1, r7, r15
  LDI r3, 0x96411F
  STORE r3, r12
  LOAD r11, r3
  LDI r5, 2
  STORE r5, r14
  LOAD r10, r5
  LDI r5, 3451
  STORE r5, r5
  LOAD r14, r5
  MUL r4, r11, r9
  IKEY r13
  CMPI r13, 64
  JNZ r13, key_0
  CMP r9, r13
  JZ r9, else_1
  OR r5, r10, r9
  JMP endif_2
else_1:
  LDI r13, 10
  LDI r11, 3673
  LDI r27, 2085
  WPIXEL
endif_2:
  LDI r5, 0xB11A12
  LDI r3, 1549
  LDI r9, 3697
  LDI r7, 4
  LDI r10, 256
  LINE r5, r3, r9, r7, r10
  HALT
