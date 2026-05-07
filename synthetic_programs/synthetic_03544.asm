; input driven program
; initialization
  LDI r1, 0x63AE99
  LDI r11, 737
  LDI r10, 0x6CFDB7
  LDI r6, 0x42D52F
  LDI r3, 255
  LDI r9, 0x9D78BB
  LDI r5, 674
  LDI r4, 0xB83E33
main_0:
  CMPI r12, 64
  LDI r5, 255
  LDI r15, 8
  LDI r7, 255
  LDI r1, 645
  CIRCLE r5, r15, r7, r1
  LDI r11, 0x3F6AD4
  FILL r11
  ADDI r12, r15, 0x701FEE
  ADD r2, r3, r1
  FRAME
  JMP main_0
