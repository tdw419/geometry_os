; drawing loop program
; initialization
  LDI r15, 0
  LDI r11, 2611
  LDI r9, 2799
  LDI r5, 0x894509
  LDI r12, 1498
main_0:
  ADDI r3, r6, 7
  SHL r1, r4, r5
  SAR r12, r1, r11
  SHLI r9, r4, 256
  SHLI r14, r10, 0xEF8CC9
  FRAME
  JMP main_0
