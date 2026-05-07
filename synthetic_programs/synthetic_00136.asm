; counted animation
; initialization
  LDI r4, 0
  LDI r12, 0x1D68EC
  LDI r7, 32
  LDI r3, 1
  LDI r5, 255
  LDI r2, 128
  LDI r6, 0x0EEF95
  LDI r8, 0xC631E3
loop_0:
  LDI r6, 0
  LDI r11, 3421
  LDI r12, 332
  LDI r12, 64
  LDI r11, 8
  LINE r6, r11, r12, r12, r11
  ANDI r1, r13, 8
  SUBI r13, r9, 32
  LDI r4, 724
  LDI r4, 0xD26628
  LDI r10, 2626
  WPIXEL
  LDI r4, 1
  SUB r8, r8, r4
  JNZ r8, loop_0
  LDI r1, 128
loop_1:
  CMPI r7, r2, 194
  LDI r6, 1
  SUB r1, r1, r6
  JNZ r1, loop_1
  HALT
