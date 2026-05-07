; Synthetic GeOS Program
; initialization
LDI r13, 590
LDI r1, 0xFFFFFF
LDI r11, 599
LDI r20, 494
; main loop
loop_0:
  LDI r21, 16711935
  FILL r21
CIRCLE r15, r11, r10, r23
RECTF r20, r21, r17, r7, r6
PSET r9, r22, r15
  FRAME
  JMP loop_0