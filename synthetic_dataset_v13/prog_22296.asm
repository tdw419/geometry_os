; DESCRIPTION: Draws a blue rectangle at (318, 95) with width 53 and height 106.
; PLAN: r0=318(x), r1=95(y), r2=53(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 95
LDI r2, 53
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
