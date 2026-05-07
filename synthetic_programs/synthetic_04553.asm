; mixed program
; initialization
  LDI r13, 10
  LDI r4, 0x056820
  MUL r12, r9, r6
  LDI r15, 248
  STORE r15, r15
  LOAD r8, r15
  LDI r1, 3689
  STORE r1, r13
  LOAD r14, r1
  LDI r11, 4
  STORE r11, r1
  LOAD r2, r11
  LDI r5, 0x23FB0D
  STORE r5, r14
  LOAD r7, r5
  IKEY r1
  CMPI r1, 222
  JNZ r1, key_0
  HALT
