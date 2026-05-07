; input driven program
; initialization
  LDI r8, 0x0AC4B1
  LDI r4, 1164
  LDI r9, 10
  LDI r12, 128
  LDI r14, 3828
  LDI r13, 10
  LDI r1, 0xA72D70
main_0:
  DIV r9, r13, r6
  ANDI r1, r8, 0xD07489
  SHR r5, r7, r6
  SAR r11, r25, r5
  FRAME
  JMP main_0
