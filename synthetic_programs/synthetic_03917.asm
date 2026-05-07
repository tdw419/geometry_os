; mixed program
; initialization
  LDI r0, 256
  LDI r15, 256
  LDI r5, 464
  LDI r10, 0x1476BA
; palette
  LDI r1, 0x2386
  LDI r6, 1
  LDI r3, 0xFF8800
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0x00FF00
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0xFF0000
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0xFF0000
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0xFFFF00
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0x0000CC
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0x880088
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0xFF00FF
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0xFFAA00
  STORE r1, r3
  ADD r1, r1, r6
  LDI r3, 0x000066
  STORE r1, r3
  ADD r1, r1, r6
  LDI r5, 0x74CE7E
  LDI r1, 3515
  LDI r11, 0xFD5576
  DRAWTEXT r5, r1, r11, "WORLD"
  LDI r12, 40
loop_0:
  ANDI r14, r3, 162
  LDI r9, 1
  SUB r12, r12, r9
  JNZ r12, loop_0
  LDI r12, 0xAC9053
loop_1:
  ADDI r4, r12, 0x86EF95
  LDI r7, 3643
  LDI r3, 256
  LDI r13, 0xAC7EE2
  PSETI
  LDI r10, 1
  SUB r12, r12, r10
  JNZ r12, loop_1
  LDI r13, 0x426E51
loop_2:
  ANDI r12, r25, 0
  LDI r2, 1
  SUB r13, r13, r2
  JNZ r13, loop_2
  CMP r9, r6
  LDI r12, 128
  STORE r12, r4
  LOAD r15, r12
  LDI r3, 255
  STORE r3, r11
  LOAD r5, r3
  LDI r0, 0xC2CAAF
  STORE r0, r8
  LOAD r2, r0
  CALL func_3
func_3:
  AND r13, r6, r14
  XOR r3, r5, r9
  DIV r8, r10, r6
  RET
  CALL func_4
func_4:
  MOD r3, r7, r14
  SHL r0, r12, r1
  DIV r0, r5, r9
  RET
  HALT
