; DESCRIPTION: Draws a purple rectangle at (70, 25) with width 82 and height 73.
; PLAN: r0=70(x), r1=25(y), r2=82(width), r3=73(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 25
LDI r2, 82
LDI r3, 73
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
