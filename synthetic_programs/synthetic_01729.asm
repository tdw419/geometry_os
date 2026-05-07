; mixed program
; initialization
  LDI r14, 0
  LDI r1, 0xBAB030
  LDI r3, 10
  LDI r10, 10
  LDI r5, 0x60292A
  LDI r8, 0x452755
  LDI r2, 3581
; palette
  LDI r12, 0x225E
  LDI r5, 1
  LDI r15, 0xAA00AA
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x888800
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x0000CC
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x0000CC
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0xFF0000
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0xFFAA00
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0xFF4400
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0xFF0000
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x0000FF
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x00FF00
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x888800
  STORE r12, r15
  ADD r12, r12, r5
  LDI r15, 0x0000CC
  STORE r12, r15
  ADD r12, r12, r5
  CMP r1, r0
  JNZ r1, else_0
  MUL r8, r12, r11
  JMP endif_1
else_0:
  LDI r20, 0x15F48C
  LDI r1, 1884
  LDI r11, 482
  LDI r2, 256
  LDI r5, 1906
  LINE r20, r1, r11, r2, r5
endif_1:
  PUSH r15
  PUSH r10
  PUSH r9
  ADD r1, r13, r3
  SUB r13, r28, r14
  POP r9
  POP r10
  POP r15
  CMP r12, r3
  SAR r2, r4, r15
  SHL r14, r11, r13
  SHLI r15, r0, 0x98EBF9
  LDI r1, 0x2C909B
  STORE r1, r11
  LOAD r9, r1
  LDI r15, 0x1055A7
  STORE r15, r3
  LOAD r7, r15
  LDI r12, 256
  STORE r12, r12
  LOAD r6, r12
  LDI r11, 1836
  STORE r11, r15
  LOAD r14, r11
  IKEY r2
  CMPI r2, 10
  JNZ r2, key_2
  LDI r5, 1
loop_3:
  LDI r6, 1
  LDI r1, 64
  LDI r11, 0x54BB23
  PSETI
  MOD r0, r15, r14
  SHL r6, r8, r12
  LDI r10, 1
  SUB r5, r5, r10
  JNZ r5, loop_3
  PUSH r14
  SHR r27, r3, r14
  MUL r15, r8, r14
  POP r14
  HALT
