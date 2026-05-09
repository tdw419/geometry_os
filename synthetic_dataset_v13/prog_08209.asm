; DESCRIPTION: Draws a purple rectangle at (135, 15) with width 73 and height 91.
; PLAN: r0=135(x), r1=15(y), r2=73(width), r3=91(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 135
LDI r1, 15
LDI r2, 73
LDI r3, 91
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
