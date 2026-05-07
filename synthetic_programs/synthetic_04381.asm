; input driven program
; initialization
  LDI r7, 0xD1E118
  LDI r5, 0x54565E
  LDI r8, 3783
  LDI r13, 3134
  LDI r10, 128
main_0:
  LDI r27, 8
  LDI r12, 585
  LDI r18, 4
  TEXT r27, r12, r18, "HELLO"
  SUBI r14, r7, 161
  LDI r11, 0x976DFC
  FILL r11
  FRAME
  JMP main_0
