; mixed program
; initialization
  LDI r3, 10
  LDI r12, 684
  LDI r15, 128
  LDI r13, 3919
; palette
  LDI r10, 0x3020
  LDI r1, 1
  LDI r3, 0x8800FF
  STORE r10, r3
  ADD r10, r10, r1
  LDI r3, 0x0044FF
  STORE r10, r3
  ADD r10, r10, r1
  LDI r3, 0x0044FF
  STORE r10, r3
  ADD r10, r10, r1
  LDI r3, 0x0000CC
  STORE r10, r3
  ADD r10, r10, r1
  LDI r3, 0xFF8800
  STORE r10, r3
  ADD r10, r10, r1
  CMPI r11, 179
  CALL func_0
func_0:
  XOR r7, r14, r4
  MUL r13, r9, r19
  DIV r14, r1, r8
  AND r9, r15, r12
  XOR r14, r6, r1
  RET
  LDI r12, 3816
  LDI r9, 1490
  LDI r15, 2
  LDI r0, 2008
  LDI r9, 8
  LINE r12, r9, r15, r0, r9
  LDI r12, 64
  STORE r12, r8
  LOAD r4, r12
  LDI r12, 0x5A57E0
  STORE r12, r0
  LOAD r7, r12
  LDI r13, 3494
  STORE r13, r12
  LOAD r23, r13
  LDI r4, 1281
  STORE r4, r7
  LOAD r8, r4
  LDI r12, 20x23FF37
  STORE r12, r15
  LOAD r3, r12
  LDI r0x21FD0, 32
  STORE r10, r10
  LOAD r8, r10
  DIV r4, r0, r1
  LDI r14, 8
loop_1:
  MUL r6, r10, r19
  SUB r13, r2, r1
  LDI r15, 1
  SUB r14, r14, r15
  JNZ r14, loop_1
  HALT
