; DESCRIPTION: Draws a purple rectangle at (296, 29) with width 53 and height 23.
; PLAN: r0=296(x), r1=29(y), r2=53(width), r3=23(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 296
LDI r1, 29
LDI r2, 53
LDI r3, 23
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
