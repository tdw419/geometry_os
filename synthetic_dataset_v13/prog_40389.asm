; DESCRIPTION: Draws a blue rectangle at (105, 93) with width 91 and height 78.
; PLAN: r0=105(x), r1=93(y), r2=91(width), r3=78(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 93
LDI r2, 91
LDI r3, 78
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
