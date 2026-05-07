; counted animation
; initialization
  LDI r15, 1
  LDI r24, 128
  LDI r11, 0x9651F3
  LDI r4, 3
loop_0:
  OR r9, r11, r4
  OR r1, r7, r11
  LDI r12, 1
  SUB r4, r4, r12
  JNZ r4, loop_0
  HALT
