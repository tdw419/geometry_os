; DESCRIPTION: Draws a purple rectangle at (25, 60) with width 93 and height 47.
; PLAN: r0=25(x), r1=60(y), r2=93(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 60
LDI r2, 93
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
