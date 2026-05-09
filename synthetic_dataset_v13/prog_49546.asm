; DESCRIPTION: Draws a purple rectangle at (222, 10) with width 102 and height 41.
; PLAN: r0=222(x), r1=10(y), r2=102(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 10
LDI r2, 102
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
