; mixed program
; initialization
  LDI r9, 271
  LDI r8, 0x807CEB
  LDI r2, 3101
  LDI r7, 128
  LDI r15, 0xBC8032
  LDI r11, 0x91DBDC
; palette
  LDI r1, 0x80C3
  LDI r9, 1
  LDI r31, 0x000066
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0xFFFF00
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0xFFFFFF
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0x0000FF
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0xFFAA00
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0x000066
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0x000066
  STORE r1, r31
  ADD r1, r1, r9
  LDI r31, 0x0000FF
  STORE r1, r31
  ADD r1, r1, r9
  LDI r6, 0x5894D9
loop_0:
  ADDI r0, r12, 32
  LDI r5, 0x249FA3
  FILL r5
  ANDI r15, r9, 0xD8D54E
  LDI r9, 10
  LDI r12, 64
  LDI r15, 3849
  LDI r9, 0x8F30C9
  LDI r3, 2222
  LINE r9, r12, r15, r9, r3
  LDI r4, 1
  SUB r6, r6, r4
  JNZ r6, loop_0
  AND r7, r0, r13
  OR r10, r0, r1
  ADD r8, r14, r5
  SHL r4, r8, r13
  CMP r2, r13
  HALT
