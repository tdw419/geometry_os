; DESCRIPTION: Draws a purple rectangle at (292, 122) with width 39 and height 17.
; PLAN: r0=292(x), r1=122(y), r2=39(width), r3=17(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 292
LDI r1, 122
LDI r2, 39
LDI r3, 17
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
