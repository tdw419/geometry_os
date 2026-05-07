; counted animation
; initialization
  LDI r8, 1822
  LDI r7, 0x3989FC
  LDI r1, 1527
  LDI r4, 524
  LDI r3, 128
loop_0:
  ANDI r2, r3, 64
  LDI r1, 0
  LDI r0, 3566
  LDI r7, 8
  PSETI
  LDI r11, 1
  SUB r3, r3, r11
  JNZ r3, loop_0
  HALT
