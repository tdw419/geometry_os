; DESCRIPTION: Draws a purple rectangle at (61, 72) with width 65 and height 41.
; PLAN: r0=61(x), r1=72(y), r2=65(width), r3=41(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 72
LDI r2, 65
LDI r3, 41
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
