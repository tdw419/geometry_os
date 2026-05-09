; DESCRIPTION: Renders a blue box of size 89x97 starting at (302, 25).
; PLAN: r0=302(x), r1=25(y), r2=89(width), r3=97(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 25
LDI r2, 89
LDI r3, 97
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
