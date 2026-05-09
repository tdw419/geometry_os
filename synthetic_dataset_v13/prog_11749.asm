; DESCRIPTION: Draws a purple rectangle at (324, 34) with width 87 and height 54.
; PLAN: r0=324(x), r1=34(y), r2=87(width), r3=54(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 324
LDI r1, 34
LDI r2, 87
LDI r3, 54
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
