; DESCRIPTION: Draws a purple rectangle at (167, 99) with width 79 and height 66.
; PLAN: r0=167(x), r1=99(y), r2=79(width), r3=66(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 99
LDI r2, 79
LDI r3, 66
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
