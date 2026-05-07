; input driven program
; initialization
  LDI r11, 64
  LDI r2, 16
  LDI r5, 8
  LDI r15, 803
main_0:
  OR r9, r12, r14
  OR r3, r11, r8
  CMPI r9, 64
  FRAME
  JMP main_0
