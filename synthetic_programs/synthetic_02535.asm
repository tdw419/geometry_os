; drawing loop program
; initialization
  LDI r14, 550
  LDI r1, 0x1174EA
  LDI r11, 32
  LDI r8, 255
  LDI r9, 1739
  LDI r2, 998
  LDI r5, 0x701F03
  LDI r3, 0xD8CB8D
main_0:
  SHR r14, r7, r0
  SAR r8, r5, r10
  SAR r11, r13, r10
  SAR r8, r14, r4
  ANDI r12, r11, 61
  FRAME
  JMP main_0
