; mixed program
; initialization
  LDI r14, 1
  LDI r15, 3610
  LDI r13, 2586
  LDI r5, 128
  LDI r3, 0xA8C491
  LDI r7, 4
  LDI r19, 1
  LDI r4, 2
; palette
  LDI r1, 0x70C9
  LDI r11, 1
  LDI r12, 0x550077
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFF4400
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFF8800
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xAAAAAA
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x8800FF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xAA00AA
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x0000FF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x888800
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x000000
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x00AAFF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFF00FF
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0xFFEE00
  STORE r1, r12
  ADD r1, r1, r11
  LDI r12, 0x00FFAA
  STORE r1, r12
  ADD r1, r1, r11
  IKEY r9
  CMPI r9, 16
  JNZ r9, key_0
  PUSH r12
  PUSH r9
  PUSH r12
  MUL r6, r4, r0
  SHL r10, r7, r25
  SHR r13, r3, r7
  OR r15, r3, r2
  SUB r3, r6, r0
  POP r12
  POP r9
  POP r12
  LDI r6, 0
loop_1:
  ADD r4, r9, r14
  SUB r31, r13, r7
  LDI r0, 0
  FILL r0
  LDI r8, 1
  SUB r6, r6, r8
  JNZ r6, loop_1
  PUSH r4
  DIV r13, r4, r14
  MUL r8, r1, r6
  MUL r1, r12, r7
  SHR r1, r12, r8
  ADD r12, r0, r7
  POP r4
main_2:
  XOR r8, r2, r5
  OR r13, r15, r14
  FRAME
  JMP main_2
