; DESCRIPTION: Draws a blue rectangle at (93, 200) with width 99 and height 26.
; PLAN: r0=93(x), r1=200(y), r2=99(width), r3=26(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 200
LDI r2, 99
LDI r3, 26
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
