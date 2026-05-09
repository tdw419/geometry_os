; DESCRIPTION: Renders a blue box of size 118x97 starting at (155, 145).
; PLAN: r0=155(x), r1=145(y), r2=118(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 155
LDI r1, 145
LDI r2, 118
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
