; input driven program
; initialization
  LDI r6, 2419
  LDI r0, 2
  LDI r7, 1802
  LDI r9, 0x413C06
  LDI r13, 0xBA42DC
  LDI r14, 0x9EC8A0
main_0:
  LDI r14, 16
  LDI r11, 0x139432
  LDI r12, 128
  TEXT r14, r11, r12, "HELLO"
  LDI r6, 1208
  LDI r12, 8
  LDI r11, 3269
  LDI r30, 1399
  LDI r3, 32
  LINE r6, r12, r11, r30, r3
  SHL r6, r10, r8
  XOR r15, r5, r9
  AND r3, r9, r11
  FRAME
  JMP main_0
