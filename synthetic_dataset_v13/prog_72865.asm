; DESCRIPTION: Renders a blue box of size 19x106 starting at (426, 84).
; PLAN: r0=426(x), r1=84(y), r2=19(width), r3=106(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 426
LDI r1, 84
LDI r2, 19
LDI r3, 106
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
