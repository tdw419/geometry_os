; counted animation
; initialization
  LDI r7, 10
  LDI r10, 2413
  LDI r11, 26
loop_0:
  XOR r1, r24, r6
  SHR r16, r10, r5
  LDI r9, 1
  SUB r11, r11, r9
  JNZ r11, loop_0
  HALT
