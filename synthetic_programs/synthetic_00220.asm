; input driven program
; initialization
  LDI r0, 0xB760DE
  LDI r6, 3343
  LDI r15, 8
main_0:
  CMPI r12, 0x76359E
  LDI r7, 10
  LDI r6, 0x7755F3
  LDI r15, 435
  TEXT r7, r6, r15, "HELLO"
  SHR r1, r14, r6
  SHR r6, r11, r2
  FRAME
  JMP main_0
