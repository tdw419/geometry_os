; DESCRIPTION: Draws a purple rectangle at (49, 97) with width 108 and height 59.
; PLAN: r0=49(x), r1=97(y), r2=108(width), r3=59(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 49
LDI r1, 97
LDI r2, 108
LDI r3, 59
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
