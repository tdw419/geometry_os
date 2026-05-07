; Synthetic GeOS Program
; initialization
LDI r3, 661
LDI r29, 0xFF00FF
LDI r20, 773
LDI r16, 972
; main loop
loop_0:
  LDI r12, 16711935
  FILL r12
PSET r12, r8, r16
CIRCLE r10, r11, r31, r17
  FRAME
  JMP loop_0