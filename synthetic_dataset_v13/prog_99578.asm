; DESCRIPTION: Draws a purple rectangle at (296, 151) with width 18 and height 12.
; PLAN: r0=296(x), r1=151(y), r2=18(width), r3=12(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 151
LDI r2, 18
LDI r3, 12
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
