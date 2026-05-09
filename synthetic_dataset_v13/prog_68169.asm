; DESCRIPTION: Draws a purple rectangle at (306, 53) with width 74 and height 38.
; PLAN: r0=306(x), r1=53(y), r2=74(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 53
LDI r2, 74
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
