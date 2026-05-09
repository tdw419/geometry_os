; DESCRIPTION: Draws a purple rectangle at (122, 26) with width 99 and height 39.
; PLAN: r0=122(x), r1=26(y), r2=99(width), r3=39(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 26
LDI r2, 99
LDI r3, 39
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
