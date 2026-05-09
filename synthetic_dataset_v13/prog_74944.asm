; DESCRIPTION: Renders a blue box of size 99x119 starting at (321, 49).
; PLAN: r0=321(x), r1=49(y), r2=99(width), r3=119(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 49
LDI r2, 99
LDI r3, 119
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
