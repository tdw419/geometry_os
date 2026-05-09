; DESCRIPTION: Draws a purple rectangle at (54, 12) with width 91 and height 94.
; PLAN: r0=54(x), r1=12(y), r2=91(width), r3=94(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 54
LDI r1, 12
LDI r2, 91
LDI r3, 94
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
