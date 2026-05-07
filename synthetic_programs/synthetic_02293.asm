; input driven program
; initialization
  LDI r13, 0x57CB21
  LDI r15, 16
main_0:
  MUL r3, r0, r13
  SHLI r13, r15, 1
  SHLI r12, r28, 0xDD3A0D
  SHR r22, r2, r11
  SHR r13, r3, r15
  CMPI r15, r12, 60
  FRAME
  JMP main_0
