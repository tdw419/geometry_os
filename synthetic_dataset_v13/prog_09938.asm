; DESCRIPTION: Draws a blue rectangle at (163, 81) with width 90 and height 113.
; PLAN: r0=163(x), r1=81(y), r2=90(width), r3=113(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 81
LDI r2, 90
LDI r3, 113
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
