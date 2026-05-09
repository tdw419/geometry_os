; DESCRIPTION: Draws a blue rectangle at (355, 93) with width 17 and height 119.
; PLAN: r0=355(x), r1=93(y), r2=17(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 93
LDI r2, 17
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
