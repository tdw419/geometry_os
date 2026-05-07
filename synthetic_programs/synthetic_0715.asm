; Synthetic GeOS Program
; initialization
LDI r17, 476
LDI r20, 457
; main loop
loop_0:
  LDI r27, 16711935
  FILL r27
CIRCLE r15, r13, r10, r2
PSET r2, r11, r24
  FRAME
  JMP loop_0