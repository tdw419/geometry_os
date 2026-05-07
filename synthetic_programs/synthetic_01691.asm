; counted animation
; initialization
  LDI r3, 1189
  LDI r10, 2317
  LDI r8, 2
  LDI r5, 64
loop_0:
  ANDI r6, r13, 1
  ANDI r13, r11, 0x9261E9
  LDI r23, 1
  SUB r5, r5, r23
  JNZ r5, loop_0
  HALT
