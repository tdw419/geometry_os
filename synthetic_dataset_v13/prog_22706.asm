; DESCRIPTION: Draws a purple rectangle at (244, 61) with width 102 and height 98.
; PLAN: r0=244(x), r1=61(y), r2=102(width), r3=98(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 244
LDI r1, 61
LDI r2, 102
LDI r3, 98
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
