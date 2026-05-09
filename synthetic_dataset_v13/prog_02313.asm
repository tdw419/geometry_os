; DESCRIPTION: Draws a blue rectangle at (93, 106) with width 117 and height 94.
; PLAN: r0=93(x), r1=106(y), r2=117(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 93
LDI r1, 106
LDI r2, 117
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
