; DESCRIPTION: Draws a purple rectangle at (265, 66) with width 52 and height 38.
; PLAN: r0=265(x), r1=66(y), r2=52(width), r3=38(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 66
LDI r2, 52
LDI r3, 38
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
