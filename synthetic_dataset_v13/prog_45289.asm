; DESCRIPTION: Draws a purple rectangle at (138, 38) with width 108 and height 62.
; PLAN: r0=138(x), r1=38(y), r2=108(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 138
LDI r1, 38
LDI r2, 108
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
