; DESCRIPTION: Draws a purple rectangle at (360, 138) with width 112 and height 105.
; PLAN: r0=360(x), r1=138(y), r2=112(width), r3=105(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 360
LDI r1, 138
LDI r2, 112
LDI r3, 105
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
