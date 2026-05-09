; DESCRIPTION: Draws a purple rectangle at (296, 166) with width 107 and height 78.
; PLAN: r0=296(x), r1=166(y), r2=107(width), r3=78(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 166
LDI r2, 107
LDI r3, 78
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
