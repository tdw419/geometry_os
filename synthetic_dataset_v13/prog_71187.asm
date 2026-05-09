; DESCRIPTION: Draws a blue rectangle at (144, 68) with width 94 and height 112.
; PLAN: r0=144(x), r1=68(y), r2=94(width), r3=112(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 144
LDI r1, 68
LDI r2, 94
LDI r3, 112
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
