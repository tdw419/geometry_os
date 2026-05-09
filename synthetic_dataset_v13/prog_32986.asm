; DESCRIPTION: Renders a blue box of size 89x18 starting at (8, 97).
; PLAN: r0=8(x), r1=97(y), r2=89(width), r3=18(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 8
LDI r1, 97
LDI r2, 89
LDI r3, 18
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
