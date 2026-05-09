; DESCRIPTION: Renders a black box of size 110x119 starting at (140, 97).
; PLAN: r0=140(x), r1=97(y), r2=110(width), r3=119(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 140
LDI r1, 97
LDI r2, 110
LDI r3, 119
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
