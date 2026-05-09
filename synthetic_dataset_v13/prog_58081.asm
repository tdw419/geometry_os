; DESCRIPTION: Renders a blue box of size 76x40 starting at (139, 110).
; PLAN: r0=139(x), r1=110(y), r2=76(width), r3=40(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 110
LDI r2, 76
LDI r3, 40
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
