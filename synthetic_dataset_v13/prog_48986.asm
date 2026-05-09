; DESCRIPTION: Draws a purple rectangle at (430, 132) with width 61 and height 11.
; PLAN: r0=430(x), r1=132(y), r2=61(width), r3=11(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 430
LDI r1, 132
LDI r2, 61
LDI r3, 11
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
