; DESCRIPTION: Draws a purple rectangle at (50, 105) with width 71 and height 79.
; PLAN: r0=50(x), r1=105(y), r2=71(width), r3=79(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 105
LDI r2, 71
LDI r3, 79
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
