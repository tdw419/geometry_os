; counted animation
; initialization
  LDI r14, 4
  LDI r11, 32
  LDI r12, 256
  LDI r20, 0x181FC0
  LDI r5, 0
loop_0:
  LDI r13, 4
  FILL r13
  LDI r1, 1
  SUB r5, r5, r1
  JNZ r5, loop_0
  HALT
