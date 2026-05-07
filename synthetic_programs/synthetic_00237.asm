; input driven program
; initialization
  LDI r8, 0xD41618
  LDI r5, 1
  LDI r13, 2074
  LDI r1, 0x2CF184
main_0:
  CMPI r3, r4, 0xA6CEE1
  XOR r11, r0, r13
  AND r10, r2, r6
  AND r15, r13, r6
  AND r1, r4, r3
  AND r2, r15, r11
  CMP r8, r9
  ANDI r0, r4, 179
  ADDI r25, r6, 0x0331C4
  FRAME
  JMP main_0
