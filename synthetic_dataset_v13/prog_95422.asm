; DESCRIPTION: Draws a purple rectangle at (119, 35) with width 82 and height 90.
; PLAN: r0=119(x), r1=35(y), r2=82(width), r3=90(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 119
LDI r1, 35
LDI r2, 82
LDI r3, 90
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
