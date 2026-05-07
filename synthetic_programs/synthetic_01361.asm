; counted animation
; initialization
  LDI r13, 64
  LDI r7, 0xA83625
  LDI r11, 3445
  LDI r11, 23
loop_0:
  SUB r13, r14, r7
  LDI r6, 1
  SUB r11, r11, r6
  JNZ r11, loop_0
  HALT
