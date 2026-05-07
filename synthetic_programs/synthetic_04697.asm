; input driven program
; initialization
  LDI r11, 0x2C694D
  LDI r5, 1723
  LDI r6, 1649
  LDI r8, 8
  LDI r7, 10
  LDI r25, 0xCA9A47
main_0:
  LDI r6, 3255
  LDI r5, 32
  LDI r0, 1952
  PSETI
  SHR r29, r8, r1
  SHL r14, r7, r1
  FRAME
  JMP main_0
