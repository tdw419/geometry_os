; DESCRIPTION: Draws a purple rectangle at (111, 77) with width 93 and height 119.
; PLAN: r0=111(x), r1=77(y), r2=93(width), r3=119(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 77
LDI r2, 93
LDI r3, 119
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
