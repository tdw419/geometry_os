; mixed program
; initialization
  LDI r3, 3199
  LDI r15, 0xEE6A50
  LDI r13, 4
; palette
  LDI r5, 0x2351
  LDI r10, 1
  LDI r3, 0xFF8800
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x00FF00
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x0000FF
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x0000CC
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0xAA00AA
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x8800FF
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x888800
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x00FFAA
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x880088
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0xAA00AA
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0xFF0000
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x0044FF
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x888800
  STORE r5, r3
  ADD r5, r5, r10
  LDI r3, 0x8800FF
  STORE r5, r3
  ADD r5, r5, r10
  LDI r5, 0xCFA0A1
  FILL r5
  CMP r1, r12
  JZ r1, else_0
  DIV r0, r12, r8
  SHL r14, r11, r0
  JMP endif_1
else_0:
  LDI r4, 1718
  LDI r2, 0x2BBCA6
  LDI r13, 0x2A1F94
  LDI r11, 2
  CIRCLE r4, r2, r13, r11
endif_1:
  LDI r5, 4
loop_2:
  ADDI r1, r13, 0x1DFAAB
  MOD r14, r15, r3
  CMPI r2, r4, 10
  ANDI r15, r2, 8
  LDI r6, 1
  SUB r5, r5, r6
  JNZ r5, loop_2
  LDI r4, 0
loop_3:
  CMPI r29, r17, 147
  MUL r10, r1, r0
  ANDI r11, r3, 0x0055A7
  LDI r15, 1
  SUB r4, r4, r15
  JNZ r4, loop_3
  LDI r9, 2736
  LDI r14, 51
  LDI r6, 0x453E9B
  TEXT r9, r14, r6, "HELLO"
  PUSH r2
  PUSH r12
  XOR r19, r7, r0
  XOR r3, r2, r4
  OR r4, r8, r2
  POP r12
  POP r2
  CMP r6, r15
  JZ r6, else_4
  MUL r2, r13, r3
  SUB r4, r5, r10
  DIV r11, r5, r13
  MUL r4, r10, r12
  JMP endif_5
else_4:
  LDI r11, 210
  LDI r6, 0x3DD664
  LDI r11, 32
  LDI r15, 0x9CE916
  CIRCLE r11, r6, r11, r15
endif_5:
  CMPI r19, 32
  HALT
