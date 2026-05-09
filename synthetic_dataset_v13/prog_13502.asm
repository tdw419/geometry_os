; DESCRIPTION: Draws a blue rectangle at (247, 203) with width 54 and height 51.
; PLAN: r0=247(x), r1=203(y), r2=54(width), r3=51(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 247
LDI r1, 203
LDI r2, 54
LDI r3, 51
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
