; mixed program
; initialization
  LDI r27, 1
  LDI r9, 3189
  LDI r1, 32
  LDI r3, 16
  LDI r8, 8
  LDI r13, 64
  LDI r14, 0xDA7E45
  CMPI r5, 58
  LDI r12, 2626
  LDI r4, 0
  LDI r15, 0x20F89D
  LDI r7, 2774
  LDI r3, 16
  LINE r12, r4, r15, r7, r3
  PUSH r7
  PUSH r7
  PUSH r6
  PUSH r9
  MUL r4, r13, r3
  SHL r12, r1, r27
  AND r6, r8, r14
  POP r9
  POP r6
  POP r7
  POP r7
  LDI r10, 10
  STORE r10, r7
  LOAD r2, r10
  LDI r7, 32
  STORE r7, r12
  LOAD r5, r7
  LDI r6, 0x919111
  FILL r6
  CMPI r1, 128
main_0:
  IKEY r11
  CMPI r11, 8
  JNZ r11, key_1
  SUBI r11, r0, 145
  SHR r13, r11, r12
  FRAME
  JMP main_0
