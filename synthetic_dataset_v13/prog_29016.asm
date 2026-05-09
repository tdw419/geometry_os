; DESCRIPTION: Draws a purple rectangle at (120, 8) with width 43 and height 54.
; PLAN: r0=120(x), r1=8(y), r2=43(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 8
LDI r2, 43
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
