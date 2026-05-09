; DESCRIPTION: Renders a green box of size 45x101 starting at (382, 110).
; PLAN: r0=382(x), r1=110(y), r2=45(width), r3=101(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 110
LDI r2, 45
LDI r3, 101
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
