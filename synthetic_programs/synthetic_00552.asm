; input driven program
; initialization
  LDI r2, 1994
  LDI r12, 1895
  LDI r1, 0x3C366F
  LDI r0, 2
  LDI r11, 0x20C93B
  LDI r6, 0xC8F4EC
main_0:
  LDI r2, 2562
  LDI r0, 2975
  LDI r12, 0
  TEXT r2, r0, r12, "HELLO"
  LDI r1, 255
  LDI r11, 3774
  LDI r2, 0x5FD883
  TEXT r1, r11, r2, "HELLO"
  FRAME
  JMP main_0
