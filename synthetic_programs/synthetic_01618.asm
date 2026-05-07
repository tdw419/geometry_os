; input driven program
; initialization
  LDI r8, 32
  LDI r6, 255
main_0:
  LDI r2, 2466
  FILL r2
  SHL r13, r11, r8
  SHLI r3, r2, 8
  SHR r5, r14, r4
  FRAME
  JMP main_0
