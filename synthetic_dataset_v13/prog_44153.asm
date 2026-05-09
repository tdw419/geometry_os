; DESCRIPTION: Draws a purple rectangle at (26, 93) with width 38 and height 98.
; PLAN: r0=26(x), r1=93(y), r2=38(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 93
LDI r2, 38
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
