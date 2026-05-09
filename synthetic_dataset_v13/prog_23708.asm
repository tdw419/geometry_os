; DESCRIPTION: Draws a purple rectangle at (380, 90) with width 88 and height 66.
; PLAN: r0=380(x), r1=90(y), r2=88(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 90
LDI r2, 88
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
