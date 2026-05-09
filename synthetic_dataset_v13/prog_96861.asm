; DESCRIPTION: Draws a purple rectangle at (485, 43) with width 26 and height 112.
; PLAN: r0=485(x), r1=43(y), r2=26(width), r3=112(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 43
LDI r2, 26
LDI r3, 112
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
