; DESCRIPTION: Draws a purple rectangle at (346, 13) with width 43 and height 78.
; PLAN: r0=346(x), r1=13(y), r2=43(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 13
LDI r2, 43
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
