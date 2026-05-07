; mixed program
; initialization
  LDI r21, 0x80D90D
  LDI r0, 0
; palette
  LDI r15, 0x80C4
  LDI r6, 1
  LDI r1, 0xFF8800
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xFF00FF
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAAFF00
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAAFF00
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0x44FF00
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAA00AA
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0x0000CC
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAAFF00
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAAFF00
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAA00AA
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0x00FF00
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xAAAAAA
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xFF4400
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0x0044FF
  STORE r15, r1
  ADD r15, r15, r6
  LDI r1, 0xFFAA00
  STORE r15, r1
  ADD r15, r15, r6
  IKEY r0
  CMPI r0, 0x9DD902
  JNZ r0, key_0
  AND r4, r6, r13
  XOR r2, r0, r9
  XOR r7, r15, r2
  AND r1, r11, r5
  LDI r2, 17
loop_1:
  SHL r1, r3, r12
  LDI r3, 1
  SUB r2, r2, r3
  JNZ r2, loop_1
  CMPI r11, 0x9C72C8
  CMP r9, r10
  LDI r8, 32
loop_2:
  SUBI r7, r13, 4
  LDI r7, 1
  SUB r8, r8, r7
  JNZ r8, loop_2
  LDI r6, 2
  STORE r6, r0
  LOAD r1, r6
  LDI r30, 0
  STORE r30, r14
  LOAD r2, r30
  LDI r6, 0xB59DA9
  STORE r6, r14
  LOAD r3, r6
  LDI r14, 0xBDA56F
  STORE r14, r12
  LOAD r7, r14
  LDI r4, 8
loop_3:
  MUL r12, r13, r4
  LDI r0, 1
  SUB r4, r4, r0
  JNZ r4, loop_3
  HALT
