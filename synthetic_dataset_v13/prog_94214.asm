; DESCRIPTION: Draws a purple rectangle at (111, 34) with width 20 and height 21.
; PLAN: r0=111(x), r1=34(y), r2=20(width), r3=21(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 111
LDI r1, 34
LDI r2, 20
LDI r3, 21
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
HALT
