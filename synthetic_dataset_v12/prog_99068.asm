; DESCRIPTION: Draws a blue rectangle at (163, 125) with width 61 and height 83.
; PLAN: r0=163(x), r1=125(y), r2=61(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 125
LDI r2, 61
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
