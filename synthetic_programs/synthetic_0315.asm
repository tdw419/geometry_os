; Synthetic GeOS Program
; initialization
LDI r31, 888
LDI r15, 1023
LDI r26, 875
LDI r9, 538
LDI r3, 581
LDI r26, 591
; arithmetic section
ADD r31, r26, r24
ADD r0, r2, r10
LDI r12, 677
LDI r9, 1010
ADD r10, r12, r23
LDI r5, 259
LDI r4, 685
; main loop
loop_0:
  LDI r6, 16711935
  FILL r6
RECTF r21, r2, r30, r4, r3
PSET r4, r9, r11
  FRAME
  JMP loop_0