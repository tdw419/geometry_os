; DESCRIPTION: Draws a purple rectangle at (132, 7) with width 41 and height 96.
; PLAN: r0=132(x), r1=7(y), r2=41(width), r3=96(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 132
LDI r1, 7
LDI r2, 41
LDI r3, 96
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
