; DESCRIPTION: Renders a blue box of size 11x94 starting at (310, 97).
; PLAN: r0=310(x), r1=97(y), r2=11(width), r3=94(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 310
LDI r1, 97
LDI r2, 11
LDI r3, 94
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
