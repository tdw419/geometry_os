; DESCRIPTION: Draws a purple rectangle at (382, 142) with width 68 and height 78.
; PLAN: r0=382(x), r1=142(y), r2=68(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 142
LDI r2, 68
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
