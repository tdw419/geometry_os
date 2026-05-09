; DESCRIPTION: Draws a purple rectangle at (264, 61) with width 19 and height 47.
; PLAN: r0=264(x), r1=61(y), r2=19(width), r3=47(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 264
LDI r1, 61
LDI r2, 19
LDI r3, 47
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
