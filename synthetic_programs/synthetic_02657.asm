; input driven program
; initialization
  LDI r9, 2138
  LDI r2, 64
  LDI r3, 128
main_0:
  SHR r4, r15, r7
  SAR r15, r16, r4
  SAR r13, r15, r8
  SHR r4, r8, r11
  LDI r2, 0x175824
  LDI r2, 64
  LDI r11, 10
  TEXT r2, r2, r11, "HELLO"
  FRAME
  JMP main_0
