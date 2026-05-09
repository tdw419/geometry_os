; DESCRIPTION: Draws a purple rectangle at (41, 135) with width 12 and height 114.
; PLAN: r0=41(x), r1=135(y), r2=12(width), r3=114(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 41
LDI r1, 135
LDI r2, 12
LDI r3, 114
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
