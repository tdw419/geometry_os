; DESCRIPTION: Draws a purple rectangle at (137, 131) with width 41 and height 96.
; PLAN: r0=137(x), r1=131(y), r2=41(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 137
LDI r1, 131
LDI r2, 41
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
