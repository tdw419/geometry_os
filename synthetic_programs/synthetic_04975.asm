; counted animation
; initialization
  LDI r15, 0xA0F5A9
  LDI r9, 0x7C78A7
  LDI r10, 0x62708F
  LDI r6, 0x747B17
  LDI r31, 3287
  LDI r1, 3994
  LDI r8, 0xC28CE6
  LDI r2, 10
loop_0:
  ANDI r12, r1, 0x4D4A08
  SUBI r14, r15, 0xE59975
  ANDI r11, r15, 228
  LDI r7, 1
  SUB r2, r2, r7
  JNZ r2, loop_0
  HALT
