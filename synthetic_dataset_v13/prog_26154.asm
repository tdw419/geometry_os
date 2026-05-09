; DESCRIPTION: Draws a purple rectangle at (199, 43) with width 71 and height 33.
; PLAN: r0=199(x), r1=43(y), r2=71(width), r3=33(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 199
LDI r1, 43
LDI r2, 71
LDI r3, 33
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
