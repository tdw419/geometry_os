; mixed program
; initialization
  LDI r1, 4
  LDI r2, 0xF482F8
  LDI r15, 0x5927CF
  LDI r0, 2402
  LDI r3, 255
  LDI r12, 1662
  LDI r6, 0
  LDI r11, 2340
; palette
  LDI r15, 0x50A6
  LDI r0, 1
  LDI r5, 0x0000FF
  STORE r15, r5
  ADD r15, r15, r0
  LDI r5, 0xFFAA00
  STORE r15, r5
  ADD r15, r15, r0
  LDI r5, 0x444444
  STORE r15, r5
  ADD r15, r15, r0
  LDI r5, 0xFFAA00
  STORE r15, r5
  ADD r15, r15, r0
  LDI r5, 0x00FF44
  STORE r15, r5
  ADD r15, r15, r0
  LDI r5, 0xFFFFFF
  STORE r15, r5
  ADD r15, r15, r0
  IKEY r12
  CMPI r12, 91
  JNZ r12, key_0
  IKEY r0
  CMPI r0, 8
  JNZ r0, key_1
  SUB r15, r5, r8
  SHLI r7, r2, 0xF74258
  SHR r3, r14, r0
  PUSH r6
  PUSH r11
  PUSH r11
  SHR r7, r5, r0
  MOD r14, r13, r16
  XOR r13, r6, r14
  XOR r13, r8, r11
  POP r11
  POP r11
  POP r6
  ADD r6, r10, r15
  PUSH r4
  PUSH r18
  PUSH r6
  SUB r5, r11, r8
  SUB r8, r13, r7
  MUL r11, r14, r0
  SUB r3, r7, r15
  ADD r5, r15, r1
  POP r6
  POP r18
  POP r4
  PUSH r10
  PUSH r1
  PUSH r30
  PUSH r12
  SHR r2, r0, r9
  DIV r4, r10, r1
  DIV r4, r11, r0
  SUB r9, r7, r6
  POP r12
  POP r30
  POP r1
  POP r10
main_2:
  LDI r9, 4
  FILL r9
  ANDI r0, r15, 235
  AND r9, r14, r1
  AND r7, r5, r8
  LDI r11, 0x2BBEDF
  LDI r9, 0x8FD3FE
  LDI r10, 64
  TEXT r11, r9, r10, "HELLO"
  LDI r0, 2712
  LDI r3, 0x341EFB
  LDI r5, 64
  DRAWTEXT r0, r3, r5, "WORLD"
  FRAME
  JMP main_2
