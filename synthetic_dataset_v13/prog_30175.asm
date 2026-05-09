; DESCRIPTION: Draws a purple rectangle at (306, 189) with width 47 and height 62.
; PLAN: r0=306(x), r1=189(y), r2=47(width), r3=62(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 189
LDI r2, 47
LDI r3, 62
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
