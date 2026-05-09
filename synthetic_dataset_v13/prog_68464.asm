; DESCRIPTION: Renders a blue box of size 110x34 starting at (359, 194).
; PLAN: r0=359(x), r1=194(y), r2=110(width), r3=34(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 359
LDI r1, 194
LDI r2, 110
LDI r3, 34
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
