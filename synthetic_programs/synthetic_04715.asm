; drawing loop program
; initialization
  LDI r10, 64
  LDI r9, 0xFCE68B
  LDI r2, 128
  LDI r1, 3725
  LDI r11, 0xE4DE46
  LDI r3, 721
  LDI r12, 16
  LDI r15, 1480
main_0:
  SHL r0, r1, r11
  SHL r12, r6, r11
  SHL r12, r6, r2
  SAR r0, r10, r14
  CMPI r10, 250
  FRAME
  JMP main_0
