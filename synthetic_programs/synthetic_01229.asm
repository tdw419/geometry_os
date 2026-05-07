; drawing loop program
; initialization
  LDI r12, 1
  LDI r13, 3720
  LDI r1, 1738
main_0:
  ADDI r7, r0, 2
  SHL r9, r1, r11
  SAR r1, r7, r11
  CMPI r2, r9, 256
  FRAME
  JMP main_0
