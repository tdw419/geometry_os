; DESCRIPTION: Renders a green box of size 17x119 starting at (139, 3).
; PLAN: r0=139(x), r1=3(y), r2=17(width), r3=119(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 139
LDI r1, 3
LDI r2, 17
LDI r3, 119
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
