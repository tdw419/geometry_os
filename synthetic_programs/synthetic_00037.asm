; mixed program
; initialization
  LDI r1, 0
  LDI r9, 0x6E8A73
  LDI r19, 0x7647FD
  LDI r6, 0x7F5DDE
  LDI r5, 864
  LDI r13, 2
  STORE r13, r10
  LOAD r6, r13
  LDI r8, 16
  STORE r8, r9
  LOAD r7, r8
  LDI r10, 0x8D4A40
  STORE r10, r4
  LOAD r11, r10
  LDI r7, 0x99C13D
  STORE r7, r10
  LOAD r5, r7
  LDI r3, 256
  STORE r3, r13
  LOAD r7, r3
  PUSH r12
  MOD r10, r4, r7
  MUL r12, r18, r9
  POP r12
  SHR r15, r1, r8
  SHL r13, r4, r15
  LDI r12, 128
  LDI r23, 0x8852D9
  LDI r10, 921
  DRAWTEXT r12, r23, r10, "WORLD"
  SAR r11, r0, r5
  SAR r14, r7, r11
  SHR r2, r1, r4
  LDI r3, 10
loop_0:
  SUBI r8, r4, 192
  OR r5, r6, r8
  LDI r0, 1
  SUB r3, r3, r0
  JNZ r3, loop_0
  LDI r11, 255
  LDI r12, 2584
  LDI r2, 0xEA7D2C
  LDI r0, 0x9C1F75
  CIRCLE r11, r12, r2, r0
main_1:
  CMP r11, r7
  SAR r0, r8, r10
  SHLI r2, r7, 6
  SAR r4, r6, r9
  SHR r4, r5, r3
  SHR r4, r10, r13
  SHLI r8, r6, 0x5E9717
  LDI r24, 1902
  LDI r0, 3904
  LDI r15, 16
  WPIXEL
  LDI r5, 0x108064
  LDI r0, 1823
  LDI r6, 32
  DRAWTEXT r5, r0, r6, "WORLD"
  FRAME
  JMP main_1
