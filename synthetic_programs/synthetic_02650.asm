; input driven program
; initialization
  LDI r6, 64
  LDI r11, 2580
main_0:
  LDI r2, 32
  LDI r4, 256
  LDI r0, 4
  LDI r4, 0
  LDI r7, 16
  LINE r2, r4, r0, r4, r7
  DIV r2, r14, r3
  SAR r11, r6, r7
  SAR r9, r12, r27
  CMPI r0, 0xEC870F
  FRAME
  JMP main_0
