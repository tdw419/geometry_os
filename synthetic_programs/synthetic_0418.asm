; Synthetic GeOS Program
; initialization
LDI r29, 861
LDI r15, 698
; main loop
loop_0:
  LDI r0, 0
  FILL r0
RECTF r21, r26, r24, r1, r31
PSET r25, r0, r24
  FRAME
  JMP loop_0