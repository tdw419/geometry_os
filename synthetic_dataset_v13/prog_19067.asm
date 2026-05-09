; DESCRIPTION: Renders a blue box of size 12x84 starting at (44, 94).
; PLAN: r0=44(x), r1=94(y), r2=12(width), r3=84(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 94
LDI r2, 12
LDI r3, 84
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
