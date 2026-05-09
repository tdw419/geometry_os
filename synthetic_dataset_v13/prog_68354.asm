; DESCRIPTION: Draws a blue rectangle at (94, 22) with width 106 and height 111.
; PLAN: r0=94(x), r1=22(y), r2=106(width), r3=111(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 94
LDI r1, 22
LDI r2, 106
LDI r3, 111
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
