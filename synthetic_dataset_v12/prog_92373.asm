; DESCRIPTION: Draws a blue rectangle at (453, 2) with width 17 and height 116.
; PLAN: r0=453(x), r1=2(y), r2=17(width), r3=116(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 2
LDI r2, 17
LDI r3, 116
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
