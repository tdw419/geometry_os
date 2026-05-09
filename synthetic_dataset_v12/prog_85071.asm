; DESCRIPTION: Draws a blue rectangle at (149, 118) with width 52 and height 117.
; PLAN: r0=149(x), r1=118(y), r2=52(width), r3=117(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 118
LDI r2, 52
LDI r3, 117
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
