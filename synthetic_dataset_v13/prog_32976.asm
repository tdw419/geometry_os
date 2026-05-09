; DESCRIPTION: Draws a purple rectangle at (29, 17) with width 10 and height 47.
; PLAN: r0=29(x), r1=17(y), r2=10(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 17
LDI r2, 10
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
