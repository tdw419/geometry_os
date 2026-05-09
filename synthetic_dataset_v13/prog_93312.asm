; DESCRIPTION: Draws a purple rectangle at (86, 5) with width 54 and height 107.
; PLAN: r0=86(x), r1=5(y), r2=54(width), r3=107(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 86
LDI r1, 5
LDI r2, 54
LDI r3, 107
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
