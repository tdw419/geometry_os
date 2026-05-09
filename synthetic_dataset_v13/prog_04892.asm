; DESCRIPTION: Draws a purple rectangle at (471, 11) with width 21 and height 72.
; PLAN: r0=471(x), r1=11(y), r2=21(width), r3=72(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 471
LDI r1, 11
LDI r2, 21
LDI r3, 72
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
