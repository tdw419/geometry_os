; DESCRIPTION: Draws a purple rectangle at (31, 39) with width 91 and height 78.
; PLAN: r0=31(x), r1=39(y), r2=91(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 31
LDI r1, 39
LDI r2, 91
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
