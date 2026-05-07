; simple draw program
; initialization
  LDI r13, 8
  LDI r6, 8
  LDI r12, 3455
  LDI r9, 1069
  LDI r9, 0xE733FD
  LDI r7, 0xB28DBF
  LDI r15, 32
  LDI r11, 4
  LINE r9, r9, r7, r15, r11
  LDI r4, 2375
  LDI r6, 0x0B454C
  LDI r3, 10
  LDI r11, 1070
  LDI r0, 2
  RECTF r4, r6, r3, r11, r0
  LDI r6, 0xE6FA52
  FILL r6
  HALT
