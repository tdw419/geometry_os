; DESCRIPTION: Draws a purple rectangle at (157, 28) with width 106 and height 20.
; PLAN: r0=157(x), r1=28(y), r2=106(width), r3=20(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 157
LDI r1, 28
LDI r2, 106
LDI r3, 20
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
