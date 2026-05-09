; DESCRIPTION: Draws a blue rectangle at (318, 141) with width 20 and height 112.
; PLAN: r0=318(x), r1=141(y), r2=20(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 141
LDI r2, 20
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
