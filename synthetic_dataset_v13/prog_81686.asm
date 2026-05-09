; DESCRIPTION: Draws a purple rectangle at (54, 98) with width 43 and height 64.
; PLAN: r0=54(x), r1=98(y), r2=43(width), r3=64(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 98
LDI r2, 43
LDI r3, 64
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
